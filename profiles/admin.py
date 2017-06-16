# -*- coding: utf-8 -*-

from django.db import models
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User

from admintrans.admin import *
from profiles.models import UserProfile, UserAnonymous
from profiles.actions import CreateMessageForUser, ReportActivityUser

#######################################################################################################################
#######################################################################################################################

#Профиль пользователя	
class UserProfileInline(admin.StackedInline):
	model = UserProfile
	fk_name = 'user'
	max_num = 1
	
class UserAnonymousInline(admin.StackedInline):
	model = UserAnonymous
	fk_name = 'user'
	max_num = 1
	
class CustomUserAdmin(UserAdmin):
	inlines = [UserProfileInline, UserAnonymousInline]
	list_display = ('username', 'email', 'first_name', 'last_name', 'get_level', 'get_duration', 'is_staff', 'is_active')
	list_filter = ('date_joined', 'last_login', 'is_staff', 'is_active', 'profiles__level', 'Anonymous__onlinedayusers__day', 'Anonymous__userlessons__lesson')
	list_editable = ('is_active',)
	search_fields = ('username','first_name','last_name')
	ordering = ('-last_login',)
	actions = [CreateMessageForUser, ReportActivityUser]

admin.site.unregister(User)
admin.site.register(User, CustomUserAdmin)

#######################################################################################################################
#######################################################################################################################

#Пользователи и анонимные пользователи
class UserAnonymousAdmin(admin.ModelAdmin):
	list_display = ('get_user', 'is_anonymous', 'date')
	list_filter = ('date',)

#admin.site.register(UserAnonymous, UserAnonymousAdmin)

#######################################################################################################################
#######################################################################################################################