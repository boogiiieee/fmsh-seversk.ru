# -*- coding: utf-8 -*-

from django.contrib import admin

from admintrans.admin import *
from training.models import TrainingFormulas, TrainingOnlineDayUser

#######################################################################################################################
#######################################################################################################################

#admin.site.register(TrainingFormulas)

#######################################################################################################################
#######################################################################################################################

#ѕродолжительность посещени€ за день
class TrainingOnlineDayUserAdmin(admin.ModelAdmin):
	list_display = ('user', 'day', 'duration_of_visits')
	list_filter = ('day',)
	search_fields = ('user__username', 'user__first_name', 'user__last_name')
 
#admin.site.register(TrainingOnlineDayUser, TrainingOnlineDayUserAdmin)

#######################################################################################################################
#######################################################################################################################