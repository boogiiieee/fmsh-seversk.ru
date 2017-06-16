# -*- coding: utf-8 -*-

from django import template
from django.template import Node, NodeList, Template, Context, Variable
from django.template import TemplateSyntaxError
from django.template import get_library, Library, InvalidTemplateLibrary
from django.utils.translation import ugettext_lazy as _
from django.shortcuts import render_to_response
import settings
import os
import re

from invitefriend.models import Friend
from django.contrib.auth.models import User

register = template.Library()

#######################################################################################################################
#######################################################################################################################

class InviteFriensListNode(Node):
	def __init__(self):
		pass

	def render(self, context):
		user = context['request'].user
		if user.is_authenticated():
			friends = User.objects.filter(is_active=True, email__in=Friend.objects.filter(user=user).values('email'))
			return render_to_response('friends.html', {'friends':friends})._get_content()
		return u''

def InviteFriensList(parser, token):
	bits = token.split_contents()
	if len(bits) > 1:
		raise TemplateSyntaxError(_("Error token tag \"InviteFriensList\""))
	return InviteFriensListNode()

register.tag('InviteFriensList', InviteFriensList)

#######################################################################################################################
#######################################################################################################################