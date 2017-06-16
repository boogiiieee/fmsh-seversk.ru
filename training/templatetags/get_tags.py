# -*- coding: utf-8 -*-
import os
from django import template


register = template.Library()

#Изменить урл
@register.filter(name='href_les')
def href_les(self, key):
	mas=self.split('/')
	# mas[5]=key
	# if mas[6]:
		# mas.pop(6)
	return '/'.join(mas)
