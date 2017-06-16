# -*- coding: utf-8 -*-

from django.db import models
from django.utils.translation import ugettext_lazy as _
from tinymce import models as TinymceField
from django.contrib.sites.models import Site
from django.contrib.auth.models import User
import datetime
from pytils.translit import slugify
from django.http import HttpResponseRedirect, HttpResponse, Http404
from django.contrib import messages

#from profiles.models import UserAnonymous, UserProfile
from configuration.models import ConfigModel
from mformulas.models import SearchFormula
from subject.models import Subject, Lesson, Task, Offset, VersionAnswer, Offset_Task, USE, USE_Task
from statistics.models import StatisticsDayUser

##############################################################################################
##############################################################################################

#Уроки пользователей
class UserLesson(models.Model):
	user = models.ForeignKey('profiles.UserAnonymous', verbose_name=_("user"), related_name="userlessons")
	lesson = models.ForeignKey(Lesson, verbose_name=_("lesson"))
	is_development = models.BooleanField(verbose_name=_("is development"), default=False)#на освоении
	is_mastered = models.BooleanField(verbose_name=_("is mastered"), default=False)#освоено
	is_bookmark = models.BooleanField(verbose_name=_("is bookmark"), default=False)#в закладках
	is_video_see = models.BooleanField(verbose_name=_("is video see"), default=False)#просмотрено ли видео
	percent = models.IntegerField(verbose_name=_("percent"), default=0)
	date_development = models.DateField(verbose_name=_("date_development"), default=datetime.datetime.now(), blank=True, null=True)
	date_mastered = models.DateField(verbose_name=_("date_mastered"), default=datetime.datetime.now(), blank=True, null=True)
	date_bookmark = models.DateField(verbose_name=_("date_bookmark"), default=datetime.datetime.now(), blank=True, null=True)
	
	def __unicode__(self):
		return u'%s-%s' % (self.user,self.lesson)
		
	class Meta: 
		verbose_name = _("user lesson")
		verbose_name_plural = _("users lesson")
		
	#Если вып. уроки, то создается зачет для пользоваеля
	def create_offset_user(self):
		mastered_count = UserLesson.objects.filter(user=self.user, lesson__level=self.user.get_level(), lesson__subject=self.lesson.subject, is_mastered=True).count()
		all = Lesson.objects.filter(is_active=True, subject=self.lesson.subject, level=self.user.get_level()).count()
		if all !=0:
			if (100 * mastered_count / all) >= ConfigModel.objects.all()[0].percent_lessons:
				offsets = Offset.objects.filter(is_active=True, subject=self.lesson.subject, level=int(self.user.get_level()))
				for o in offsets:
					UserOffset.objects.get_or_create(user=self.user, offset=o)

	#Пересчитать процент выполнения урока
	def repercent(self, request):
		self.percent = 0
		
		if self.lesson.video:
			if self.is_video_see: self.percent += 10
		else: self.percent += 10
		
		vsego = Task.objects.filter(lesson=self.lesson).count()
		verno = UserTask.objects.filter(user=self.user, lesson=self.lesson, is_executed=True).count()
		
		if vsego != 0: self.percent += int(90 * verno / vsego)
		else: self.percent += 90
		self.save()
			
		if self.percent >= 99:
			if self.is_mastered == False:
				s,create = StatisticsDayUser.objects.get_or_create(
					user=request.user_anonymous, day=datetime.datetime.now(), subject=self.lesson.subject
				)
				if self.lesson.subject.is_olympiad: s.olympiad_learned += 1
				else: s.lessons_learned += 1
				s.save()
			
			self.is_mastered = True
			self.save()
			self.create_offset_user()

#######################################################################################################################
#######################################################################################################################

#Задачи пользователей
class UserTask(models.Model):
	user = models.ForeignKey('profiles.UserAnonymous', verbose_name=_("user"))
	task = models.ForeignKey(Task, verbose_name=_("task"))
	lesson = models.ForeignKey(Lesson, verbose_name=_("lesson"))
	is_executed = models.BooleanField(verbose_name=_("is executed"), default=False)#выполнено
	date_development = models.DateField(verbose_name=_("date_development"), default=datetime.datetime.now())
	number_attempts = models.IntegerField(verbose_name=_("number attempts"), default=0)
	true_number_attempts = models.IntegerField(verbose_name=_("true number attempts"), default=0)
	buy_answer = models.BooleanField(verbose_name=_("buy answer"), default=False)
	
	def __unicode__(self):
		return u'%s-%s-%s' % (self.user,self.lesson, self.task)
	
	class Meta: 
		verbose_name = _("user task")
		verbose_name_plural = _("users task")
		
#######################################################################################################################
#######################################################################################################################

#Зачеты пользователей
class UserOffset(models.Model):
	user = models.ForeignKey('profiles.UserAnonymous', verbose_name=_("user"))
	offset = models.ForeignKey(Offset, verbose_name=_("offset"), related_name=u'plus_users')
	is_executed = models.BooleanField(verbose_name=_("is executed"), default=False)#выполнено задание зачета
	date_delivery = models.DateTimeField(verbose_name=_("date_delivery"), default=datetime.datetime.now())#дата сдачи зачета
	number_attempts = models.IntegerField(verbose_name=_("number attempts"), default=0)
	true_number_attempts = models.IntegerField(verbose_name=_("true number attempts"), default=0)
	
	def __unicode__(self):
		return u'%s-%s' % (self.user, self.offset)
	
	class Meta: 
		verbose_name = _("user offset")
		verbose_name_plural = _("users offset")
		
	def offset_is_executed(self):
		verno = UserTaskOffset.objects.filter(user_task_offset=self, is_executed=True, task__offset__level=self.user.get_level()).count()
		vsego = Offset_Task.objects.filter(offset=self.offset, is_active=True, offset__level=self.user.get_level()).count()
		
		if vsego != 0 and (100 * verno / vsego) >= self.offset.percent:
			return True
		return False
	
