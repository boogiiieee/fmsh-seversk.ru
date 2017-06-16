# -*- coding: utf-8 -*-

from django.db import models
from django.utils.translation import ugettext_lazy as _
import datetime
from django.contrib.auth.models import User

#######################################################################################################################
#######################################################################################################################

#Приглашенные пользователи пользователем user
class Friend(models.Model):
	user = models.ForeignKey(User, verbose_name=_("user"))
	email = models.CharField(max_length=100, verbose_name=_("e-mail"))
	created_at = models.DateTimeField(verbose_name = _("date_created"), default=datetime.datetime.now())
	
	def __unicode__(self):
		return _('%(user)s to invite the friend "%(email)s"') % {'user':self.user, 'email':self.email}
		
	class Meta: 
		verbose_name = _("friend")
		verbose_name_plural = _("friends")
		ordering = ['id',]
		
#######################################################################################################################
#######################################################################################################################