from django.http.response import HttpResponse
from django.shortcuts import render,redirect
from django.contrib.auth.models import User
from adminpanel.models import Item
from app.models import Accounts
from app.views import signin
from .models import profile
import random

import http.client

from django.conf import settings
from django.contrib.auth import authenticate, login





from django.shortcuts import render, redirect

from . import twilio_client



def phone_verification(request):
    if request.method == 'POST':
        mobile=request.POST.get('number',False)
        user=Accounts.objects.filter(phone=mobile)
        if user:
            request.session['phone_number'] = mobile
            mobile = '+91'+ mobile
            verification = twilio_client.verifications(mobile, 'sms')
            return redirect(token_validation)
        else:
            return render(request,'otp/otplogin.html',{'error':'User not present'})
    else:
        return render(request,'otp/otplogin.html')
       


def token_validation(request):
    if request.method == 'POST':
        otp = request.POST.get('otp')
        
        
        verification = twilio_client.verification_checks('+91'+request.session['phone_number'],otp)

        if verification.status == 'approved':
            mobile = request.session['phone_number']
            p = Accounts.objects.get(phone=mobile)
            user = User.objects.get(id=p.user_id)
            

            request.session['user'] = user.email
           
            return redirect(signin)
        else:
            return render(request,'otp/otpsubmission.html',{'error':'invalid otp'})

            
    else:
        
        return render(request,'otp/otpsubmission.html')









