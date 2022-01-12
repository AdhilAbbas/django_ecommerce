from django import forms
from django.contrib.auth.models import User
from django.contrib.auth.forms import UserCreationForm
from app.models import Address



class Signinform(forms.Form):
    username = forms.CharField()
    password = forms.CharField()
    class Meta:
        model = User
    

class Signupform(forms.Form):
    username = forms.CharField()
    email = forms.CharField()
    number = forms.CharField()
    password = forms.CharField()



