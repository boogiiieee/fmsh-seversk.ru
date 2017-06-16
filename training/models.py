# -*- coding: utf-8 -*-

from django.db import models
from django.utils.translation import ugettext_lazy as _

from subject_user.models import Dictionary
from profiles.models import UserAnonymous

#######################################################################################################################
#######################################################################################################################

#Формула на тренировке
class TrainingFormulas(models.Model):
	dictionary = models.ForeignKey(Dictionary, verbose_name=_('dictionary'), related_name='rel_training_formulas')
	last_attempt = models.DateTimeField(verbose_name=_('date of the last attempt'), blank=True, null=True)
	number_attempts = models.IntegerField(verbose_name=_('number of attempts'), default=0)
	right_answers = models.IntegerField(verbose_name=_('quantity of the right answers'), default=0)
	is_right_last_answer = models.BooleanField(verbose_name=_("is right last answer"), default=False)
	is_learned = models.BooleanField(verbose_name=_("it is learned"), default=False)
	
	class Meta: 
		verbose_name = _("training formula")
		verbose_name_plural = _("training formulas")

#######################################################################################################################
#######################################################################################################################




#######################################################################################################################
#######################################################################################################################

#Продолжительность посещения за день
class TrainingOnlineDayUser(models.Model):
	user = models.ForeignKey(UserAnonymous)
	day = models.DateField(verbose_name=_('day'))
	last_activity = models.DateTimeField(verbose_name=_('last activity'), blank=True, null=True)
	duration_of_visits = models.DecimalField(max_digits=5, decimal_places=2, verbose_name=_('duration of visits (minutes)'), default=0)
	
	def __unicode__(self):
		return u'%s / %s / %s' % (self.user.username, self.day.strftime('%d.%m.%Y'), self.duration_of_visits)
	
	class Meta: 
		verbose_name = _("online user") 
		verbose_name_plural = _("online users")

#######################################################################################################################
#######################################################################################################################