
from django.contrib import auth
from django.contrib.auth.models import User
from django.shortcuts import redirect, render
from .models import Item, coupon
import os
from adminpanel.models import catagry
from django.db.models.aggregates import Count, Sum


from app.models import Accounts, order, ordereditem

def adminlogin(request):
    if request.session.has_key('admin'):
        return redirect(adminhome)
    else:
        
        if request.method == 'POST':
            username=request.POST.get('name2',False)
            password=request.POST.get('pass2',False)
            user=auth.authenticate(username=username,password=password)
            u=User.objects.get(username=username)
            if user:
                if u.is_superuser==1:
                    request.session['admin'] = True
                    return redirect(adminhome)
                
            else:
                return render(request,'adminpanel/adminlogin.html',{'error':'Invalid credentials'})
        else:

            return render(request,'adminpanel/adminlogin.html')


def adminhome(request):
    if request.session.has_key('admin'):
        return render(request,'adminpanel/adminhome.html')
    else:
        return redirect(adminlogin)

def viewuser(request):
    if request.session.has_key('admin'):
        user=User.objects.all()
        c=Accounts.objects.all()
        return render(request,'adminpanel/adminhome.html',{'us':user,'uu':c})
    else:
        return redirect(adminlogin)

def block(request):
    if request.session.has_key('admin'):
        id=request.GET.get('id','')
        user=User.objects.filter(id=id)
        if user:
            User.objects.filter(id=id).update(is_active=0)
            return redirect(viewuser)
    else:
        return redirect(adminlogin)
def unblock(request):
    if request.session.has_key('admin'):
        id=request.GET.get('id','')
        User.objects.filter(id=id).update(is_active=1)
        return redirect(viewuser)
    else:
        return redirect(adminlogin)


def logout(request):
    request.session.flush()
    return redirect(adminlogin)


def orderedproducts(request):
    orders = order.objects.all().order_by('-date_added')
    return render(request,'adminpanel/orderedproducts.html',{'value':orders})

def orderdetails(request):
    id = request.GET.get('id','')
    orders = order.objects.get(id=id)
    item = ordereditem.objects.filter(order_id=id).all()
    return render(request,'adminpanel/view.html',{'value1':orders,'value2':item})

def updatestatus(request,id):
    stats = request.GET.get('action')
    order.objects.filter(id=id).update(status=stats)
    return redirect(orderedproducts)

def discount(request):

    if  request.method == 'POST':
        discnt = int(request.POST.get('discount'))
        categor = int(request.POST.get('category'))
        c=catagry.objects.filter(id=categor).update(discount=discnt)
        products = Item.objects.filter(categry_id=categor).all()
        for i in products:
            offer = i.price * discnt/100
            newprice = i.price-offer
            print(newprice)
            Item.objects.filter(categry_id=categor,id=i.id).update(offerprice=newprice)

    
    
    
    catid = catagry.objects.all()

    return render(request,'adminpanel/discount.html',{'value':catid})


def addcoupon(request):
    if request.method == 'POST':
        code = request.POST.get('code')
        discnt = request.POST.get('discount')
        coupon(couponcode=code,discount=discnt,isactive=1).save()
    return render(request,'adminpanel/addcoupon.html')


def managecoupon(request):

    coupons = coupon.objects.all()
    return render(request,'adminpanel/managecoupon.html',{'value':coupons})

def changestatus(request):
    id = request.GET.get('id','')
    print(id)
    coupons = coupon.objects.get(id=id)
    if coupons.isactive == 1:
        coupon.objects.filter(id=id).update(isactive=0)
        
    else:
        coupon.objects.filter(id=id).update(isactive=1)
    return redirect(managecoupon)




def salesreport(request):
    
    total = order.objects.values('date_added__month','date_added__day','date_added__year').filter(status='delivered').annotate(Sum('total'))[:7]
    stats = order.objects.values('mode').annotate(Count('mode'))
    stats2 = order.objects.values('status').annotate(Count('status'))


    return render(request,'adminpanel/salesreport.html',{'total':total,'status':stats,'status2':stats2})

def salesreport1(request):
    if request.method == 'POST':
        date1 = request.POST.get('date1')
        date2 = request.POST.get('date2')
        salesreport = ordereditem.objects.values('product_id__name','product_id__price','product_id__categry_id__catname').filter(order_id__status = 'delivered',order_id__date_added__range=[date1,date2]).annotate(qty=Sum('quantity'),sumprice=Sum('price'))
        date = 'From : ' + date1 + '  To : ' + date2
        price = ordereditem.objects.filter(order_id__status='delivered',order_id__date_added__range=[date1,date2]).aggregate(Sum('price'))
        return render(request,'adminpanel/salesreport1.html',{'sales':salesreport,'date':date,'total':price})
    return render(request,'adminpanel/salesreport1.html')
    
def categorymanagement(request):
    catgry=catagry.objects.all()
    if request.method == 'POST':
        id = request.POST.get('category')
        Item.objects.filter(categry_id=id).delete()
        catagry.objects.filter(id=id).delete()
    return render(request,'adminpanel/categorymanagement.html',{'value':catgry})




