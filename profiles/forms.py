# -*- coding: utf-8 -*-

from django import forms
from django.utils.translation import ugettext_lazy as _
from captcha.fields import CaptchaField

#Форма отправки сообщения	
class MessageForUserForm(forms.Form):
	_selected_action = forms.CharField(widget=forms.MultipleHiddenInput)
	text = forms.CharField(max_length=1000, widget=forms.Textarea, label=_("Text"))
	
#Форма определения интервала дат статистики
class ReportActivityUserForm(forms.Form):
	_selected_action = forms.CharField(widget=forms.MultipleHiddenInput)
	st_date = forms.DateField(label=_("Start date"))
	sp_date = forms.DateField(label=_("Stop date"))