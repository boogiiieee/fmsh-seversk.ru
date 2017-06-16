from django.conf.urls.defaults import *

urlpatterns = patterns('mformulas.views',
	url(r'^select/$', 'select'),
	url(r'^dictionary/$', 'dictionary'),
	
	url(r'^latex_editor/$', 'latex_editor'),
	url(r'^latex_preview/$', 'latex_preview'),
)