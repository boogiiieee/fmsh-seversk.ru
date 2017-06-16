# -*- coding: utf-8 -*-

from django.shortcuts import render_to_response
from django.template import RequestContext, loader, RequestContext
from django.http import HttpResponseRedirect, Http404, HttpResponse
from django.contrib.sites.models import Site
from django.core.mail import send_mail
from django.utils.translation import ugettext_lazy as _
import datetime
import settings
from django.contrib.auth.decorators import login_required

from invitefriend.models import Friend
from invitefriend.forms import InviteForm

#######################################################################################################################
#######################################################################################################################

#Пригласить друга
@login_required
def invite(request, template, sendmail=True, extra_context=None, context_processors=None, template_loader=loader):
	if request.method == 'POST':
		f = Friend(user=request.user, created_at=datetime.datetime.now())
		form = InviteForm(request.POST, instance=f)
		if form.is_valid():
			form.save()

			current_site = Site.objects.get_current()

			if sendmail:
				send_mail(
					_('The invitation to a site %(domain)s from the %(user)s.') % {'domain': current_site.domain, 'user': request.user.username},
					_('The invitation to a site %(domain)s from the %(user)s.') % {'domain': current_site.domain, 'user': request.user.username},
					settings.DEFAULT_FROM_EMAIL,
					[f.email],					
				)
			return HttpResponseRedirect('/activity/invitefriend/thanks/')
	else:
		form = InviteForm()
		
	c = RequestContext(request, {'form':form}, context_processors)
	
	if extra_context:
		for key, value in extra_context.items():
			if callable(value): c[key] = value()
			else: c[key] = value
			
	t = template_loader.get_template(template)
	return HttpResponse(t.render(c))
	
#######################################################################################################################
#######################################################################################################################

#Страница окончания приглашения
@login_required	
def thanks(request, template, extra_context=None, context_processors=None, template_loader=loader):
	c = RequestContext(request, context_processors)
	if extra_context:
		for key, value in extra_context.items():
			if callable(value): c[key] = value()
			else: c[key] = value
	t = template_loader.get_template(template)
	return HttpResponse(t.render(c))
	
#######################################################################################################################
#######################################################################################################################