#Зачеты задачи пользователей
class UserTaskOffset(models.Model):
	task = models.ForeignKey(Task, verbose_name=_("task"),related_name=u'user_task_offset_tasks')
	user_task_offset = models.ForeignKey(UserOffset, verbose_name=_("user_task_offset"))
	is_executed = models.BooleanField(verbose_name=_("is executed"), default=False)#выполнено задание зачета
	number_attempts = models.IntegerField(verbose_name=_("number attempts"), default=0)
	true_number_attempts = models.IntegerField(verbose_name=_("true number attempts"), default=0)
	answer = models.CharField(max_length=100, verbose_name=_("answer"))
	
	def __unicode__(self):
		return u'%s-%s' % (self.task, self.user_task_offset)
	
	class Meta: 
		verbose_name = _("user offset")
		verbose_name_plural = _("users offset")
		
#######################################################################################################################
#######################################################################################################################
		
#Егэ пользователей
class UserUse(models.Model):
	user = models.ForeignKey('profiles.UserAnonymous', verbose_name=_("user"))
	use = models.ForeignKey(USE, verbose_name=_("use"),related_name=u'plus_users')
	is_executed = models.BooleanField(verbose_name=_("is executed"), default=False)#выполнено егэ
	date_delivery = models.DateTimeField(verbose_name=_("date_delivery"), default=datetime.datetime.now())#дата сдачи зачета
	number_attempts = models.IntegerField(verbose_name=_("number attempts"), default=0)
	true_number_attempts = models.IntegerField(verbose_name=_("true number attempts"), default=0)
	points = models.IntegerField(verbose_name=_("points"), default=0)
	
	def __unicode__(self):
		return u'%s-%s' % (self.user, self.use)

	class Meta: 
		verbose_name = _("user use")
		verbose_name_plural = _("users uses")
		
	def get_percent(self):
		verno = UserTaskUSE.objects.filter(user_use=self, is_executed=True).count()
		vsego = USE_Task.objects.filter(USE=self.use, is_active=True).count()
		if vsego != 0: return 100 * verno / vsego
		else: return 0
		
	#Сдан ли ЕГЭ
	def use_is_executed(self):
		if self.get_percent() >= self.use.percent-1: return True
		return False
	
#ЕГЭ задачи пользователей
class UserTaskUSE(models.Model):
	task = models.ForeignKey(Task, verbose_name=_("task"),related_name=u'user_task_use_tasks')
	user_use = models.ForeignKey(UserUse, verbose_name=_("user_use"),related_name=u'user_use')
	is_executed = models.BooleanField(verbose_name=_("is executed"), default=False)#выполнено задание егэ 
	number_attempts = models.IntegerField(verbose_name=_("number attempts"), default=0)
	true_number_attempts = models.IntegerField(verbose_name=_("true number attempts"), default=0)
	answer = models.CharField(max_length=1000, verbose_name=_("answer"))
	
	def __unicode__(self):
		return u'%s-%s' % (self.user_use, self.task)
	
	class Meta: 
		verbose_name = _("user task use")
		verbose_name_plural = _("users tasks use")
		
	def get_task_level(self):
		return self.task.for_use_task_task.all()[0].level_task_use
		
#######################################################################################################################
#######################################################################################################################
		
#Словарь
class Dictionary(models.Model):
	user = models.ForeignKey('profiles.UserAnonymous', verbose_name=_("user"))
	subject = models.ForeignKey(Subject, verbose_name=_("subject"))
	formula = models.ForeignKey('mformulas.Formula', verbose_name=_("formula"))
	date_addition = models.DateField(verbose_name=_("date_addition"), default=datetime.datetime.now())#дата добавления
	
	def __unicode__(self):
		return u'%s-%s-%s' % (self.user, self.subject, self.formula)
	
	class Meta: 
		verbose_name = _("dictionary")
		verbose_name_plural = _("dictionarys")
		
	#На освоении
	def is_development(self):
		if self.rel_training_formulas.filter(number_attempts__gt=0, is_learned=False).count(): return True
		return False
	
	#Освоено
	def is_mastered(self):
		if self.rel_training_formulas.filter(is_learned=True).count(): return True
		return False
		
	#Сбросить флаг "освоено" при повторной попытке добавить в словарь
	def set_not_mastered(self):
		if self.is_mastered():
			self.rel_training_formulas.filter(is_learned=True).update(
				number_attempts = 0,
				right_answers = 0,
				is_right_last_answer = False,
				is_learned = False
			)
			return True
		return False
		
	#Список уроков, в кот. встречается ф-ла.
	def get_lessons(self):
		ul = UserLesson.objects.filter(user=self.user)
		lessons = [i.lesson.id for i in ul]
		sf = SearchFormula.objects.filter(formula=self.formula, model_name='Lesson', obj_id__in=lessons)
		return sf
				
		
#######################################################################################################################
#######################################################################################################################