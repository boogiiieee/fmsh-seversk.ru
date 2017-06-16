# -*- coding: utf-8 -*-

import os
from django.conf import settings

INTERVAL = getattr(settings, 'STATISTICS_INTERVAL', 30) #За какое кол-во дней выводить статистику в журнале