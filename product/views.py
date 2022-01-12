from django.shortcuts import render,redirect
from adminpanel.models import Item
from adminpanel.models import catagry
import os
from django.core.paginator import Paginator,EmptyPage,PageNotAnInteger
import base64
from django.core.files.base import ContentFile

from product.models import banner
def addproduct(request):
    if request.session.has_key('admin'):
        if request.method == "POST":
            prod = Item()
            prod.name = request.POST.get('name')
            
            prod.description = request.POST.get('description')
            prod.price = request.POST.get('price')
            
            
            prod.categry_id = request.POST.get('category')
            images3 = request.POST.get('croppedimage',False)
            
           
            format, img3 = images3.split(';base64,')
            ext = format.split('/')[-1]
            product_image3 = ContentFile(base64.b64decode(img3), name= prod.name + '3.' + ext)


            if len(request.FILES) != 0:
                prod.image = product_image3

            prod.save()
           
            products = Item.objects.filter(categry_id=prod.categry_id).all()
            for i in products:
                discnt = catagry.objects.get(id=prod.categry_id)
                offer = i.price * discnt.discount/100
                newprice = i.price-offer
                Item.objects.filter(categry_id=prod.categry_id,id=prod.id).update(offerprice=newprice)
            
            
                
            
            
            return redirect(listproduct)
        catid = catagry.objects.all()
        
        return render(request,'product/addproducts.html',{'value':catid})
    else:
        return render(request,'adminpanel/adminlogin.html')

def listproduct(request):
    if request.session.has_key('admin'):
        product=Item.objects.all()
        page = request.GET.get('page', 1)
        paginator = Paginator(product, 4)
        try:
            productlist = paginator.page(page)
        except PageNotAnInteger:
            productlist = paginator.page(1)
        except EmptyPage:
            productlist = paginator.page(paginator.num_pages)
        return render(request,'product/listproducts.html',{'products':productlist})
    else:
        return render(request,'adminpanel/adminlogin.html')

def editproduct(request):
    if request.session.has_key('admin'):
        id=request.GET.get('id','')
        prod=Item.objects.get(id=id)
        if request.method == 'POST':
            if len(request.FILES) != 0:
                if len(prod.image) > 0:
                    os.remove(prod.image.path)
                prod.image=request.FILES['image']
            prod.name = request.POST.get('name')
            prod.description = request.POST.get('description')
            prod.price = request.POST.get('price')
            prod.categry_id=request.POST.get('category')
            prod.save()
        cat = catagry.objects.all()       
        return render(request,'product/editproduct.html',{'prod':prod,'value':cat})
    else:
        return render(request,'adminpanel/adminlogin.html')

def deleteproduct(request):
    if request.session.has_key('admin'):
        id=request.GET.get('id','')
        product=Item.objects.get(id=id)
        if product:
            Item.objects.get(id=id).delete()
            return redirect(listproduct)
        
    else:
        return render(request,'adminpanel/adminlogin.html')

def addcategory(request):
    if request.method == 'POST':
        cat = request.POST.get('catname')
        u = catagry.objects.filter(catname=cat)
        if u:
            return render(request,'product/addcategory.html',{'error':'category already exist'})
        else:
            catagry(catname=cat).save() 
            return render(request,'adminpanel/adminhome.html')
    else:
    
        return render(request,'product/addcategory.html')

def logout(request):
    request.session.flush()
    return render(request,'adminpanel/adminlogin.html')

def addbanner(request):
    if request.method == 'POST':
        prod = banner()
        if len(request.FILES) != 0:
            prod.image = request.FILES['image']

        prod.save()
    return render(request,'product/addbanner.html')

def poffer(request):
    id = request.GET.get('id')
    if request.method == 'POST':
        percentage = request.POST.get('discount')
        items = Item.objects.get(id=id)
        offer = items.price * int(percentage)/100
        newprice = items.price-offer
        Item.objects.filter(id=id).update(offerprice=newprice)
    return render(request,'product/productoffer.html')


def newproduct(request):
    return render(request,'product/addproducts.html')