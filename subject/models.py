# -*- coding: utf-8 -*-

from django.db import models
from django.utils.translation import ugettext_lazy as _
from tinymce import models as TinymceField
from django.contrib.auth.models import User
from django.core.exceptions import ValidationError
import datetime
import re
import os

from pytils.translit import slugify

from mformulas.helper import TextToMFormula, search_mformulas

#######################################################################################################################
#######################################################################################################################

#Предмет
class Subject(models.Model):
	title = models.CharField(max_length=500, verbose_name=_("title"))
	slug = models.SlugField(unique=True, verbose_name=_("slug"))
	text = TinymceField.HTMLField(max_length=10000, verbose_name=_("text"), blank=True, help_text=_("This text about a subject isn't displayed anywhere"))
	is_olympiad = models.BooleanField(verbose_name=_("is olympiad"), default=False)
	is_active = models.BooleanField(verbose_name=_("is active"), default=True)
	sort = models.IntegerField(verbose_name=_("sort"), default=0)
	
	def __unicode__(self):
		return u'%s' % self.title
	
	def save(self, *args, **kwargs):
		self.slug = slugify(self.title)
		super(Subject, self).save(*args, **kwargs)	
	
	def get_absolute_url(self):
		return '/subjects/subject/%s/' % self.slug
		
	def get_lesson_list(self):
		return self.subjects_lesson.filter(is_active=True)
		
	def get_use_list(self):
		return self.subjects_use.filter(is_active=True)
	
	def get_offset_list(self):
		return self.subjects_offset.filter(is_active=True)
	
	class Meta: 
		verbose_name = _("subject")
		verbose_name_plural = _("subjects")
		ordering = ['sort', 'id']
		
#######################################################################################################################
#######################################################################################################################

#Задача
class Task(models.Model):
	title = models.CharField(max_length=1000, verbose_name=_("title"))
	slug = models.SlugField(unique=True,max_length=1000, verbose_name=_("slug"))
	text_task = TinymceField.HTMLField(max_length=10000, verbose_name=_("text task"))
	is_active = models.BooleanField(verbose_name=_("is active"), default=True)
	sort = models.IntegerField(verbose_name=_("sort"), default=0)
	
	def __unicode__(self):
		return u'%s' % self.title
		
	def save(self, *args, **kwargs):
		self.slug = slugify(self.title)
		super(Task, self).save(*args, **kwargs)
		#search_mformulas(models=[Task])
		
	def get_absolute_url(self):
		return '/subjects/task/%s/' % self.slug
	
	#Возвращает ответы
	def get_version_answer(self):
		return self.version_answer.filter(is_active=True)
		
	#Проверяет верный ли ответ
	def is_true_answer(self, query_string):
		k, loop = 0, 0
		va = self.get_version_answer().filter(task=self, is_correctly=True)

		r = re.compile('(answer_([0-9]+))=(.+?)\&')
		iterator = r.findall(u'&' + query_string + u'&')

		for match in iterator:
			key, id, value = match[0], match[1], match[2]

			if va[0].type_answer == 'text':
				if (va.filter(answer=value)): k += 1
			else:
				if (va.filter(answer=value)) or (va.filter(id=id)): k += 1
			loop += 1

		if k == va.count() and k == loop: return True
		return False
		
	#Создает html форму с ответами пользователя
	def users_answer_form(self, query_string='next=1&answerr=1&subject_name=matematika&answer=3',idisabled='disabled'):
		va = self.get_version_answer()
		r = re.compile('(answer_([0-9]+))=(.+?)\&')
		iterator = r.findall(u'&' + query_string + u'&')
		html = ''
		
		for v in va:
			ichecked = ''
			iname = 'answer_%s'%v.id
			ivalue = ''
			ilabel = ''
			value = ''
			for match in iterator:
				key, id, value = match[0], match[1], match[2]
				if int(id)>0:
					if v.id == int(id) and v.type_answer == 'radio':
						ichecked = 'checked'
						iname = 'answer'
						value = VersionAnswer.objects.filter(id=id)[0].answer

					elif id and v.id == int(id):
						if v.type_answer == 'checkbox':
							ichecked = 'checked'
				if v.type_answer == 'text':
					iname = 'answer_0'
				if v.type_answer == 'radio':
					iname = 'answer'

			if v.type_answer == 'checkbox':
				ilabel = "<label class='f_left' for='answer_%(id)d' tabindex='%(id)d'>%(answer)s</label>" % {'id':v.id, 'answer':v.answer}
			if v.type_answer == 'radio':
				ilabel = "<label class='f_left' for='answer_%(id)d' tabindex='%(id)d'>%(answer)s</label>" % {'id':v.id, 'answer':v.answer}
				
			html += "<tr><td><input class='f_left' id='answer_%s' type='%s' name='%s' value='%s' %s %s /></td><td>%s<div class='clr'></div></td></tr>" % (
				v.id, v.type_answer, iname, value, ichecked, idisabled, ilabel
			)
		return html
	users_answer_form.allow_tags = True
	
	def get_admin_version_answer(self):
		s = u''
		for answer in VersionAnswer.objects.filter(task=self, is_active=True).order_by('sort'):
			if answer.is_correctly: 
				checked =u'checked'
				color=u'1px blue solid'
			else: 
				checked =u''
				color=u'none'
			s += u"<tr><td style='border:none' width='20px'><input style='border:%s' type='%s' %s disabled value='%s'></td><td style='border:none'>%s</td></tr>" % (color,answer.type_answer, checked, answer.answer, TextToMFormula(answer.answer))
		return u'<table >%s</table>' % s
	get_admin_version_answer.short_description = _("Get answer")
	get_admin_version_answer.allow_tags = True
	
	def get_admin_text_task(self):
		return TextToMFormula(self.text_task)
	get_admin_text_task.short_description = _("Get test task")
	get_admin_text_task.allow_tags = True
		
	class Meta: 
		verbose_name = _("task") 
		verbose_name_plural = _("tasks") 
		ordering = ['sort']
		
