����������� �����, ����������� ������������� �� �����.

1) � settings - 'onlineuser',
2) � urls - url(r'^onlineuser/', include('onlineuser.urls')),
3) � ������ - {% load onlineuser_tags %} {% OnlineUserMedia %}
4) manage.py syncdb