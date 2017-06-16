# -*- coding: utf-8 -*-

from subject.models import Subject

##################################################################################################	
##################################################################################################

def custom_proc(request):
	subject_list = False
	olympiad_list = False
	level = 1
	subject_name = None
	userput = None
	
	try: subject_name = request.GET.get('subject_name')
	except: pass
		
	try: subject_list = Subject.objects.filter(is_active=True, is_olympiad=False)		
	except: pass
	
	try: olympiad_list = Subject.objects.filter(is_active=True, is_olympiad=True)		
	except: pass
		
	try: put = request.get_full_path()
	except: pass
	
	try: userput =  '%s%s' % (request.user_anonymous, put)
	except: pass
	
	return {
		'subject_list': subject_list,
		'olympiad_list': olympiad_list,
		'put' :  put,
		'userput' : userput,
		'subject_name' : subject_name
	}
	
##################################################################################################	
##################################################################################################