#######################################################################################################################
#######################################################################################################################
		
#Варианты ответа
class VersionAnswer(models.Model):
	answer = TinymceField.HTMLField(max_length=1000, verbose_name=_("answer"))
	task = models.ForeignKey(Task, verbose_name=_("task"),related_name=u'version_answer')
	TYPE_CHOICES = ( 
		('checkbox',_("checkbox")),
		('radio',_("radio")),
		('text',_("text")),
	) 
	type_answer=models.CharField(max_length=100, choices=TYPE_CHOICES,verbose_name=_("type answer")) 
	
	is_correctly = models.BooleanField(verbose_name=_("is correctly"), default=False)
	is_active = models.BooleanField(verbose_name=_("is active"), default=True)
	sort = models.IntegerField(verbose_name=_("sort"), default=0)
	
	def save(self, *args, **kwargs):
		super(VersionAnswer, self).save(*args, **kwargs)
		if self.is_correctly == True and self.type_answer == 'radio':
			VersionAnswer.objects.filter(task=self.task).exclude(id=self.id).update(is_correctly=False)
		if self.type_answer:
			VersionAnswer.objects.filter(task=self.task).update(type_answer=self.type_answer)
			
		#search_mformulas(models=[VersionAnswer])

	def __unicode__(self):
		return '%s' % self.answer 
		
	class Meta: 
		verbose_name = _("version answer") 
		verbose_name_plural = _("versions answers")
		ordering = ['sort', 'id']

#Сложность
class Complexity(models.Model):
	title = models.CharField(max_length=500, verbose_name=_("title"))
	is_active = models.BooleanField(verbose_name=_("is active"), default=True)
	sort = models.IntegerField(verbose_name=_("sort"), default=0)
	
	def __unicode__(self):
		return '%s' % self.title
	
	class Meta: 
		verbose_name = _("complexity") 
		verbose_name_plural = _("complexitys")
		ordering = ['sort', 'id']
		
#######################################################################################################################
#######################################################################################################################
		
