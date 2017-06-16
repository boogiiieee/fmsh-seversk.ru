# -*- coding: utf-8 -*-

import os
from django.conf import settings

PAGINATE_BY = getattr(settings, 'FMSH_PAGINATE_BY', 10)