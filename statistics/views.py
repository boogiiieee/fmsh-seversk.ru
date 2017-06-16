# -*- coding: utf-8 -*-

from django.shortcuts import render_to_response
from django.template import RequestContext, loader, RequestContext
from django.http import HttpResponseRedirect, Http404, HttpResponse
from django.contrib.sites.models import Site
from django.core.mail import send_mail
from django.utils.translation import ugettext_lazy as _
from django.db.models import Q
from django.db.models import Avg, Max, Min, Count, Sum
from django.contrib.auth.decorators import login_required
import datetime
import settings

from profiles.models import UserAnonymous
from statistics.models import StatisticsDayUser as St
from statistics.conf import settings as statistics_conf
from subject.models import Subject
from configuration.models import ConfigModel

COUNT_POINT_CHART = 10 #Кол-во точек на графике
COUNT_ACTICITY_DAYS = 7 #Кол-во дней за которые выводить активность

#######################################################################################################################
#######################################################################################################################

#Статистика пользователя
def get_statistics(st_date, sp_date, user_anonymous, subject_name, olympiad=False):
	obj = Subject.objects.get(is_active=True, slug=subject_name)
	
	sall = St.objects.filter(Q(user=user_anonymous) & Q(subject__slug=subject_name))
	s = sall.filter(Q(day__gte=st_date) & Q(day__lte=sp_date))
	
	if olympiad:
		sall = sall.filter(subject__is_olympiad=True)
		s = s.filter(subject__is_olympiad=True)
	
	sall_time, sall_lessons_learned, sall_tasks_correct, sall_added_formulas = 0, 0, 0, 0
	for sa in sall:
		if sa.get_onlineuser():
			sall_time += sa.get_onlineuser().duration_of_visits
		sall_lessons_learned += sa.lessons_learned
		sall_tasks_correct += sa.tasks_correct
		sall_added_formulas += sa.added_formulas
		
	sall=[{'time':sall_time,'lessons_learned':sall_lessons_learned,'tasks_correct':sall_tasks_correct,'added_formulas':sall_added_formulas}]
	
	#Создание графиков
	conf,create = ConfigModel.objects.get_or_create(id=1)
	step = (sp_date - st_date).days / COUNT_POINT_CHART
	if step < 1: step = 1

	charts = []
	
	d_list, f_list, pf_list, l_list, pl_list = [], [], [], [], []
	
	d_right = sp_date
	while d_right >= st_date:
		d_left = d_right - datetime.timedelta(days=step-1)
		if d_left < st_date:
			d_left = st_date
			d_list.append(d_left.strftime("%d.%m.%y"))
		else:
			d_list.append(d_right.strftime("%d.%m.%y"))
			
		s_interval = s.filter(Q(subject=obj) & Q(day__gte=d_left) & Q(day__lte=d_right)).values('subject')
		
		try: learned_formulas = int(s_interval.annotate(savg = Avg('learned_formulas')).order_by()[0]['savg'])
		except: learned_formulas = 0
		
		try: lessons_learned = int(s_interval.annotate(savg = Avg('lessons_learned')).order_by()[0]['savg'])
		except: lessons_learned = 0
		
		f_list.append(learned_formulas)
		l_list.append(lessons_learned)
		
		d_right -= datetime.timedelta(days=step)
		
	d_list.reverse()
	f_list.reverse()
	
	plan = conf.get_plan_for_level(user_anonymous.get_level())
	plan_lessons, plan_formulas = 0, 0
	if plan:
		if plan.plan_lessons: plan_lessons = plan.plan_lessons
		if plan.plan_formulas: plan_formulas = plan.plan_formulas
	
	pf_list = [plan_formulas]*len(d_list)
	l_list.reverse()
	pl_list = [plan_lessons]*len(d_list)
	
	learned_list = [ (f_list[i] + l_list[i]) / 2 for i in range(0,len(d_list)) ]
	plan_list = [ (pf_list[i] + pl_list[i]) / 2 for i in range(0,len(d_list)) ]
	
	charts.append({
		'id': obj.id,
		'title': obj.title,
		'xAxis_categories': d_list,
		'yAxis_title_text': _("It is mastered"),
		'series': [
			{'name':_("Learned"), 'data':learned_list},
			{'name':_("Plan"), 'data':plan_list},
			
			# {'name':_("Learned formulas"), 'data':f_list},
			# {'name':_("Plan formulas"), 'data':pf_list},
			# {'name':_("Lessons learned"), 'data':l_list},
			# {'name':_("Plan lessons"), 'data':pl_list},
		],
	})
		
	if s.count() > 30: s = s[:30]
	return [s, sall, charts]

