# -*- coding: utf-8 -*-

from django.db import models
from django.contrib.auth.models import User
from django.db.models.signals import post_save
from django.utils.translation import ugettext_lazy as _
from django.db.models import Q
import datetime

#######################################################################################################################
#######################################################################################################################

def get_level(self):
	return u'%d' % self.get_profile().level
get_level.short_description = _("Level")

def get_duration(self):
	return u'%s' % self.get_profile().duration.strftime("%d.%m.%Y")
get_duration.short_description = _("It is active to")

User.add_to_class("get_level", get_level)
User.add_to_class("get_duration", get_duration)

#######################################################################################################################
#######################################################################################################################

#Профиль пользователя		
class UserProfile(models.Model):
	user = models.OneToOneField(User, primary_key=True, related_name="profiles")
	duration = models.DateField(verbose_name=_("duration of activity"), default=datetime.datetime.now())
	level = models.IntegerField(verbose_name=_("level"), default=7)
	
	def __unicode__(self):
		return u'%s' % self.user.username
	
	def get_date_balance(self):
		return self.duration
	
	class Meta: 
		verbose_name = _("profile user") 
		verbose_name_plural = _("profile users")
	
def create_user_profile(sender, instance, created, **kwargs):   
	if created:
		profile, created = UserProfile.objects.get_or_create(user=instance)
		UserAnonymous.objects.get_or_create(user=instance)
 
post_save.connect(create_user_profile, sender=User)

#######################################################################################################################
#######################################################################################################################

#Связывающая таблица для пользователей и анонимов
class UserAnonymous(models.Model):
	user = models.OneToOneField(User, verbose_name=_("user"), related_name="Anonymous", blank=True, null=True)
	anonymous = models.CharField(max_length=100, verbose_name=_("anonymous"), blank=True)
	date = models.DateTimeField(verbose_name = _("date"), auto_now=True, auto_now_add=True)
	
	def is_anonymous(self):
		if self.user: return False
		else: return True
	is_anonymous.short_description = _("is anonymous")
	
	def get_user_in_staff(self):
		if self.user:
			if self.user.is_staff or self.user.is_superuser: return True
		return False
	
	def get_user(self):
		if self.user: return self.user
		else: return self.anonymous
	get_user.short_description = _("get user")
	
	def get_name(self):
		if self.user.get_full_name(): return u'%s' % self.user.get_full_name()
		else: return u'%s' % self.user
		
	#Возвращает True если пользователь просрочил оплату
	def is_not_order(self):
		if self.is_anonymous(): return True
		if self.user.get_profile().duration <= datetime.datetime.now().date(): return True
		return False
		
	def username(self):
		if self.user:
			return u'%s' % self.user
		elif self.anonymous:
			return u'%s' % self.anonymous
		else:
			return None
			
	def get_level(self):
		if self.is_anonymous(): return 7
		else: return self.user.get_profile().level
		
	def get_onlineuser(self, min_date=datetime.datetime.now(), max_date=datetime.datetime.now()):
		try:
			t = 0
			for i in self.onlinedayusers.filter(Q(day__gte=min_date) & Q(day__lte=max_date)):
				t += i.duration_of_visits
			return t
		except: return False
			
	def __unicode__(self):
		return self.username()
	
	class Meta: 
		verbose_name = _("user - anonymous") 
		verbose_name_plural = _("users - anonymous")

#######################################################################################################################
#######################################################################################################################