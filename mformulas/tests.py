# -*- coding: utf-8 -*-

from django.test import TestCase
from django.test.client import Client
from django.contrib.auth.models import User
import datetime

from mformulas.models import Formula, SearchFormula, PrimitiveOfFormulaTask, FormulaTaskQuestion, FormulaTaskAnswer
from mformulas.views import search_mformulas, TextToMFormula, TextToLinkSubject
from subject.models import Task

class mformulasTest(TestCase):
	def setUp(self):
		self.client = Client()
		
	def test1(self):
		print 'Start test MFormulas'
		
		username = 'test_user'
		pwd = 'secret'
		
		self.u = User.objects.create_user(username, '', pwd)
		self.u.is_staff = True
		self.u.is_superuser = True
		self.u.save()

		self.assertTrue(self.client.login(username=username, password=pwd),
			"Logging in user %s, pwd %s failed." % (username, pwd))

		self.assertTrue(PrimitiveOfFormulaTask.objects.create(expression="[0-9]+"),
			"Can not create new row in PrimitiveOfFormulaTask table.")
		self.assertTrue(PrimitiveOfFormulaTask.objects.create(expression="\\frac\{.+?\}\{.+?\}"),
			"Can not create new row in PrimitiveOfFormulaTask table.")
			
		self.assertTrue(FormulaTaskAnswer.objects.create(answer_tex="0"),
			"Can not create new row in FormulaTaskAnswer table.")
		self.assertTrue(FormulaTaskAnswer.objects.create(answer_tex="1"),
			"Can not create new row in FormulaTaskAnswer table.")
		
		self.assertTrue(Formula.objects.create(title="a^2+b^2=c^2", tex="a^2+b^2=c^2"),
			"Can not create new row in Formula table.")
		self.assertTrue(Formula.objects.create(title="\frac{(a+b )^2}{4}-\frac{(a-b )^2}{4}=ab", tex="\frac{(a+b )^2}{4}-\frac{(a-b )^2}{4}=ab"),
			"Can not create new row in Formula table.")
			
		f = Formula.objects.all()[0]
		self.assertTrue(f.get_formula() == u'$$%s$$' % f.tex,
			"Error in method get_formula()")
			
		self.assertTrue(FormulaTaskQuestion.objects.all().count()==2,
			"Did not create formula's question.")
		self.assertTrue(FormulaTaskAnswer.objects.all().count()==4,
			"Did not create formula's question's answer.")
			
		q = FormulaTaskQuestion.objects.all()[0]
		self.assertTrue(len(q.get_answers()) == 4, "Error in method get_answers()")
		self.assertTrue(q.get_true_answer(), "Error in method get_true_answer()")
		
		response = self.client.get('/mformulas/select/')
		self.assertEqual(response.status_code, 200)
		
		self.assertTrue(Task.objects.create(title='test', text_task='test {{mformulas:%d}} test' % f.id),
			"Can not create new row in Task table.")
		
		search_mformulas([Task])
		
		self.assertTrue(SearchFormula.objects.all().count()==1,
			"Did not found formula in SearchFormula table.")
			
		self.assertTrue(TextToMFormula('test {{mformulas:%d}} test' % f.id) == 'test $$%s$$ test' % f.tex, "Error in function TextToMFormula()")
			
		self.assertTrue(TextToLinkSubject('<a href="/formula/click/1/">test</a>', '5') == '<a href="/formula/click/1/?subject_name=5">test</a>',
			"Error in function TextToLinkSubject()")
			
		self.client.logout()
		
		print 'End test MFormulas'