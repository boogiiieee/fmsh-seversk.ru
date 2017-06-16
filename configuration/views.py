# -*- coding: utf-8 -*-

from django.shortcuts import render_to_response
from django.template import RequestContext
from django.utils.translation import ugettext_lazy as _
from django.contrib.auth.decorators import login_required
from django.contrib import messages
import datetime
from django.http import HttpResponseRedirect, Http404

from admin_tools.dashboard.modules import DashboardModule

from configuration.models import ConfigModel
from configuration.forms import ConfigForm, ConfigLevelForm, ConfigLevelFormset

#######################################################################################################################
#######################################################################################################################

#Модуль настроек для Dashboard
class ConfigModule(DashboardModule):
	def is_empty(self):
		pass

	def __init__(self, **kwargs):
		super(ConfigModule, self).__init__(**kwargs)
		self.title = _('Configuration')
		self.template = 'blocks/configuration.html'

		c, create = ConfigModel.objects.get_or_create(id=1)
		self.form = {'form1':ConfigForm(instance=c), 'form2':ConfigLevelForm(instance=c), 'formset':ConfigLevelFormset(instance=c)}
		
#######################################################################################################################
#######################################################################################################################

#Сохранение настроек
@login_required
def save_config(request):
	if request.user.is_superuser:
		if request.method == "POST":
			c, create = ConfigModel.objects.get_or_create(id=1)
			form1 = ConfigForm(request.POST, instance=c)
			form2 = ConfigLevelForm(request.POST, instance=c)
			formset = ConfigLevelFormset(request.POST, instance=c)
			if form1.is_valid() and form2.is_valid() and formset.is_valid():
				form1.save()
				form2.save()
				formset.save()
				messages.add_message(request, messages.INFO, _("Save form configuration."))
				return HttpResponseRedirect('/admin/')
		messages.add_message(request, messages.ERROR, _("Error save form configuration."))
		return HttpResponseRedirect('/admin/')
	raise Http404()
	
#######################################################################################################################
#######################################################################################################################