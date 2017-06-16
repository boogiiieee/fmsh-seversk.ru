# -*- coding: utf-8 -*-

from django import template
from django.template import Node, NodeList, Template, Context, Variable
from django.template import TemplateSyntaxError
from django.template import get_library, Library, InvalidTemplateLibrary
from django.utils.translation import ugettext_lazy as _

register = template.Library()

from onlineuser.conf import settings

#######################################################################################################################
#######################################################################################################################

class OnlineUserNode(Node):
	def __init__(self):
		pass

	def render(self, context):
		return u'''
			<script>
				var onlineuser_active = true;

				function IsOnlineUser(){
					if(onlineuser_active){
						$.ajax({
							type: "GET",
							url: "/onlineuser/is_online/"
						});
					}
					setTimeout("IsOnlineUser()", %d*1000);
				}
				
				window.onblur = function(){ onlineuser_active = false; };
				window.onfocus = function(){ onlineuser_active = true; };
				IsOnlineUser();
			</script>
		''' % settings.ACTIVITY

def OnlineUserMedia(parser, token):
	bits = token.split_contents()
	if len(bits) > 1:
		raise TemplateSyntaxError(_("Error token tag \"OnlineUserMedia\""))
	return OnlineUserNode()

register.tag('OnlineUserMedia', OnlineUserMedia)

#######################################################################################################################
#######################################################################################################################