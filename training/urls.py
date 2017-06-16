from django.conf.urls.defaults import *

urlpatterns = patterns('training.views',
	(r'^$', 'training_start'),
	(r'^check/(?P<dictionary_id>[0-9]{1,4})/(?P<question_id>[0-9]{1,4})/(?P<answer_id>[0-9]{1,4})/$', 'training_check'),
	(r'^is_online/$', 'is_online'),
)