from django.contrib import admin

from registration.models import RegistrationProfile

from admintrans.admin import *

class RegistrationAdmin(admin.ModelAdmin):
    list_display = ('__unicode__', 'activation_key_expired')
    search_fields = ('user__username', 'user__first_name')


#admin.site.register(RegistrationProfile, RegistrationAdmin)
