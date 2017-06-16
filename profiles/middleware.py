# -*- coding: utf-8 -*-

import uuid

from profiles.models import UserAnonymous
	
#######################################################################################################################
#######################################################################################################################

#Добавляет в request user_anonymous
class UserAnonymousMiddleware(object):
	def process_request(self, request):
		u = None
		if request.user.is_authenticated():
			u, create = UserAnonymous.objects.get_or_create(user=request.user)
		else:
			if 'fmsh_anonymous' in request.COOKIES:
				ident = request.COOKIES['fmsh_anonymous']
			else:
				ident = str(uuid.uuid4())
			u, create = UserAnonymous.objects.get_or_create(anonymous=ident)
				
		request.user_anonymous = u
		
	def process_response(self, request, response):
		has_session = bool(getattr(request, 'session', False))
		if has_session == True:
			if not request.user.is_authenticated():
				if not 'fmsh_anonymous' in request.COOKIES:
					ident = str(uuid.uuid4())
					u, create = UserAnonymous.objects.get_or_create(anonymous=ident)
					response.set_cookie("fmsh_anonymous", ident, path="/")
					request.__class__.user_anonymous = u
		return response
		
#######################################################################################################################
#######################################################################################################################