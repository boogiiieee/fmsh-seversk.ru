# -*- coding: utf-8 -*-

from django import template
from django.template import Node, NodeList, Template, Context, Variable
from django.template import TemplateSyntaxError
from django.template import get_library, Library, InvalidTemplateLibrary
from django.utils.translation import ugettext_lazy as _
from django.db.models import Q
from django.shortcuts import render_to_response
import settings
import os
import re

register = template.Library()

from profiles.models import UserAnonymous

#######################################################################################################################
#######################################################################################################################

#Среднее кол-во просмотренных уроков
@register.filter(name='avg_statistics')
def avg_statistics(self, field):
	count = UserAnonymous.objects.all().exclude(user__is_staff=True).count()
	res = 0
	for item in self:
		if hasattr(item, field):
			res += getattr(item, field)
	if count>0: return res / count
	else: return 0

#######################################################################################################################
#######################################################################################################################