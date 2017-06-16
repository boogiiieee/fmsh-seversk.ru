from django.conf.urls.defaults import *

urlpatterns = patterns('subject_user.views',
	url(r'^formula/click/(?P<id>[0-9]+)/$', 'add_formula_dictionary'),
	url(r'^video_on_play/click/$', 'video_on_play'),
	
	url(r'^dictionary/$', 'dictionary'),
	
	url(r'^subjects/lesson/bookmark/(?P<id>[0-9]+)/$', 'add_lesson_bookmark'),
	url(r'^subjects/lesson/bookmark/$', 'bookmark'),

	url(r'^$', 'view_full_lesson'),
	url(r'^subjects/lesson/$', 'view_full_lesson'),
	url(r'^subjects/lesson/(?P<item>([a-zA-Z0-9_-]+))/$', 'lesson_item'),
	url(r'^subjects/lesson/task/results/$', 'result_task_item'),
	
	url(r'^subjects/offset/$', 'view_full_offset'),
	url(r'^subjects/offset/info/$', 'info_offset'),
	url(r'^subjects/offset/(?P<item>[a-zA-Z0-9_-]+)/results/$', 'result_offset_item'),
	url(r'^subjects/offset/(?P<item>([a-zA-Z0-9_-]+))/$', 'offset_item'),
	
	url(r'^subjects/use/$', 'view_full_use'),
	url(r'^subjects/use/(?P<item>[a-zA-Z0-9_-]+)/results/$', 'result_use_item'),
	url(r'^subjects/use/(?P<item>([a-zA-Z0-9_-]+))/$', 'use_item'),
	
	url(r'^olympiad/$', 'view_full_olympiad'),
	url(r'^olympiad/lesson/$', 'view_full_olympiad'),
	url(r'^olympiad/lesson/(?P<item>([a-zA-Z0-9_-]+))/$', 'olympiad_item'),
)