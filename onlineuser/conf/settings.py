# -*- coding: utf-8 -*-

import os
from django.conf import settings

ACTIVITY = getattr(settings, 'ONLINEUSER_ACTIVITY', 60) #Временной интервал, по рошествию которого пользователь считается неактивным (сек.)