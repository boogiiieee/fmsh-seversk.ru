# -*- coding: utf-8 -*-

from django.contrib import admin
from sorl.thumbnail.admin import AdminImageMixin

from admintrans.admin import *
from news.models import news_article

class news_article_admin(AdminImageMixin, admin.ModelAdmin):
	list_display = ('title', 'created_at', 'is_active', 'sort')
	list_filter = ('is_active', 'created_at')
	list_editable = ('is_active', 'sort')
 
admin.site.register(news_article, news_article_admin)