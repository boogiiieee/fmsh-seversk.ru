# -*- coding: utf-8 -*-

from django import template
from django.template import Node, NodeList, Template, Context, Variable
from django.template import TemplateSyntaxError
from django.template import get_library, Library, InvalidTemplateLibrary
from django.utils.translation import ugettext_lazy as _
import settings
import os
import re

from mformulas.models import Formula
from mformulas.helper import TextToMFormula, TextToLinkSubject

register = template.Library()

#######################################################################################################################
#######################################################################################################################

#Фильтр находит токены формулы в тексте и заменяет их на формулы
@register.filter(name='MFormula')
def MFormula(self):
	return TextToMFormula(self)
	
#######################################################################################################################
#######################################################################################################################

#Фильтр находит токены ссылок на формулы в тексте и добавляет гет параметр предмет
@register.filter(name='MFLinjSubject')
def MFLinjSubject(self, subject):
	return TextToLinkSubject(self, subject)

#######################################################################################################################
#######################################################################################################################

#Подключает необходимые js для работы приложения
class MFormulasMediaNode(Node):
	def __init__(self):
		pass

	def render(self, context):
		return u'''
			<script type="text/javascript" src="%(static)smathjax/MathJax.js?config=TeX-AMS_HTML-full"></script>
			<script type="text/javascript" src="%(static)sjs/mathjax.js"></script>
			<link rel="stylesheet" type="text/css" href="%(static)scss/style.css">
			<script>
				MathJax.Hub.Config({
					"HTML-CSS": {
						width: "20px",
						scale: 80
					}
				});
			</script>
		''' % {'static':settings.STATIC_URL}

def MFormulasMedia(parser, token):
	bits = token.split_contents()
	if len(bits) > 1:
		raise TemplateSyntaxError(_("Error token tag \"MFormulasMedia\""))
	return MFormulasMediaNode()

register.tag('MFormulasMedia', MFormulasMedia)

#######################################################################################################################
#######################################################################################################################

#Выводит формулу с заданным id
class MFormulasCreateNode(Node):
	def __init__(self, id):
		self.id = template.Variable(id)

	def render(self, context):
		try:
			f = Formula.objects.get(id=self.id.resolve(context))
		except Formula.DoesNotExist:
			return u''
		else:
			return u'$$%s$$' % f.tex
		
def MFormulasCreate(parser, token):
	bits = token.split_contents()
	if len(bits) < 2:
		raise TemplateSyntaxError(_("Error token tag \"MFormulasCreate\""))
	return MFormulasCreateNode(bits[1])
	
MFormulasCreate = register.tag(MFormulasCreate)

#######################################################################################################################
#######################################################################################################################