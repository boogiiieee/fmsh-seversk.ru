# -*- coding: utf-8 -*-

from django import template
from django.template import Node, NodeList, Template, Context, Variable
from django.template import TemplateSyntaxError
from django.template import get_library, Library, InvalidTemplateLibrary
from django.utils.safestring import mark_safe
import sys
import re

register = Library()

from subject_user.models import UserTask, UserLesson, UserTaskUSE, UserOffset, UserUse, UserTaskOffset
from subject.models import Lesson, USE_Task, Task, Lesson_Task

#######################################################################################################################
#######################################################################################################################	

#Создает переменную varx в шаблоне со значением
class VarNode(Node):
	def __init__(self, x):
		self.x = template.Variable(x)

	def render(self, context):
		context['varx'] = self.x.resolve(context)
		return u''

def Var(parser, token):
	bits = token.split_contents()
	if len(bits) != 2:
		raise TemplateSyntaxError(_("Error token tag \"Var\""))
	return VarNode(bits[1])

Var = register.tag(Var)

#Увеличивает переменную varx в шаблоне на 1
class IncVarNode(Node):
	def render(self, context):
		if 'varx' in context:
			context['varx'] = int(context['varx']) + 1
		return u''

def IncVar(parser, token):
	bits = token.split_contents()
	if len(bits) != 1:
		raise TemplateSyntaxError(_("Error token tag \"IncVar\""))
	return IncVarNode()

IncVar = register.tag(IncVar)

#######################################################################################################################
#######################################################################################################################

#Выводит ответ пользователя в виде формы
@register.filter(name='users_answer')
def users_answer(value, qs):
	return value.users_answer_form(qs)

###############################################
	
#Решена ли задача
class TaskLessonUserFoundNode(template.Node):
	def __init__(self, lesson, task):
		self.lesson = template.Variable(lesson)
		self.task = template.Variable(task)
	def render(self, context):
		if UserTask.objects.filter(task = self.task.resolve(context), user = context['request'].user_anonymous, lesson = self.lesson.resolve(context), is_executed = True).count() > 0:	
			return 'class="ok"'
		return ''

def TaskLessonUserFound(parser, token):
	bits = token.split_contents()
	if len(bits) != 3:
		raise TemplateSyntaxError(_("Error token tag \"TaskLessonUserFound\""))
	return TaskLessonUserFoundNode(bits[1],bits[2])

TaskLessonUserFound = register.tag(TaskLessonUserFound)	



#куплен ли ответ
@register.filter(name='buy_task')
def buy_task(value, who):
	if UserTask.objects.filter(task = value, user = who, buy_answer=True).count() > 0:
		return True
	return False
	
#Текст решения
@register.filter(name='get_text_solution')
def get_text_solution(lesson, task):
	try:
		return Lesson_Task.objects.get(lesson=lesson,task=task).text_solution
	except: pass	
	

#Процент выполнения урока
@register.filter(name='get_percent')
def get_percent(self, anonymous):
	try:
		return self.userlesson_set.filter(user=anonymous)[0].percent
	except: return 0

#Освоен/На освоении урок
@register.filter(name='is_mastered')
def is_mastered(lesson, who):
	if UserLesson.objects.filter(lesson = lesson,user = who,is_mastered = True).count() > 0:
		return 'is_master'
	else:
		if UserLesson.objects.filter(lesson = lesson,user = who,is_development = True).count() > 0:
			return 'is_development'
		else:return ''





###########################################################################################################
#ЕГЭ
###########################################################################################################
#Освоено ЕГЭ
@register.filter(name='use_is_mastered')
def use_is_mastered(use, who):
	if UserUse.objects.filter(use = use,user = who,is_executed = True).count() > 0:
		return 'is_master'
	else:return ''	

	
#Верный ли ответ Егэ
class TaskUseUserFoundNode(template.Node):
	def __init__(self, use, task):
		self.use = template.Variable(use)
		self.task = template.Variable(task)
	def render(self, context):
		obj = UserTaskUSE.objects.filter(task = self.task.resolve(context), user_use__user = context['request'].user_anonymous, user_use__use = self.use.resolve(context))
		if obj.count() > 0:	
			if obj.filter(is_executed = True).count() > 0:
				return 'answerr green'
			if obj.all().exclude(answer = '').count() > 0:
				return 'answerr'
		return ''

