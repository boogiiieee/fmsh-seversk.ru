# -*- coding: utf-8 -*-

from django.template import RequestContext
from django.http import HttpResponseRedirect, HttpResponse, Http404
from django.template import Context
from decimal import Decimal
import datetime

from onlineuser.conf import settings
from onlineuser.models import OnlineDayUser

#######################################################################################################################
#######################################################################################################################

#Делает отметку об активности пользователя
def is_online(request):
	if request.is_ajax():
		now = datetime.datetime.now()
		d, create = OnlineDayUser.objects.get_or_create(user=request.user_anonymous, day=now)
		if d.last_activity:
			interval = now - d.last_activity
			if interval.seconds <= 2 * settings.ACTIVITY:
				d.duration_of_visits += Decimal(interval.seconds, 2) / 60
		d.last_activity = datetime.datetime.now()
		d.save()
		return HttpResponse('1')
	else:
		return HttpResponse(status=400)

#######################################################################################################################
#######################################################################################################################