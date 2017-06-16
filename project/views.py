# -*- coding: utf-8 -*-

from django.http import HttpResponseBadRequest, HttpResponseRedirect, HttpResponse, Http404
from django.shortcuts import render_to_response, get_object_or_404
from django.template import RequestContext
import datetime
import settings
from django.contrib import auth
import uuid
from django.contrib.auth.models import User

from configuration.models import ConfigModel
from robokassa.forms import RobokassaForm
from project.forms import RegistrationForm

#######################################################################################################################
#######################################################################################################################

#Регистрация
def register(request):
	if request.method == 'POST':
		form = RegistrationForm(request.POST)
		if form.is_valid():
			cd = form.cleaned_data
			new_user = form.save()
			new_prof = new_user.get_profile()
			
			try: level = int(cd['level'])
			except ValueError: level = 7
			new_prof.level = level
			new_prof.save()
			
			user = auth.authenticate(username=cd['username'], password=cd['password1'])
			auth.login(request, user)
			return HttpResponseRedirect('order/%d/' % user.id)
	else:
		form = RegistrationForm()
	return render_to_response('registration/registration_form.html', locals(), RequestContext(request))
	
#######################################################################################################################
#######################################################################################################################

#Оплата регистрации
def order(request, template, user_id=None, type=0):
	'''
		0 - регистрация, 1 - продление, 2 - решение задачи
	'''
	type = int(type)
		
	if request.user.is_authenticated(): user = request.user
	elif user_id: user = get_object_or_404(User, pk=user_id)
	else: raise Http404()
	
	cfg = ConfigModel.objects.all()[0]
	
	if type == 0: 
		msg = u'Регистрация пользователя'
		cost = cfg.cost_registration
	elif type == 1: 
		msg = u'Продление регистрации пользователя'
		cost = cfg.cost_extension
	elif type == 2: 
		msg = u'Покупка решения задачи пользователем'
		cost = cfg.cost_analysis
	else: raise Http404()
	
	initial = {
		'OutSum': cost,
		'InvId': 0,
		'Desc': u'%s "%s"' % (msg, user.username),
		#'Email': request.user.email,
		# 'IncCurrLabel': '',
		'Culture': 'ru',
		
		'uid':str(user.id),
		'lesson':'',
		'task':'',
		'back':'',
	}
	
	if type == 2 and 'lesson' in request.GET and 'task' in request.GET and 'back' in request.GET:
		initial['lesson'] = request.GET.get('lesson')
		initial['task'] = request.GET.get('task')
		initial['back'] = request.GET.get('back')
	
	form = RobokassaForm(initial = initial)
	return render_to_response(template, locals(), RequestContext(request))
	
#######################################################################################################################
#######################################################################################################################