# -*- coding: utf-8 -*-

from django import forms
from django.forms.util import flatatt
from django.utils.html import escape
from django.utils.text import truncate_words
from django.utils.translation import ugettext as _
from django.utils.safestring import mark_safe
from django.utils.encoding import force_unicode
import settings
import string
import random

#######################################################################################################################
#######################################################################################################################

def GenID(size=20, allowed = string.ascii_letters):
	return ''.join([allowed[random.randint(0, len(allowed) - 1)] for x in xrange(size)])
	
#Вставляет кнопку редактора Latex
class LatexFieldWidget(forms.TextInput):
	def __init__(self, attrs=None):
		final_attrs = {'id':'vLatexField_id', 'class':'vLatexField'}
		if attrs is not None:
			final_attrs.update(attrs)
		super(LatexFieldWidget, self).__init__(attrs=final_attrs)
		
	def render(self, name, value, attrs=None):
		id = '%s' % GenID()
		attrs['id'] = id
		widget = super(forms.TextInput, self).render(name, value, attrs)
		return mark_safe(
			u'''
				%(widget)s&nbsp;<a href="#" onclick="latex_editor_%(id)s()"><img src="%(static)simg/latex.png" alt="Latex" /></a>
				<script type="text/javascript">
					function latex_editor_%(id)s() {
						mw = screen.availWidth;
						mh = screen.availHeight;
						w = 740;
						h = 480;
						val = document.getElementById("%(id)s").value;
						val = encodeURIComponent(val);
						win = window.open('/mformulas/latex_editor/?id=%(id)s&val='+val+'', '_blank', 'width='+w+',height='+h+',left='+((mw-w)/2)+',top='+((mh-h)/2)+',scrollbars=no');
						win.focus(); 
						return false;
					}
				</script>
			''' % {'widget':widget, 'id':id, 'static':settings.STATIC_URL}
		)
		
#######################################################################################################################
#######################################################################################################################