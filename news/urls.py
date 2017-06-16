from django.conf.urls.defaults import *

urlpatterns = patterns('news.views',
	url(r'^$', 'all'),
	url(r'^(?P<page>[0-9]{1,4})/$', 'all'),
	url(r'^full/(?P<id>[0-9]{1,4})/$', 'full', name='news_item_url'),
	
	url(r'^olympiad/$', 'all', {'template_name':'olympiad_news_all.html'}),
	url(r'^olympiad/(?P<page>[0-9]{1,4})/$', 'all', {'template_name':'olympiad_news_all.html'}),
	url(r'^olympiad/full/(?P<id>[0-9]{1,4})/$', 'full', {'template_name':'olympiad_news_full.html'}, name='olympiad_news_item_url'),
)