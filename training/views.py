# -*- coding: utf-8 -*-

from django.shortcuts import render_to_response
from django.template import RequestContext
from django.http import HttpResponseRedirect, HttpResponse, Http404
from django.db.models import Q
import datetime
from decimal import Decimal

from subject_user.models import Dictionary
from subject.models import Subject
from mformulas.models import FormulaTaskAnswer
from configuration.models import ConfigModel
from training.models import TrainingFormulas, TrainingOnlineDayUser
from training.conf import settings as conf

#######################################################################################################################
#######################################################################################################################

#Тренировка
def training_start(request):
	if request.user_anonymous:
		try: time_lim = ConfigModel.objects.all()[0].duration_training_unregistered_user
		except: time_lim = 10000
		
		try: anonym_time = TrainingOnlineDayUser.objects.get(user=request.user_anonymous, day=datetime.datetime.now()).duration_of_visits
		except: anonym_time = 0

		if request.user_anonymous.is_anonymous and anonym_time > Decimal(time_lim, 2):
			#Превышен лимит времени для незарегестрированного пользователя
			return render_to_response('training_lim.html', RequestContext(request))
		
		info = True
		page = 1
		
		if request.method == 'GET':
			if 'subject_name' in request.GET:
				subject_name = request.GET.get('subject_name')
				info = False
			if 'page' in request.GET:
				try:
					page = int(request.GET.get('page'))
				except:
					pass
				
		if info:
			#Входная страница
			return render_to_response('training_info.html', RequestContext(request))
			
		s = Subject.objects.get(slug=subject_name)
			
		ex = TrainingFormulas.objects.filter(
			Q(is_learned=True) | 
			Q(last_attempt__gt=datetime.datetime.now()-datetime.timedelta(minutes=conf.MATURING_TIME*60)) |
			Q(right_answers__gte=conf.RIGHT_ANSWERS)
		).values('dictionary')
		
		d = Dictionary.objects.filter(user=request.user_anonymous, subject=s).exclude(id__in=ex).order_by('id')
		for el in d:
			if not el.formula.has_question(): d = d.exclude(id=el.id)
		
		if d.count() < conf.QUANTITY_OF_FORMULAS - page + 1:
			#Недостаточно формул для тренировки
			return render_to_response('training_not_formulas.html', RequestContext(request))
			
		if page <= conf.QUANTITY_OF_FORMULAS:
			#Тренировка
			try: d = d[0]
			except: raise Http404("Error 0001 in Training app.")
			try: question = d.formula.questions.filter(is_active=True).order_by('?')[0]
			except: raise Http404("Error 0002 in Training app.")
			return render_to_response('training_start.html', {'dictionary': d, 'question': question, 'next_page': page+1}, RequestContext(request))
		else:
			#Тренировка завершена
			t = TrainingFormulas.objects.filter(dictionary__user=request.user_anonymous, dictionary__subject=s).order_by('-id')[:conf.QUANTITY_OF_FORMULAS]
			
			right_answer = 0
			for el in t:
				if el.is_right_last_answer: right_answer += 1
				
			nm = {'n':right_answer, 'm':conf.QUANTITY_OF_FORMULAS}
			return render_to_response('training_finish.html', {'training':t, 'nm':nm}, RequestContext(request))
	raise Http404("Error 0000 in Training app.")
	
#######################################################################################################################
#######################################################################################################################

#Проверяет ответ пользователя и записывает результат в БД
def training_check(request, dictionary_id, question_id, answer_id):
	if request.is_ajax():
		try: a = FormulaTaskAnswer.objects.get(question__id=question_id, is_true=True)
		except: raise Http404("Error 0003 in Training app.")
		
		t, create = TrainingFormulas.objects.get_or_create(dictionary=Dictionary.objects.get(id=dictionary_id))
		t.last_attempt = datetime.datetime.now()
		t.number_attempts += 1
		t.is_right_last_answer = False
		
		if a.id == int(answer_id):
			t.right_answers += 1
			t.is_right_last_answer = True
			if t.right_answers >= conf.RIGHT_ANSWERS:
				t.is_learned = True
				
		t.save()
		return HttpResponse(str(a.id))
	return HttpResponse(status=400)

#######################################################################################################################
#######################################################################################################################



#######################################################################################################################
#######################################################################################################################

#Следит за активностью пользователя
def is_online(request):
	if request.is_ajax():
		now = datetime.datetime.now()
		d, create = TrainingOnlineDayUser.objects.get_or_create(user=request.user_anonymous, day=now)
		if d.last_activity:
			interval = now - d.last_activity
			if interval.seconds <= 2 * conf.ACTIVITY:
				d.duration_of_visits += Decimal(interval.seconds, 2) / 60
		d.last_activity = datetime.datetime.now()
		d.save()
		return HttpResponse('1')
	else:
		return HttpResponse(status=400)

#######################################################################################################################
#######################################################################################################################