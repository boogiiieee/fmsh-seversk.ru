# -*- coding: utf-8 -*-

from django.contrib import admin
from django.utils.translation import ugettext_lazy as _
import settings
from django import forms

from admintrans.admin import *
from mformulas.models import Formula, SearchFormula, PrimitiveOfFormulaTask, FormulaTaskQuestion, FormulaTaskAnswer
from mformulas.widgets import LatexFieldWidget

#######################################################################################################################
#######################################################################################################################

class FormulaAdminForm(forms.ModelForm):
	class Meta:
		model = Formula
		widgets = {
			'tex': LatexFieldWidget()
		}
		
class FormulaAdmin(admin.ModelAdmin):
	list_display = ('title', 'tex', 'get_formula', 'is_active', 'sort')
	search_fields = ('title', 'tex')
	list_filter = ('is_active',)
	list_editable = ('is_active', 'sort')
	form = FormulaAdminForm
	
	class Media:
		js = [
			'%smathjax/MathJax.js?config=TeX-AMS_HTML-full' % settings.STATIC_URL,
			'%sjs/mathjax.js' % settings.STATIC_URL
		]

admin.site.register(Formula, FormulaAdmin)

#######################################################################################################################
#######################################################################################################################



#######################################################################################################################
#######################################################################################################################

class SearchFormulaAdmin(admin.ModelAdmin):
	list_display = ('formula', 'model_name', 'field_name', 'obj_id', 'link')
	search_fields = ('formula__tex', 'model_name', 'field_name', 'link')

#admin.site.register(SearchFormula, SearchFormulaAdmin)

#######################################################################################################################
#######################################################################################################################



#######################################################################################################################
#######################################################################################################################

class PrimitiveOfFormulaTaskAdmin(admin.ModelAdmin):
	list_display = ('expression', 'is_active', 'sort')
	search_fields = ('expression',)
	list_filter = ('is_active',)
	list_editable = ('is_active', 'sort')

admin.site.register(PrimitiveOfFormulaTask, PrimitiveOfFormulaTaskAdmin)

#######################################################################################################################
#######################################################################################################################

class FormulaTaskAnswerAdminForm(forms.ModelForm):
	class Meta:
		model = FormulaTaskAnswer
		widgets = {
			'answer_tex': LatexFieldWidget()
		}
		
class FormulaTaskAnswerAdmin(admin.ModelAdmin):
	list_display = ('get_answer', 'get_question', 'is_true', 'is_active', 'sort')
	list_filter = ('is_true', 'is_active')
	list_editable = ('is_true', 'is_active', 'sort')
	form = FormulaTaskAnswerAdminForm
	
	class Media:
		js = [
			'%smathjax/MathJax.js?config=TeX-AMS_HTML-full' % settings.STATIC_URL,
			'%sjs/mathjax.js' % settings.STATIC_URL
		]

admin.site.register(FormulaTaskAnswer, FormulaTaskAnswerAdmin)

#######################################################################################################################
#######################################################################################################################

class FormulaTaskQuestionAdminForm(forms.ModelForm):
	class Meta:
		model = FormulaTaskQuestion
		widgets = {
			'question_tex': LatexFieldWidget(),
		}
		
class FormulaTaskAnswerInline(admin.TabularInline):
	model = FormulaTaskAnswer
	max_num = 5
	extra = 5
	
	def formfield_for_dbfield(self, db_field, **kwargs):
		if db_field.name == 'answer_tex':
			kwargs['widget'] = LatexFieldWidget()
		return super(FormulaTaskAnswerInline,self).formfield_for_dbfield(db_field,**kwargs)

class FormulaTaskQuestionAdmin(admin.ModelAdmin):
	inlines = [FormulaTaskAnswerInline,]
	list_display = ('get_question_text', 'formula', 'get_question', 'get_question_answer', 'is_active', 'sort')
	search_fields = ('question', 'question_tex')
	list_filter = ('is_active',)
	list_editable = ('is_active', 'sort')
	form = FormulaTaskQuestionAdminForm
	
	class Media:
		js = [
			'%smathjax/MathJax.js?config=TeX-AMS_HTML-full' % settings.STATIC_URL,
			'%sjs/mathjax.js' % settings.STATIC_URL
		]

admin.site.register(FormulaTaskQuestion, FormulaTaskQuestionAdmin)

#######################################################################################################################
#######################################################################################################################