#Урок
class Lesson(models.Model):
	title = models.CharField(max_length=500, verbose_name=_("title"))
	slug = models.SlugField(unique=True, verbose_name=_("slug"))
	text = TinymceField.HTMLField(max_length=10000, verbose_name=_("text"), blank=True)
	subject = models.ForeignKey(Subject, verbose_name=_("subject"),related_name=u'subjects_lesson')
	date = models.DateField(verbose_name=_("date lesson"), default=datetime.datetime.now())
	teacher = models.ForeignKey(User, verbose_name=_("teacher"))
	level = models.IntegerField(verbose_name=_("class"),)
	complexity = models.ForeignKey(Complexity, verbose_name=_("complexity"))
	video = models.FileField(max_length=100, upload_to=u'upload/lesson/video/', verbose_name=_("video"), blank=True, null=True)
	tasks = models.ManyToManyField(Task, verbose_name=_("tasks"), through='Lesson_Task')
	
	is_active = models.BooleanField(verbose_name=_("is active"), default=True)
	sort = models.IntegerField(verbose_name=_("sort"), default=0)
	
	def __unicode__(self):
		return u'%s' % self.title
	
	def clean(self):
		r = re.compile('^([a-zA-Z0-9_-]+)\.(flv)$')
		if self.video:
			if not r.findall(os.path.split(self.video.url)[1]):
				raise ValidationError(_("File_name_validation_error"))
	
	def save(self, *args, **kwargs):
		self.slug = slugify(self.title)
		super(Lesson, self).save(*args, **kwargs)
		search_mformulas(models=[Lesson])
		
	def get_absolute_url(self):
		return '/subjects/lesson/%s/?subject_name=%s' % (self.slug,self.subject.slug)
		
	def get_absolute_olympiad_url(self):
		return '/olympiad/lesson/%s/?subject_name=%s' % (self.slug,self.subject.slug)
		
	#Кол-во просмотров урока
	def get_number_of_viewings(self):
		return self.userlesson_set.all().count()
	get_number_of_viewings.short_description = _("number of viewings")
		
	def get_task_list(self):
		return self.tasks.filter(is_active=True)
	
	def get_task_list_admin(self):
		s = u''
		for item in self.tasks.filter(is_active=True).order_by('sort'):
			s += u'<div>%s</div>' % (item)
		return u'%s' % s
	get_task_list_admin.short_description = _("get_task_list_admin")
	get_task_list_admin.allow_tags = True
	
	def get_title(self):
		return self.title
	
	class Meta: 
		verbose_name = _("lesson") 
		verbose_name_plural = _("lessons")
		ordering = ['sort', '-date', '-id']		

#Таблица связи Урока и задачи
class Lesson_Task(models.Model):
	lesson = models.ForeignKey(Lesson, verbose_name=_("lesson"))
	task = models.ForeignKey(Task, verbose_name=_("task"))
	text_solution = TinymceField.HTMLField(max_length=10000, verbose_name=_("text solution"), blank=True)
	
	is_active = models.BooleanField(verbose_name=_("is active"), default=True)
	sort = models.IntegerField(verbose_name=_("sort"), default=0)
	
	class Meta: 
		verbose_name = _("lesson task") 
		verbose_name_plural = _("lessons task")
		ordering = ['sort', 'id']
		
#######################################################################################################################
#######################################################################################################################
		
#ЕГЭ
class USE(models.Model):
	title = models.CharField(max_length=500, verbose_name=_("title"))
	slug = models.SlugField(unique=True, verbose_name=_("slug"))
	text = TinymceField.HTMLField(max_length=10000, verbose_name=_("text"))
	subject = models.ForeignKey(Subject, verbose_name=_("subject"),related_name=u'subjects_use')
	time = models.TimeField(verbose_name=_("time"), default='00:40:00')
	tasks = models.ManyToManyField(Task, verbose_name=_("tasks"), through='USE_Task')
	percent = models.IntegerField(verbose_name=_("percent for true use"))
	
	is_active = models.BooleanField(verbose_name=_("is active"), default=True)
	sort = models.IntegerField(verbose_name=_("sort"), default=0)
	
	def __unicode__(self):
		return u'%s' % self.title
	
	def save(self, *args, **kwargs):
		self.slug = slugify(self.title)
		super(USE, self).save(*args, **kwargs)	
		
	def get_absolute_url(self):
		return '/subjects/use/%s/?subject_name=%s' % (self.slug,self.subject.slug)
		
	def get_task_list(self):
		return self.tasks.filter(is_active=True).order_by('for_use_task_task','id')
		
	def get_task_list_admin(self):
		s = u''
		for item in self.tasks.filter(is_active=True).order_by('sort'):
			s += u'<div>%s</div>' % (item)
		return u'%s' % s
	get_task_list_admin.short_description = _("get_task_list_admin")
	get_task_list_admin.allow_tags = True
	
	class Meta:
		verbose_name = _("USE")
		verbose_name_plural = _("USEs")
		ordering = ['sort', '-id']

