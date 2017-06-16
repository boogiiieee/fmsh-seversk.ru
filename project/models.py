# -*- coding: utf-8 -*-

from django.db import models
from tinymce import models as tinymce_model

# class article(models.Model):
	# title = models.CharField(max_length=100, verbose_name=u'заголовок')
	# text = tinymce_model.HTMLField(max_length=10000, verbose_name=u'текст')
	
	# def __unicode__(self):
		# return self.title
		
	# def get_absolute_url(self):
		# return u'/article/%d/' % self.id
		
	# class Meta: 
		# verbose_name = u'статья' 
		# verbose_name_plural = u'статьи'