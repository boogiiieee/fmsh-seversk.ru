Отслеживает время, проведенное пользователем на сайте.

1) в settings - 'onlineuser',
2) в urls - url(r'^onlineuser/', include('onlineuser.urls')),
3) в шаблон - {% load onlineuser_tags %} {% OnlineUserMedia %}
4) manage.py syncdb