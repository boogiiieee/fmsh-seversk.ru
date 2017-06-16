# -*- coding: utf-8 -*-

import os
from django.conf import settings

QUANTITY_OF_FORMULAS = getattr(settings, 'TRAINING_QUANTITY_OF_FORMULAS', 5) #Кол-во формул в одной тренировке
MATURING_TIME = getattr(settings, 'TRAINING_MATURING_TIME', 6) #Кол-во часов созревания формулы
RIGHT_ANSWERS = getattr(settings, 'TRAINING_RIGHT_ANSWERS', 6) #Кол-во удачных попыток, чтобы считать формулу выуч.

ACTIVITY = getattr(settings, 'TRAINING_ONLINEUSER_ACTIVITY', 60) #Временной интервал, по прошествию которого пользователь считается неактивным (сек.)