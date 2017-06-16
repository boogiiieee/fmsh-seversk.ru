# -*- coding: utf-8 -*-

from django.contrib import admin
from django.utils.translation import ugettext_lazy as _
from django.contrib.auth.models import User, Group
import settings

from admintrans.admin import *
from subject.models import Subject, Task, VersionAnswer, Complexity, Lesson, Lesson_Task, USE, LevelTaskUse, USE_Task, Offset, Offset_Task

#######################################################################################################################
#######################################################################################################################

class SubjectAdmin(admin.ModelAdmin):
	fields = ('title', 'text', 'is_olympiad', 'is_active', 'sort')
	list_display = ('title', 'is_active', 'is_olympiad', 'sort')
	search_fields = ('title',)
	list_filter = ('is_active',)
	list_editable = ('is_active', 'is_olympiad', 'sort')

admin.site.register(Subject, SubjectAdmin)

#######################################################################################################################
#######################################################################################################################

class VersionAnswerInline(admin.StackedInline):
	extra = 0
	model = VersionAnswer
	
#######################################################################################################################
#######################################################################################################################

class LessonTaskInline(admin.StackedInline):
	model = Lesson_Task
	raw_id_fields = ('task',)
	extra = 0
	
#######################################################################################################################
#######################################################################################################################
	
class USETaskInline(admin.StackedInline):
	fieldsets = (
        (None, {'fields': ('task','USE','level_task_use','quantity_point','is_active','sort')}),
    )
	model = USE_Task
	raw_id_fields = ('task',)
	extra = 0
	
#######################################################################################################################
#######################################################################################################################

class OffsetTaskInline(admin.StackedInline):
	fieldsets = (
        (None, {'fields': ('task','offset','is_active','sort')}),
    )
	model = Offset_Task
	raw_id_fields = ('task',)
	extra = 0
	
#######################################################################################################################
#######################################################################################################################

class ComplexityAdmin(admin.ModelAdmin):
	fields = ('title','is_active', 'sort')
	list_display = ('title','is_active', 'sort')
	search_fields = ('title',)
	list_filter = ('is_active',)
	list_editable = ('is_active', 'sort')

admin.site.register(Complexity, ComplexityAdmin)

#######################################################################################################################
#######################################################################################################################

class TaskAdmin(admin.ModelAdmin):
	fields = ('title', 'text_task', 'is_active', 'sort')
	inlines = [VersionAnswerInline,]
	list_display = ('title', 'get_admin_text_task', 'get_admin_version_answer', 'is_active', 'sort', 'id')
	search_fields = ('title',)
	list_filter = ('is_active',)
	list_editable = ('is_active', 'sort')
	
	class Media:
		js = [
			'%smathjax/MathJax.js?config=TeX-AMS_HTML-full' % settings.STATIC_URL,
			'%sjs/mathjax.js' % settings.STATIC_URL
		]
		
admin.site.register(Task, TaskAdmin)

#######################################################################################################################
#######################################################################################################################

class LessonAdmin(admin.ModelAdmin):
	inlines = [LessonTaskInline,]
	fields = ('title','text','subject','teacher','level','complexity','date', 'video','is_active', 'sort')
	list_display = ('title','subject','get_task_list_admin','teacher','level','complexity','get_number_of_viewings','date','is_active', 'sort')
	search_fields = ('title',)
	list_filter = ('subject', 'is_active','teacher','level','complexity')
	list_editable = ('level','complexity','is_active', 'sort')
	
	def formfield_for_foreignkey(self, db_field, request, **kwargs):
		if not request.user.is_superuser:
			if db_field.name == 'teacher':
				kwargs['queryset'] = User.objects.filter(id=request.user.id)
				kwargs['initial'] = request.user
				kwargs['required'] = True
		return super(LessonAdmin, self).formfield_for_foreignkey(db_field, request, **kwargs)

admin.site.register(Lesson, LessonAdmin)

#######################################################################################################################
#######################################################################################################################

class LevelTaskUseAdmin(admin.ModelAdmin):
	fields = ('title','is_active', 'sort')
	list_display = ('title','is_active', 'sort')
	search_fields = ('title',)
	list_filter = ('is_active',)
	list_editable = ('is_active', 'sort')

admin.site.register(LevelTaskUse, LevelTaskUseAdmin)

#######################################################################################################################
#######################################################################################################################

class USEAdmin(admin.ModelAdmin):
	inlines = [USETaskInline,]
	fields = ('title','text','subject','time','percent','is_active', 'sort')
	list_display = ('title','subject','get_task_list_admin','time','is_active', 'sort')
	search_fields = ('title',)
	list_filter = ('is_active',)
	list_editable = ('is_active', 'sort')

admin.site.register(USE, USEAdmin)

#######################################################################################################################
#######################################################################################################################

class OffsetAdmin(admin.ModelAdmin):
	inlines = [OffsetTaskInline,]
	fields = ('title','text','subject','time','level','percent','is_active', 'sort')
	list_display = ('title','subject','get_task_list_admin','time','level','percent','is_active', 'sort')
	search_fields = ('title',)
	list_filter = ('is_active','level')
	list_editable = ('level','is_active', 'sort')

admin.site.register(Offset, OffsetAdmin)

#######################################################################################################################
#######################################################################################################################