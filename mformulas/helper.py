# -*- coding: utf-8 -*-

from django.views.decorators.cache import never_cache
from django.db.models.fields import CharField, TextField
from django.utils.safestring import mark_safe
import re

from mformulas.models import Formula, SearchFormula

#######################################################################################################################
#######################################################################################################################

#Находит токены формулы в тексте и заменяет их на формулы
def get_tex(match):
	try: return u"$$%s$$" % Formula.objects.get(id=int(match.group(1))).tex
	except: return u""

def TextToMFormula(s):
	p = re.compile(r'{{mformulas:([0-9]+)}}')
	return mark_safe(p.sub(get_tex, s))
	
#######################################################################################################################
#######################################################################################################################
	
class ChangingString():
	subject = None
	def __init__(self, subject): self.subject = subject
	def add_subject_name(self, match): 
		return u"%s?subject_name=%s\"" % (str(match.group(0))[0:-1], self.subject)
	
#Находит ссылки на формулы в тексте и добавляет гет параметр предмет
def TextToLinkSubject(s, subject):
	p = re.compile('href="/formula/click/([0-9]+?)/"')
	cs = ChangingString(subject)
	return mark_safe(p.sub(cs.add_subject_name, s))
	
#######################################################################################################################
#######################################################################################################################

#Поиск формул в моделях
def search_mformulas(models=[]):
	SearchFormula.objects.all().delete()
	for model in models:
		qs = model.objects.all()
		for q in qs:
			for field in q._meta.fields:
				if isinstance(field, CharField) or isinstance(field, TextField):
					value = getattr(q, field.name)
					if value:
						p = re.compile(r'{{mformulas:([0-9]+)}}')
						for f in p.finditer(value):
							try: title = q.get_title()
							except: title = ''
							try: link = q.get_absolute_url()
							except: link = ''
							SearchFormula.objects.get_or_create(
								formula = Formula.objects.get(id=f.group(1)),
								title = title,
								link = link,
								model_name = model._meta.object_name,
								field_name = field.name,
								obj_id = q.id
							)
	return
	
#######################################################################################################################
#######################################################################################################################