# -*- coding: utf-8 -*-

from django.db import models
from django.contrib import admin
from django.contrib.auth.admin import UserAdmin
from django.contrib.auth.models import User
from django.utils.translation import ugettext_lazy as _

from admintrans.admin import *
from statistics.models import StatisticsDayUser

#######################################################################################################################
#######################################################################################################################

#Статистика пользователя за день
class StatisticsDayUserAdmin(admin.ModelAdmin):
	list_display = ('user', 'day', 'subject')
	list_filter = ('day', 'subject')
	search_fields = ('user__user__username', 'user__user__first_name', 'user__user__last_name')
 
admin.site.register(StatisticsDayUser, StatisticsDayUserAdmin)

#######################################################################################################################
#######################################################################################################################