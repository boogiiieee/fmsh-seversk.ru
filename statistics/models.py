# -*- coding: utf-8 -*-

from django.db import models
from django.db.models.signals import post_save
from django.utils.translation import ugettext_lazy as _
import datetime

#from profiles.models import UserAnonymous
#from subject.models import Subject
from onlineuser.models import OnlineDayUser

#######################################################################################################################
#######################################################################################################################

#Статистика пользователя за день
class StatisticsDayUser(models.Model):
	user = models.ForeignKey('profiles.UserAnonymous', verbose_name=_("user"))
	day = models.DateField(verbose_name=_('day'), default=datetime.datetime.now())
	subject = models.ForeignKey('subject.Subject', verbose_name=_("subject"))
	
	lessons_visited = models.IntegerField(verbose_name=_("quantity visited lessons"), default=0)
	lessons_learned = models.IntegerField(verbose_name=_("quantity learned lessons"), default=0)
	
	olympiad_visited = models.IntegerField(verbose_name=_("quantity visited olympiads"), default=0)
	olympiad_learned = models.IntegerField(verbose_name=_("quantity learned olympiads"), default=0)
	
	tasks_attempts = models.IntegerField(verbose_name=_("quantity of attempts tasks"), default=0)
	tasks_correct = models.IntegerField(verbose_name=_("quantity of the correct tasks"), default=0)
	
	use_attempts = models.IntegerField(verbose_name=_("quantity of attempts use"), default=0)
	use_correct = models.IntegerField(verbose_name=_("quantity of the correct uses"), default=0)
	
	offsets_attempts = models.IntegerField(verbose_name=_("quantity of attempts offsets"), default=0)
	offsets_correct = models.IntegerField(verbose_name=_("quantity of the correct offsets"), default=0)
	
	added_formulas = models.IntegerField(verbose_name=_("quantity of the added formulas"), default=0)
	learned_formulas = models.IntegerField(verbose_name=_("quantity of the learned formulas"), default=0)
	
	def __unicode__(self):
		if self.user.user:
			return u'%s / %s / %s' % (self.user.user.username, self.day.strftime('%d.%m.%Y'), self.subject)
		else:
			return u'%s / %s / %s' % (self.user.anonymous, self.day.strftime('%d.%m.%Y'), self.subject)
		
	def get_onlineuser(self):
		try: return OnlineDayUser.objects.get(user=self.user, day=self.day)
		except: return False
	
	class Meta: 
		verbose_name = _("statistics of the user") 
		verbose_name_plural = _("statistics of the users")
		ordering = ('-day', 'subject')
		
#######################################################################################################################
#######################################################################################################################