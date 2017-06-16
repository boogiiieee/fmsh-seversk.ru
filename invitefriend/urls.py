from django.conf.urls.defaults import *

urlpatterns = patterns('invitefriend.views',
	url(r'^$', 'invite', {'template':'invite.html'}),
	url(r'^thanks/$', 'thanks', {'template':'thanks.html'}),
)