class LevelTaskUse(models.Model):
	title = models.CharField(max_length=500, verbose_name=_("title"))
	is_active = models.BooleanField(verbose_name=_("is active"), default=True)
	sort = models.IntegerField(verbose_name=_("sort"), default=0)
	
	def __unicode__(self):
		return u'%s' % self.title
	
	class Meta: 
		verbose_name = _("level task use") 
		verbose_name_plural = _("levels tasks uses")
		ordering = ['sort', 'id']		

#Таблица связи ЕГЭ и задачи
class USE_Task(models.Model):
	USE = models.ForeignKey(USE, verbose_name=_("USE"), related_name=u'u_use')
	task = models.ForeignKey(Task, verbose_name=_("task"), related_name=u'for_use_task_task')
	level_task_use = models.ForeignKey(LevelTaskUse, verbose_name=_("level task use"))
	quantity_point = models.IntegerField(verbose_name=_("quantity point"))
	is_active = models.BooleanField(verbose_name=_("is active"), default=True)
	sort = models.IntegerField(verbose_name=_("sort"), default=0)

	class Meta: 
		verbose_name = _("USEs task") 
		verbose_name_plural = _("USEs tasks")
		ordering = ['level_task_use']
		
#######################################################################################################################
#######################################################################################################################
		
#Зачет
class Offset(models.Model):
	title = models.CharField(max_length=500, verbose_name=_("title"))
	slug = models.SlugField(unique=True, verbose_name=_("slug"))
	text = TinymceField.HTMLField(max_length=10000, verbose_name=_("text"), blank=True)
	subject = models.ForeignKey(Subject, verbose_name=_("subject"),related_name=u'subjects_offset')
	time = models.TimeField(verbose_name=_("time"), default='00:40:00')
	level = models.IntegerField(verbose_name=_("class"))
	tasks = models.ManyToManyField(Task, verbose_name=_("tasks"), through='Offset_Task')
	percent = models.IntegerField(verbose_name=_("percent for true offset"))
	
	is_active = models.BooleanField(verbose_name=_("is active"), default=True)
	sort = models.IntegerField(verbose_name=_("sort"), default=0)
	
	def __unicode__(self):
		return u'%s' % self.title
		
	def save(self, *args, **kwargs):
		self.slug = slugify(self.title)
		super(Offset, self).save(*args, **kwargs)
		
	def get_absolute_url(self):
		return '/subjects/offset/%s/?subject_name=%s' % (self.slug,self.subject.slug)
		
	def get_task_list(self):
		return self.tasks.filter(is_active=True)
		
	def get_task_list_admin(self):
		s = u''
		for item in self.tasks.filter(is_active=True).order_by('sort'):
			s += u'<div>%s</div>' % (item)
		return u'%s' % s
	get_task_list_admin.short_description = _("get_task_list_admin")
	get_task_list_admin.allow_tags = True
		
	class Meta: 
		verbose_name = _("offset") 
		verbose_name_plural = _("offsets")
		ordering = ['sort', '-id']

#Таблица связи Зачета и задачи
class Offset_Task(models.Model):
	offset = models.ForeignKey(Offset, verbose_name=_("offset"))
	task = models.ForeignKey(Task, verbose_name=_("task"))
	is_active = models.BooleanField(verbose_name=_("is active"), default=True)
	sort = models.IntegerField(verbose_name=_("sort"), default=0)
	
	def __unicode__(self):
		return u'%s-%s' % (self.offset.title,self.task.title)
	
	class Meta: 
		verbose_name = _("offset task") 
		verbose_name_plural = _("offsets tasks")
		ordering = ['sort', 'id']
		
#######################################################################################################################
#######################################################################################################################