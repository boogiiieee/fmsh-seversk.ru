# -*- coding: utf-8 -*-

from django.db import models
from django.utils.translation import ugettext_lazy as _
from tinymce import models as TinymceField
from sorl.thumbnail import ImageField as SorlImageField
from django.core.exceptions import ValidationError
import datetime
import re
import os

class news_article(models.Model):
	title = models.CharField(max_length=100, verbose_name=_("title"))
	image = SorlImageField(upload_to=u'upload/news/image/', verbose_name=_("image"), blank=True, null=True)
	announcement = TinymceField.HTMLField(max_length=500, verbose_name=_("announcement"))
	text = TinymceField.HTMLField(max_length=100000, verbose_name=_("text"))
	created_at = models.DateTimeField(verbose_name = _("date_created"), default=datetime.datetime.now())
	
	is_active = models.BooleanField(verbose_name=_("is_active"), default=True)
	sort = models.IntegerField(verbose_name=_("order"), default=0)
	
	def __unicode__(self):
		return u'%s' % self.title
		
	@models.permalink
	def get_absolute_url(self):
		return ('news_item_url', (), {'id': self.id})
		
	@models.permalink
	def get_absolute_olympiad_url(self):
		return ('olympiad_news_item_url', (), {'id': self.id})
		
	def clean(self):
		r = re.compile('^([a-zA-Z0-9_-]+)\.([a-zA-Z0-9_-]+)$')
		if self.image:
			if not r.findall(os.path.split(self.image.url)[1]):
				raise ValidationError(_("File_name_validation_error"))
		
	class Meta: 
		verbose_name = _("actions article")
		verbose_name_plural = _("actions")
		ordering = ['sort','-created_at']