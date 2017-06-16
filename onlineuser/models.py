# -*- coding: utf-8 -*-

from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.utils.translation import ugettext_lazy as _

from profiles.models import UserAnonymous

#######################################################################################################################
#######################################################################################################################

#Продолжительность посещения за день
class OnlineDayUser(models.Model):
	user = models.ForeignKey(UserAnonymous, related_name="onlinedayusers")
	day = models.DateField(verbose_name=_('day activity'))
	last_activity = models.DateTimeField(verbose_name=_('last activity'), blank=True, null=True)
	duration_of_visits = models.DecimalField(max_digits=5, decimal_places=2, verbose_name=_('duration of visits (minutes)'), default=0)
	
	def __unicode__(self):
		return u'%s / %s / %s' % (self.user.username, self.day.strftime('%d.%m.%Y'), self.duration_of_visits)
	
	class Meta: 
		verbose_name = _("online user") 
		verbose_name_plural = _("online users")

#######################################################################################################################
#######################################################################################################################