# -*- coding: utf-8 -*-

from django import template
from django.template import Node, NodeList, Template, Context, Variable
from django.template import TemplateSyntaxError, VariableDoesNotExist, BLOCK_TAG_START, BLOCK_TAG_END, VARIABLE_TAG_START, VARIABLE_TAG_END, SINGLE_BRACE_START, SINGLE_BRACE_END, COMMENT_TAG_START, COMMENT_TAG_END
from django.template import get_library, Library, InvalidTemplateLibrary
from django.template import resolve_variable
from django.core.cache import cache
from django.utils.encoding import force_unicode
from django.utils.http import urlquote
from django.utils.hashcompat import md5_constructor

register = template.Library()

class get_url_node(Node):
	def __init__(self, opt, val, com, v):
		self.opt = opt
		self.val = val
		
		self.com = com
		self.v = v

	def render(self, context):
		g = context['request'].GET
		u = g.urlencode()
		
		if self.com == 'delete-key' and self.v:
			if u:
				e = g.copy()
				if self.v in u:
					del e[self.v]
					g = e
					
		u = g.urlencode()
		
		try:
			val = template.Variable(self.val).resolve(context)
			
			if val == 'none':
				if u:
					e = g.copy()
					if self.opt in u:
						del e[self.opt]
					return u'?%s' % e.urlencode()
				else:
					return u''
		except:
			val = self.val
			
		if u:
			if self.opt in u:
				if val == g.get(self.opt):
					return u'?%s' % u
				else:
					e = g.copy()
					e[self.opt] = val
					return u'?%s' % e.urlencode()
			else:
				return u'?%s&%s=%s' % (u, self.opt, val)
		else:
			return u'?%s=%s' % (self.opt, val)
		
def get_url(parser, token):
	bits = token.split_contents()
	if len(bits) < 3:
		raise TemplateSyntaxError(u'error token tag "get_url"')
		
	try:
		com = bits[3][1:-1]
		var = bits[4]
	except:
		com = None
		var = None
		
	return get_url_node(bits[1][1:-1], bits[2], com, var)
	
get_url = register.tag(get_url)