def TaskUseUserFound(parser, token):
	bits = token.split_contents()
	if len(bits) != 3:
		raise TemplateSyntaxError(_("Error token tag \"TaskUseUserFound\""))
	return TaskUseUserFoundNode(bits[1],bits[2])

TaskUseUserFound = register.tag(TaskUseUserFound)
		
#ответ Егэ
class UseUserFoundNode(template.Node):
	def __init__(self, use, task):
		self.use = template.Variable(use)
		self.task = template.Variable(task)
	def render(self, context):
		if UserTaskUSE.objects.filter(task = self.task.resolve(context), user_use__user = context['request'].user_anonymous, user_use__use = self.use.resolve(context)).exclude(answer = '').count() > 0:	
			return self.task.resolve(context).users_answer_form(UserTaskUSE.objects.filter(task = self.task.resolve(context), user_use__user = context['request'].user_anonymous, user_use__use = self.use.resolve(context)).order_by('-id')[0].answer,'')
		else:
			html = ''
			for i in self.task.resolve(context).get_version_answer():
				iname = 'answer_%s'% i.id
				if i.type_answer != 'text':
					if i.type_answer == 'radio':
						iname = 'answer'
					if i.type_answer == 'text':
						iname = 'answer_0'
					ilabel = '<label class="f_left" for="answer_%(id)d" tabindex="%(id)d">%(answer)s</label>' % {'id':i.id, 'answer':i.answer}
					html+="<tr><td><input class='f_left' id='answer_%d' type='%s' name='%s' value='%s'/></td><td>%s<div class='clr'></div></td></tr>" %(i.id, i.type_answer, iname, i.answer, ilabel)
				else:
					ilabel = ''
					html+="<tr><td><input class='f_left' id='answer_%d' type='%s' name='%s'/></td><td>%s<div class='clr'></div></td></tr>" %(i.id, i.type_answer, iname, ilabel)
			return '%s' % html

def UseUserFound(parser, token):
	bits = token.split_contents()
	if len(bits) != 3:
		raise TemplateSyntaxError(_("Error token tag \"TaskLessonUserFound\""))
	return UseUserFoundNode(bits[1],bits[2])

UseUserFound = register.tag(UseUserFound)

def TaskUseUserFound(parser, token):
	bits = token.split_contents()
	if len(bits) != 3:
		raise TemplateSyntaxError(_("Error token tag \"TaskLessonUserFound\""))
	return TaskUseUserFoundNode(bits[1],bits[2])

TaskUserUseFound = register.tag(TaskUseUserFound)		
	
###########################################################################################################
#Зачет
###########################################################################################################
#Сдан ли зачет
@register.filter(name='offset_sdan')
def offset_sdan(offset, who):
	if UserOffset.objects.filter(offset = offset,user = who,is_executed = True).count() > 0:
		return True
	return False	
	
#Отвечали ли на задачу в зачете
class TaskOffsetUserFoundNode(template.Node):
	def __init__(self, offset, task):
		self.offset = template.Variable(offset)
		self.task = template.Variable(task)
	def render(self, context):
		if UserTaskOffset.objects.filter(task = self.task.resolve(context), user_task_offset__user = context['request'].user_anonymous, user_task_offset__offset = self.offset.resolve(context)).count() > 0:	
			return 'answerr'
		return ''

def TaskOffsetUserFound(parser, token):
	bits = token.split_contents()
	if len(bits) != 3:
		raise TemplateSyntaxError(_("Error token tag \"TaskOffsetUserFoundNode\""))
	return TaskOffsetUserFoundNode(bits[1],bits[2])

TaskUserUseFound = register.tag(TaskOffsetUserFound)
	
#Освоен зачет
@register.filter(name='offset_is_mastered')
def offset_is_mastered(offset, who):
	if UserOffset.objects.filter(offset = offset,user = who,is_executed = True).count() > 0:
		return 'is_master'
	else:return ''	
	
