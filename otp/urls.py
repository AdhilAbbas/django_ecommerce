from django.urls import path,include
from . import views
urlpatterns=[
    path('',views.phone_verification,name="phoneverification"),
    path('/otpconfirm',views.token_validation,name="confirm"),
    
    
]