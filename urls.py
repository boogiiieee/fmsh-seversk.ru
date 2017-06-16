from django.conf.urls.defaults import *
from django.conf import settings
from django.contrib.auth import views as auth_views

from django.contrib import admin
admin.autodiscover()

urlpatterns = patterns('',
	url(r'^admin/filebrowser/', include('filebrowser.urls')),
	url(r'^tinymce/', include('tinymce.urls')),
	url(r'^admin/', include(admin.site.urls)),
	url(r'^admin_tools/', include('admin_tools.urls')),
	url(r'^media/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.MEDIA_ROOT}),
	url(r'^static/(?P<path>.*)$', 'django.views.static.serve', {'document_root': settings.MEDIA_ROOT}),
	
	url(r'^captcha/', include('captcha.urls')),
	
	url(r'^', include('subject_user.urls')),
	url(r'^configuration', include('configuration.urls')),
	
	url(r'^mformulas/', include('mformulas.urls')),
	url(r'^video/', include('videoplayer.urls')),
	url(r'^training/', include('training.urls')),
	url(r'^onlineuser/', include('onlineuser.urls')),
	url(r'^actions/', include('news.urls')),
	url(r'^activity/invitefriend/', include('invitefriend.urls')),
	url(r'^', include('statistics.urls')),
	
	url(r'^register/$', 'project.views.register'),
	url(r'^register/order/(?P<user_id>[0-9]+)/$', 'project.views.order', {'type':0, 'template':'robokassa/order.html'}),
	url(r'^accounts/prolong/$', 'project.views.order', {'type':1, 'template':'robokassa/prolong.html'}),
	url(r'^accounts/analysis/$', 'project.views.order', {'type':2, 'template':'robokassa/analysis.html'}),
	url(r'^logout/$', auth_views.logout, {'next_page': '/'}, name='auth_logout'),
	url(r'^accounts/login/$', auth_views.login),
	url(r'^password/reset/$', 'django.contrib.auth.views.password_reset', {'template_name':'registration/password_reset_form1.html',} ),
	url(r'^password/reset/done/$', 'django.contrib.auth.views.password_reset_done', {'template_name':'registration/password_reset_done1.html',} ),
	url(r'^password/reset/confirm/(?P<uidb36>[0-9A-Za-z]{1,13})-(?P<token>[0-9A-Za-z]{1,13}-[0-9A-Za-z]{1,20})/$', 'django.contrib.auth.views.password_reset_confirm', {'template_name':'registration/password_reset_confirm1.html',} ),
	url(r'^password/reset/complete/$', 'django.contrib.auth.views.password_reset_complete', {'template_name':'registration/password_reset_complete1.html',} ),
	url(r'^', include('registration.urls')),
	
	url(r'^robokassa/', include('robokassa.urls')),
)