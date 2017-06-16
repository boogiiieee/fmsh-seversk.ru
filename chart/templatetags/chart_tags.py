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

register = template.Library()

#######################################################################################################################
#######################################################################################################################

#Подключает необходимые js для работы приложения
class ChartMediaNode(Node):
	def __init__(self):
		pass

	def render(self, context):
		return u'''
			<script type="text/javascript" src="%(static)sjs/highcharts/js/highcharts.js"></script>
			<script type="text/javascript" src="%(static)sjs/highcharts/js/modules/exporting.js"></script>
		''' % {'static':settings.STATIC_URL}

def ChartMedia(parser, token):
	bits = token.split_contents()
	if len(bits) > 1:
		raise TemplateSyntaxError(_("Error token tag \"ChartMedia\""))
	return ChartMediaNode()

register.tag('ChartMedia', ChartMedia)

#######################################################################################################################
#######################################################################################################################

#Выводит график
class ChartCreateNode(Node):
	def __init__(self, chart, size):
		self.chart = template.Variable(chart)
		try: self.size = size[1:-1].split("x")
		except: self.size = [400, 400]

	def render(self, context):
		chart = self.chart.resolve(context)
		return render_to_response('chart.html', {'chart':chart, 'size':self.size})._get_content()
		
def ChartCreate(parser, token):
	bits = token.split_contents()
	if len(bits) < 3:
		raise TemplateSyntaxError(_("Error token tag \"ChartCreate\""))
	return ChartCreateNode(bits[1], bits[2])
	
ChartCreate = register.tag(ChartCreate)