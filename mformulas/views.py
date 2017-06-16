# -*- coding: utf-8 -*-

from django.shortcuts import render_to_response
from django.template import RequestContext
from django.http import HttpResponseRedirect, HttpResponse, Http404
from django.template import Context
from django.template.loader import get_template
from django.views.decorators.cache import never_cache
from django.db.models.fields import CharField, TextField
from django.utils.safestring import mark_safe
import re

from mformulas.models import Formula, SearchFormula
from subject_user.models import Dictionary

#######################################################################################################################
#######################################################################################################################

#Возвращает форму выбора формул
@never_cache	
def select(request):
	objects = Formula.objects.filter(is_active=True)
	t = get_template('select.html')
	body = t.render(Context({'objects':objects}))
	response = HttpResponse(body)
	return response
	
#Выводтит словарь урока
@never_cache
def dictionary(request, template_name='lesson/dictionary_block.html'):
	formulas = None
	if 'model_name' in request.GET and 'obj_id' in request.GET:
		formulas_list = []
		formulas_list = SearchFormula.objects.filter(
			model_name = request.GET.get('model_name'),
			obj_id = int(request.GET.get('obj_id'))
		)
		if formulas_list:
			formulas = Dictionary.objects.filter(formula__in=[f.formula for f in formulas_list], user=request.user_anonymous)
	return render_to_response(template_name, {'formulas':formulas})

#######################################################################################################################
#######################################################################################################################

#Редактор Latex
def latex_editor(request):
	if 'id' in request.GET:
		pval, val = '', ''
		if 'val' in request.GET:
			val = request.GET.get('val')
		return render_to_response('latex_editor.html', {'id':request.GET.get('id'), 'val':val}, RequestContext(request))
	raise Http404()
	
#Предпросмотр Latex
def latex_preview(request):
	val = ''
	if 'val' in request.GET:
		val = request.GET.get('val')
	return render_to_response('latex_preview.html', {'val':val}, RequestContext(request))

#######################################################################################################################
#######################################################################################################################