from django.conf.urls.defaults import *

urlpatterns = patterns('onlineuser.views',
	(r'^is_online/$', 'is_online'),
)