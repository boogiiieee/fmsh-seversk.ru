# -*- coding: utf-8 -*-

from django import forms
from django.utils.translation import ugettext_lazy as _
import re

from invitefriend.models import Friend

#######################################################################################################################
#######################################################################################################################

class InviteForm(forms.ModelForm):
	class Meta:
		model = Friend
		fields = ('email',)
		
	def clean_email(self): 
		email = self.cleaned_data['email']
		r = re.compile('^[0-9a-zA-Z]+[-\._0-9a-zA-Z]*@[0-9a-zA-Z]+[-\._^0-9a-zA-Z]*[0-9a-zA-Z]+[\.]{1}[a-zA-Z]{2,6}$')
		if not r.findall(email):
			raise forms.ValidationError(_("Invalid email field"))
		return email
		
#######################################################################################################################
#######################################################################################################################