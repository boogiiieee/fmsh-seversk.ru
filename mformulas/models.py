# -*- coding: utf-8 -*-

from django.db import models
from django.db.models.signals import post_save
from django.utils.translation import ugettext_lazy as _
import re
import random

#######################################################################################################################
#######################################################################################################################

#Формула
class Formula(models.Model):
	title = models.CharField(max_length=500, verbose_name=_("title"))
	tex = models.CharField(max_length=500, verbose_name=_("formula tex"))
	is_active = models.BooleanField(verbose_name=_("is active"), default=True)
	sort = models.IntegerField(verbose_name=_("sort"), default=0)
	
	def __unicode__(self):
		return u'%s' % self.title
		
	def get_formula(self):
		return u'$$%s$$' % self.tex
	get_formula.short_description = _("Get formula")
	
	def has_question(self):
		if self.questions.filter(is_active=True).count() > 0:
			return True
		return False
		
	class Meta: 
		verbose_name = _("formula") 
		verbose_name_plural = _("formulas")
		ordering = ['sort', 'id']
					
def create_formula(sender, instance, created, **kwargs):
	if created:
		primitive = PrimitiveOfFormulaTask.objects.filter(is_active=True).order_by("?")
		for p in primitive:
			regex = re.compile(r'(%s)' % p.expression)
			rlist = list(regex.finditer(instance.tex))
			if len(rlist):
				item = rlist[random.randint(0, len(rlist)-1)].span()
				question = instance.tex[:item[0]] + u'?' + instance.tex[item[1]:]
				answer = instance.tex[item[0]:item[1]]
				q = FormulaTaskQuestion.objects.create(formula=instance, question=u"Укажите недостающий элемент формулы", question_tex=question)
				FormulaTaskAnswer.objects.create(question=q, answer_tex=answer, is_true=True)
				break
 
post_save.connect(create_formula, sender=Formula)
		
#######################################################################################################################
#######################################################################################################################



#######################################################################################################################
#######################################################################################################################

class SearchFormula(models.Model):
	formula = models.ForeignKey(Formula, verbose_name=_("formula"))
	title = models.CharField(max_length=500, verbose_name=_("title"), blank=True)
	link = models.CharField(max_length=500, verbose_name=_("link"), blank=True)
	model_name = models.CharField(max_length=500, verbose_name=_("model name"))
	field_name = models.CharField(max_length=500, verbose_name=_("field name"))
	obj_id = models.IntegerField(verbose_name=_("object id"))
	
	def __unicode__(self):
		return u'%s -> %s' % (self.formula.title, self.model_name)
	
	class Meta: 
		verbose_name = _("search formula") 
		verbose_name_plural = _("search formulas")

#######################################################################################################################
#######################################################################################################################



#######################################################################################################################
#######################################################################################################################

#Примитивы формул
class PrimitiveOfFormulaTask(models.Model):
	expression = models.CharField(max_length=500, verbose_name=_("regular expression formula tex"), help_text=_("Shield special symbols. Don't forget that algorithm greedy."))
	is_active = models.BooleanField(verbose_name=_("is active"), default=True)
	sort = models.IntegerField(verbose_name=_("sort"), default=0)
	
	def __unicode__(self):
		return u'%s' % self.expression
	
	class Meta: 
		verbose_name = _("primitive of formula") 
		verbose_name_plural = _("primitive of formulas")

#######################################################################################################################
#######################################################################################################################

class FormulaTaskQuestion(models.Model):
	formula = models.ForeignKey(Formula, verbose_name=_("formula"), related_name="questions")
	question = models.TextField(max_length=1000, verbose_name=_("question"))
	question_tex = models.CharField(max_length=500, verbose_name=_("question tex"))
	is_active = models.BooleanField(verbose_name=_("is active"), default=True)
	sort = models.IntegerField(verbose_name=_("sort"), default=0)
	
	def __unicode__(self):
		return u'%s' % self.question_tex
		
	#Возвращает текст вопроса
	def get_question_text(self):
		return u'%s' % self.question
	get_question_text.short_description = _("Get question text")
		
	#Возвращает формулу вопроса
	def get_question(self):
		return u'$$%s$$' % self.question_tex
	get_question.short_description = _("Get question")
	
	#Генерирует список из правильных и неправильных ответов на вопрос
	def get_answers(self):
		a = self.answers.filter(question=self, is_active=True).order_by('is_true')
		answers_list = [ answer['answer_tex'] for answer in a.values('answer_tex') ]
		a = list(a)
		if len(a) < 5:
			b = list(FormulaTaskAnswer.objects.filter(is_active=True).exclude(answer_tex__in=answers_list).order_by('?'))
			if len(b) < 5-len(a): a = a + b
			else: a = a + b[:5-len(a)]
		if len(a) > 5:
			a = a[:5]
		random.shuffle(a)
		return a
	
	#Возвращает правильный ответ
	def get_true_answer(self):
		try: answer = self.answers.get(is_active=True, is_true=True)
		except: return False
		else: return answer
	
	#Выводит список ответов
	def get_question_answer(self):
		s = u''
		for answer in self.answers.filter(question=self, is_active=True):
			if answer.is_true: color = u'green'
			else: color = u'red'
			s += u'<li style="color:%s">$$%s$$</li>' % (color, answer.answer_tex)
		return u'<ol>%s</ol>' % s
	get_question_answer.short_description = _("Get answer")
	get_question_answer.allow_tags = True
	
	class Meta: 
		verbose_name = _("formula task question") 
		verbose_name_plural = _("formula task questions")

#######################################################################################################################
#######################################################################################################################

class FormulaTaskAnswer(models.Model):
	question = models.ForeignKey(FormulaTaskQuestion, verbose_name=_("question"), blank=True, null=True, related_name="answers")
	answer_tex = models.CharField(max_length=500, verbose_name=_("answer tex"))
	is_true = models.BooleanField(verbose_name=_("is true"), default=False)
	is_active = models.BooleanField(verbose_name=_("is active"), default=True)
	sort = models.IntegerField(verbose_name=_("sort"), default=0)
	
	def __unicode__(self):
		return u'%s' % self.answer_tex
		
	#Возвращает формулу вопроса
	def get_question(self):
		return u'$$%s$$' % self.question.question_tex
	get_question.short_description = _("Get question")
		
	def get_answer(self):
		return u'$$%s$$' % self.answer_tex
	get_answer.short_description = _("Get answer")
	
	class Meta: 
		verbose_name = _("formula task answer") 
		verbose_name_plural = _("formula task answers")
		
#######################################################################################################################
#######################################################################################################################