def statistics_views(request, template='statistics.html', extra_context=None, context_processors=None, template_loader=loader):
	st_date, sp_date = datetime.datetime.now() - datetime.timedelta(days=statistics_conf.INTERVAL), datetime.datetime.now()
	
	if 'subject_name' in request.GET:
		subject_name = request.GET.get('subject_name')
	else:
		try: subject_name = Subject.objects.filter(is_active=True, is_olympiad=False)[0].slug
		except: raise Http404()
		else: return HttpResponseRedirect('?subject_name=%s' % subject_name)
	
	if 'st_date' in request.GET:
		if request.GET.get("st_date"):
			st_date = datetime.datetime.strptime(request.GET.get("st_date"), "%d.%m.%Y")
	if 'sp_date' in request.GET:
		if request.GET.get("sp_date"):
			sp_date = datetime.datetime.strptime(request.GET.get("sp_date"), "%d.%m.%Y")
	
	[s,sall,charts] = get_statistics(st_date, sp_date, request.user_anonymous, subject_name)
	
	c = RequestContext(request, {'statistics':s, 'all_statistics':sall, 'charts':charts, 'st_date':st_date, 'sp_date':sp_date, 'subject_name':subject_name}, context_processors)
	
	if extra_context:
		for key, value in extra_context.items():
			if callable(value):
				c[key] = value()
			else:
				c[key] = value
			
	t = template_loader.get_template(template)
	return HttpResponse(t.render(c))
	
#######################################################################################################################
#######################################################################################################################

def olympiad_statistics_views(request, template='olympiad_statistics.html', extra_context=None, context_processors=None, template_loader=loader):
	st_date, sp_date = datetime.datetime.now() - datetime.timedelta(days=statistics_conf.INTERVAL), datetime.datetime.now()
	
	if 'subject_name' in request.GET:
		subject_name = request.GET.get('subject_name')
	else:
		try: subject_name = Subject.objects.filter(is_active=True, is_olympiad=True)[0].slug
		except: raise Http404()
		else: return HttpResponseRedirect('?subject_name=%s' % subject_name)
	
	if 'st_date' in request.GET:
		if request.GET.get("st_date"):
			st_date = datetime.datetime.strptime(request.GET.get("st_date"), "%d.%m.%Y")
	if 'sp_date' in request.GET:
		if request.GET.get("sp_date"):
			sp_date = datetime.datetime.strptime(request.GET.get("sp_date"), "%d.%m.%Y")
		
	[s,sall,charts] = get_statistics(st_date, sp_date, request.user_anonymous, subject_name, True)
	
	c = RequestContext(request, {'statistics':s, 'all_statistics':sall, 'st_date':st_date, 'sp_date':sp_date, 'subject_name':subject_name}, context_processors)
	
	if extra_context:
		for key, value in extra_context.items():
			if callable(value):
				c[key] = value()
			else:
				c[key] = value
			
	t = template_loader.get_template(template)
	return HttpResponse(t.render(c))
	
#######################################################################################################################
#######################################################################################################################

#Активность пользователей
@login_required
def activity_views(request, template='activity.html', olympiad=False, extra_context=None, context_processors=None, template_loader=loader):
	st_date, sp_date = datetime.datetime.now() - datetime.timedelta(days=COUNT_ACTICITY_DAYS), datetime.datetime.now()
	
	users = UserAnonymous.objects.filter(user__profiles__level=request.user_anonymous.user.get_profile().level)
	activity = St.objects.filter(Q(user__in=users) & Q(day__gte=st_date) & Q(day__lte=sp_date)).order_by('subject')
	
	if olympiad:
		activity = activity.filter(subject__is_olympiad=True)
	
	duration_of_visits = 0
	for u in users:
		if u.get_onlineuser():
			duration_of_visits += u.get_onlineuser(st_date, sp_date)
	duration_of_visits = int(duration_of_visits / users.count())
	
	c = RequestContext(request, {'activity':activity, 'duration_of_visits':duration_of_visits}, context_processors)
	
	if extra_context:
		for key, value in extra_context.items():
			if callable(value):
				c[key] = value()
			else:
				c[key] = value
			
	t = template_loader.get_template(template)
	return HttpResponse(t.render(c))

#######################################################################################################################
#######################################################################################################################