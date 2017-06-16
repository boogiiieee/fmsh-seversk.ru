# -*- coding: utf-8 -*-

from django import template
from django.template import Node, NodeList, Template, Context, Variable
from django.template import TemplateSyntaxError
from django.template import get_library, Library, InvalidTemplateLibrary
from django.utils.translation import ugettext_lazy as _
from django.shortcuts import render_to_response
import settings
import os
import re

from mformulas.models import Formula, SearchFormula
from subject_user.models import Dictionary

register = template.Library()

#######################################################################################################################
#######################################################################################################################
	
class MFormulasDictionaryNode(Node):
	def __init__(self, data, template_name):
		self.data = template.Variable(data)
		self.template_name = template_name[1:-1]

	def render(self, context):
		data = self.data.resolve(context)
		
		formulas = None
		
		if data:
			formulas_list = []
			for d in data.items(): formulas_list += SearchFormula.objects.filter(model_name=d[0], obj_id__in=d[1])
			if formulas_list:
				formulas = Dictionary.objects.filter(formula__in=[f.formula for f in formulas_list], user=context['request'].user_anonymous)
		return render_to_response(self.template_name, {'formulas':formulas})._get_content()
		
def MFormulasDictionary(parser, token):
	'''
		Выводит блок "Личный словарь". На вход data и имя шаблона.
	'''
	bits = token.split_contents()
	if len(bits) != 3:
		raise TemplateSyntaxError(_("Error token tag \"MFormulasDictionary\""))
	return MFormulasDictionaryNode(bits[1], bits[2])
	
MFormulasDictionary = register.tag(MFormulasDictionary)

#######################################################################################################################
#######################################################################################################################