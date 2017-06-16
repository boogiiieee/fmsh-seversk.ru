# -*- coding: utf-8 -*-

from django.db import models
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User

from admintrans.admin import *
from onlineuser.models import OnlineDayUser

#######################################################################################################################
#######################################################################################################################

#Продолжительность посещения за день
class OnlineDayUserAdmin(admin.ModelAdmin):
	list_display = ('user', 'day', 'duration_of_visits')
	list_filter = ('day',)
	search_fields = ('user__user__username', 'user__user__first_name', 'user__user__last_name')
 
#admin.site.register(OnlineDayUser, OnlineDayUserAdmin)

#######################################################################################################################
#######################################################################################################################