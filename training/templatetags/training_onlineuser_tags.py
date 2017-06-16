# -*- coding: utf-8 -*-

from django import template
from django.template import Node, NodeList, Template, Context, Variable
from django.template import TemplateSyntaxError
from django.template import get_library, Library, InvalidTemplateLibrary
from django.utils.translation import ugettext_lazy as _

register = template.Library()

from training.conf import settings

#######################################################################################################################
#######################################################################################################################

class TrainingOnlineUserMediaNode(Node):
	def __init__(self):
		pass

	def render(self, context):
		return u'''
			<script>
				var training_onlineuser_active = true;

				function TrainingIsOnlineUser(){
					if(onlineuser_active){
						$.ajax({
							type: "GET",
							url: "/training/is_online/"
						});
					}
					setTimeout("TrainingIsOnlineUser()", %d*1000);
				}
				
				window.onblur = function(){ onlineuser_active = false; };
				window.onfocus = function(){ onlineuser_active = true; };
				TrainingIsOnlineUser();
			</script>
		''' % settings.ACTIVITY

def TrainingOnlineUserMedia(parser, token):
	bits = token.split_contents()
	if len(bits) > 1:
		raise TemplateSyntaxError(_("Error token tag \"TrainingOnlineUserMedia\""))
	return TrainingOnlineUserMediaNode()

register.tag('TrainingOnlineUserMedia', TrainingOnlineUserMedia)

#######################################################################################################################
#######################################################################################################################