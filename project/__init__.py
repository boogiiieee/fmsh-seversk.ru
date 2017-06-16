# -*- coding: utf-8 -*-

from django.utils.translation import ugettext_lazy as _
import datetime

_('Project')

#######################################################################################################################
#######################################################################################################################

from robokassa.signals import result_received, success_page_visited, fail_page_visited
from configuration.models import ConfigModel
from profiles.models import UserProfile, UserAnonymous
from subject_user.models import UserTask
from subject.models import Lesson, Task

def payment_received(sender, **kwargs):
	cfg = ConfigModel.objects.all()[0]
	user = UserProfile.objects.get(user__id=int(kwargs['extra']['uid']))
	OutSum = int(kwargs['OutSum'])
	
	if not user.duration:
		user.duration = datetime.datetime.now()
	
	if OutSum == cfg.cost_registration:
		#Регистрация
		user.duration += datetime.timedelta(days=cfg.duration_registration)
	elif OutSum == cfg.cost_extension:
		#Продление регистрации
		user.duration += datetime.timedelta(days=cfg.duration_extension)
	elif OutSum == cfg.cost_analysis:
		#Решение задачи
		ut = UserTask.objects.filter(user__user=user, task__id=int(kwargs['extra']['task']))
		if ut: ut.update(buy_answer=True)
		else:
			u = UserAnonymous.objects.get(user__id=int(kwargs['extra']['uid']))
			l = Lesson.objects.get(id=int(kwargs['extra']['lesson']))
			t = Task.objects.get(id=int(kwargs['extra']['task']))
			ut = UserTask.objects.create(user=u, lesson=l, task=t, buy_answer=True)
	user.save()

success_page_visited.connect(payment_received)

#######################################################################################################################
#######################################################################################################################