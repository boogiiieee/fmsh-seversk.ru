# -*- coding: utf-8 -*-

from django.contrib.auth.models import User
from django import forms
from django.utils.translation import ugettext_lazy as _
from django.forms.models import inlineformset_factory
import re

from configuration.models import ConfigModel, ConfigLevelModel

#######################################################################################################################
#######################################################################################################################

class ConfigLevelFormset(inlineformset_factory(ConfigModel, ConfigLevelModel, can_delete=True, extra=12)):
    pass
	
class ConfigLevelForm(forms.ModelForm):
	class Meta:
		model = ConfigModel
		
#Форма настроек
class ConfigForm(forms.ModelForm):
	class Meta:
		model = ConfigModel
		
#######################################################################################################################
#######################################################################################################################