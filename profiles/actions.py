# -*- coding: utf-8 -*-

from django.http import HttpResponseBadRequest, HttpResponseRedirect, HttpResponse, Http404
from django.shortcuts import render_to_response
from django.template import RequestContext
from django.utils.translation import ugettext as _
from django.contrib import admin
import threading
import settings
import datetime
from django.core.mail import send_mail
from django.db.models import Q

from profiles.forms import MessageForUserForm, ReportActivityUserForm

##################################################################################################	
##################################################################################################

def task_send_mail(template, head, addresses, params):
	body = '%s' % render_to_response(template, locals())._get_content()
	t = threading.Thread(target=send_mail,args=[head, body, settings.DEFAULT_FROM_EMAIL, addresses])
	t.start()

#Отправить сообщение пользователям
def CreateMessageForUser(modeladmin, request, queryset):
	form = None
	if 'apply' in request.POST:
		form = MessageForUserForm(request.POST)

		if form.is_valid():
			text = form.cleaned_data['text']
			count = 0
			emails = []
			for u in queryset:
				if u.email: emails.append(u.email)
				count += 1
			task_send_mail('actions/email_message_for_user.txt', _('New message FMSH'), emails, {'text':text})
			modeladmin.message_user(request, _('Message "%(text)s" sent for %(count)d user(s).') % {'text':text, 'count':count})
			return HttpResponseRedirect(request.get_full_path())

	if not form:
		form = MessageForUserForm(initial={'_selected_action': request.POST.getlist(admin.ACTION_CHECKBOX_NAME)})

	return render_to_response('actions/message_for_user.html', {'items':queryset, 'form':form, 'title':_('Create message for users')}, RequestContext(request))

CreateMessageForUser.short_description = _('Create message for users')

##################################################################################################	
##################################################################################################

from statistics.models import StatisticsDayUser as St
from statistics.conf import settings as statistics_conf

#Активность пользователя
def ReportActivityUser(modeladmin, request, queryset):
	st_date, sp_date = datetime.datetime.now() - datetime.timedelta(days=statistics_conf.INTERVAL), datetime.datetime.now()
	
	form = None
	if 'apply' in request.POST:
		form = ReportActivityUserForm(request.POST)
		
		if form.is_valid():
			st_date = form.cleaned_data['st_date']
			sp_date = form.cleaned_data['sp_date']
			
	if not form:
		form = ReportActivityUserForm(initial={'_selected_action':request.POST.getlist(admin.ACTION_CHECKBOX_NAME), 'st_date':st_date, 'sp_date':sp_date})
	
	s = []
	for u in queryset:
		s.append([u, St.objects.filter(Q(user=u.Anonymous) & Q(day__gte=st_date) & Q(day__lte=sp_date))])

	return render_to_response('actions/report_activity_user.html', {
		'items':queryset, 'title':_('Create report activity users'), 'form':form, 's':s
	}, RequestContext(request))

ReportActivityUser.short_description = _('Create report activity users')

##################################################################################################	
##################################################################################################