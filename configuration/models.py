# -*- coding: utf-8 -*-

from django.db import models
from django.utils.translation import ugettext_lazy as _

#######################################################################################################################
#######################################################################################################################

#Настройки
class ConfigModel(models.Model):
	percent_lessons = models.IntegerField(verbose_name=_("percent of the passable lessons (0% - 100%)"), default=50, help_text=_("percent of the passable lessons for the admission to Unified State Examination delivery"))
	duration_registration = models.IntegerField(verbose_name=_("duration of registration (days)"), default=30, help_text=_("duration of registration of the user"))
	cost_registration = models.IntegerField(verbose_name=_("cost of registration (rub)"), default=500, help_text=_("cost of registration of the user"))
	duration_extension = models.IntegerField(verbose_name=_("duration of extension (days)"), default=30, help_text=_("duration of extension of registration"))
	cost_extension = models.IntegerField(verbose_name=_("cost of extension (rub)"), default=300, help_text=_("cost of extension of registration"))
	cost_analysis = models.IntegerField(verbose_name=_("cost of analysis (rub)"), default=50, help_text=_("cost of analysis of a task"))
	free_lessons = models.IntegerField(verbose_name=_("free lessons"), default=5, help_text=_("quantity of free lessons of the unregistered user"))
	quantity_formulas = models.IntegerField(verbose_name=_("quantity of formulas"), default=10, help_text=_("quantity of formulas in the dictionary of the unregistered user"))
	duration_training_unregistered_user = models.IntegerField(verbose_name=_("duration training of the unregistered user (minutes)"), default=20, help_text=_("duration training of the unregistered user"))
	
	def __unicode__(self):
		return u'%s' % _("configuration")
		
	class Meta: 
		verbose_name = _("configuration") 
		verbose_name_plural = _("configurations")
		
	def get_plan_for_level(self, level):
		try: return self.config_levels.filter(level=level)[0]
		except: return None
		
#######################################################################################################################
#######################################################################################################################

#Настройки
class ConfigLevelModel(models.Model):
	config = models.ForeignKey(ConfigModel, verbose_name=_("config"), related_name='config_levels')

	level = models.IntegerField(verbose_name=_("class"), unique=True)
	
	plan_lessons = models.IntegerField(verbose_name=_("the plan on lessons per day"))
	plan_formulas = models.IntegerField(verbose_name=_("the plan on formulas per day"))
	
	def __unicode__(self):
		return u'%s' % _("configuration level")
		
	class Meta: 
		verbose_name = _("configuration level") 
		verbose_name_plural = _("configurations level")
		
#######################################################################################################################
#######################################################################################################################