from django.conf.urls.defaults import *

urlpatterns = patterns('statistics.views',
	(r'^statistics/$', 'statistics_views'),
	(r'^activity/$', 'activity_views'),
	
	(r'^statistics/olympiad/$', 'olympiad_statistics_views'),
	(r'^activity/olympiad/$', 'activity_views', {'template':'olympiad_activity.html', 'olympiad':True}),
)