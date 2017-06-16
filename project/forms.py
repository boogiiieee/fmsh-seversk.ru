# -*- coding: utf-8 -*-

from django import forms
from django.utils.translation import ugettext_lazy as _
from captcha.fields import CaptchaField
from django.contrib.auth.forms import UserCreationForm

#Форма регистрации	
class RegistrationForm(UserCreationForm):
	level = forms.CharField(max_length=2, label=_("Class"))
	captcha = CaptchaField(label=_("Captcha cod"))
	
	def clean_level(self):
		level = self.cleaned_data['level']
		try: level = int(level)
		except ValueError:
			raise forms.ValidationError(_("This is not digits"))
		if not (7 <= level <= 12):
			raise forms.ValidationError(_("Level should be more than six and less than thirteen."))
		return level