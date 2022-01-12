from typing import ItemsView
from django.contrib.auth.backends import RemoteUserBackend
from django.contrib.auth.models import User
from django.db.models.aggregates import Sum
from django.db.models.query_utils import Q
from django.shortcuts import redirect, render
from adminpanel.views import discount
from app.models import Accounts, Address, order, wishlist,cart,ordereditem,couponapplied
from django.contrib import auth
from adminpanel.models import Item,coupon
from .forms import Signinform,Signupform
from mainproject.settings import RAZORPAY_API_KEY,RAZORPAY_API_SECRET_KEY
import razorpay
from product.models import banner


def signin(request):
    
    if request.session.has_key('user'):
        obj=Item.objects.all()
        cartt = cart.objects.all().count()
        banr = banner.objects.all()
        return render(request,'app/home.html',{'value':obj,'number':cartt,'banner':banr})
    
    if request.method == 'POST':
        form=Signinform(request.POST)
        if form.is_valid():
            name = form.cleaned_data['username']
            passw = form.cleaned_data['password']
        
            user=auth.authenticate(username=name,password=passw,is_active=1)
            if user:
                em = User.objects.get(username=name)
                request.session['user']= em.email
                obj=Item.objects.all()
                u = User.objects.get(username=name)
                s = u.id
                
                auth.login(request,user)
                cartt = cart.objects.filter(user_id=s).count()
                banr = banner.objects.all()
                return render(request,'app/home.html',{'value':obj,'number':cartt,'banner':banr})
            else:
                return render(request,'app/signin.html',{'error':'User doesnt exist','form':form})
    else:
        form=Signinform()
        return render(request,'app/signin.html',{'form':form})

def signup(request):
   
    if request.method == 'POST':
        
        form = Signupform(request.POST)
        if form.is_valid():
            name = form.cleaned_data['username']
            email = form.cleaned_data['email']
            number = form.cleaned_data['number']
            password = form.cleaned_data['password']

            users = auth.authenticate(username=name,email=email)

        
        # users=User.objects.filter(Q(username=name) | Q(email=email)) 
        
            if not users:
                ph=Accounts.objects.filter(phone=number)
                if not ph:
                    
                    user=User.objects.create_user(username=name,email=email,password=password)
                    user.save()
                    em = User.objects.get(username=name)
                    request.session['user']= em.email
                    id = User.objects.get(username=name)
                    Accounts(phone=number,user_id=id.id).save()
                    obj=Item.objects.all()
                    
                    return render(request,'app/home.html',{'value':obj})
                else:
                    return render(request,'app/signup.html',{'error':'phone number exists','form':form})
            
        else:
            return render(request,'app/signup.html',{'error':'User already exist'})

    else:
        form = Signupform()
        return render(request,'app/signup.html',{'form':form})
def showproduct(request):
    if request.session.has_key('user'):
        id= request.GET.get('id','')
        obj=Item.objects.filter(id=id).all()
        email = request.session['user']
        user = User.objects.get(email=email)
        cartt = cart.objects.filter(user_id=user.id).count()
        return render(request,'app/showproduct.html',{'value':obj,'number':cartt})
    else:
        return redirect(signin)
def logout(request):
    request.session.flush()
    return redirect(signin)


def myaccount(request):
    email = request.session['user']
    obj = User.objects.get(email=email)
    obj2 = Accounts.objects.get(user_id=obj.id)
    obj3 = Address.objects.filter(user_id=obj.id)

    
    return render(request,'app/myaccount.html',{'value':obj,'phone':obj2,'a':obj3})

def updateaddress(request):
    if request.method == 'POST':
        name = request.POST.get('name')
        em = request.POST.get('email')
        phone = request.POST.get('phone')
        
        email = request.session['user']
        obj = User.objects.get(email=email)
        
        Accounts.objects.filter(user_id=obj.id).update(phone=phone)
        User.objects.filter(id=obj.id).update(username=name,email=em)
        
        return redirect(myaccount)

def eachaddressupdate(request,id):
    if request.method == 'POST':
        name1 = request.POST.get('name1')
        address = request.POST.get('address')
        state = request.POST.get('state')
        city = request.POST.get('city')
        zipcode = request.POST.get('zipcode')
        Address.objects.filter(id=id).update(name=name1,Address=address,state=state,city=city,zipcode=zipcode)
        return redirect(myaccount)

def removeaddress(request,id):
    email = request.session['user']
    user = User.objects.get(email=email)
    Address.objects.filter(id=id).delete()
    alladdress= Address.objects.filter(user_id=user.id)
    return render(request,'app/alladdresses.html',{'address':alladdress})
    
    
def addaddress(request):
    if request.method == 'POST':
        name = request.POST.get('name')
        address = request.POST.get('address')
        state = request.POST.get('state')
        city = request.POST.get('city')
        zip = request.POST.get('zip')
        email = request.session['user']
        phone = request.POST.get('phone')
        
        obj = User.objects.get(email=email)
        # if Address.objects.filter(user_id=obj.id,is_active=1):
        #     Address.objects.filter(user_id = obj.id).update(is_active=0)



        Address(user_id=obj.id,name=name,Address=address,state=state,city=city,zipcode=zip,is_active=0,phone=phone).save()
        return redirect(myaccount)
        
    return render(request,'app/addaddress.html')



    






def wishlistes(request):
    
    id = request.GET.get('id','')
    
    email = request.session['user']
    user= User.objects.get(email=email)
    wish = wishlist.objects.filter(product_id=id,user_id=user.id)
    if not wish:
        wishlist(product_id=id,user_id=user.id).save()
        request.session['wishlist'] = id
        obj=Item.objects.all()
        
        return render(request,'app/home.html',{'value':obj})
    else:
        return redirect(signin)

def wish(request):
    email = request.session['user']
    user= User.objects.get(email=email)
    wish = wishlist.objects.filter(user_id=user.id)
    cartt = cart.objects.filter(user_id=user.id).all()
    number = cartt.count()
    

    return render(request,'app/wishlist.html',{'value':wish,'number':number})

def wishremove(request):
    id = request.GET.get('id','')
    
    wishlist.objects.get(id=id).delete()
   
    return redirect(wish)


def carts(request):
    email = request.session['user']
    user = User.objects.get(email=email)
    cartt = cart.objects.filter(user_id=user.id).all()
    cartamt = cartt.aggregate(Sum('totalprice'))
    offeramnt = cartt.aggregate(Sum('discountprice'))
    
    number = cartt.count()
    
    

    



    return render(request,'app/cart.html',{'value':cartt,'sum':cartamt,'number':number,'discount':offeramnt})

def tocart(request):
    id = request.GET.get('id','')
    email = request.session['user']
    user = User.objects.get(email=email)
    produc = Item.objects.get(id=id) 
    mycart = cart.objects.filter(product_id=id,user_id=user.id).all()
    # print(mycart.id)
    if not mycart:
    
        ob = cart()
        ob.product_id = id
        ob.user_id = user.id
        ob.totalprice = produc.price
        ob.quantity = 1
        ob.discountprice=produc.offerprice      
        ob.save()
    cartt = cart.objects.filter(user_id=user.id).all()
    cartamt = cartt.aggregate(Sum('totalprice'))
    offeramnt = cartt.aggregate(Sum('discountprice'))
    number = cartt.count()
    # items = Item.objects.get(id=id)
    

    return render(request,'app/cart.html',{'value':cartt,'sum':cartamt,'number':number,'discount':offeramnt})

       
        # return redirect(signin)
    # else:
    #     return redirect(signin)
    
    
    
def up(request,id):
    cartt=cart.objects.get(id=id)
    if cartt.quantity == 0:
        cartremove(request,id)
       
    else:
        if cartt.discountprice == 0:
            product_id = cartt.product_id
            items = Item.objects.get(id=product_id)
            cartt.quantity = cartt.quantity + 1
            cartt.totalprice = cartt.totalprice + items.price
            cartt.save()
        else:
            product_id = cartt.product_id
            items = Item.objects.get(id=product_id)
            cartt.quantity = cartt.quantity + 1
            cartt.discountprice = cartt.discountprice + items.offerprice
            cartt.save()


    return redirect(carts)










def down(request,id):
   
    cartt=cart.objects.get(id=id)
    if cartt.quantity == 0:
        cartremove(request,id)
    else:
        
        if cartt.discountprice == 0:
            product_id = cartt.product_id
            items = Item.objects.get(id=product_id)
            cartt.quantity = cartt.quantity - 1
            cartt.totalprice = cartt.totalprice - items.price
            cartt.save()
        else:
            product_id = cartt.product_id
            items = Item.objects.get(id=product_id)
            cartt.quantity = cartt.quantity - 1
            cartt.discountprice = cartt.discountprice - items.offerprice
            cartt.save()



    
    return redirect(carts)









    


def cartremove(request,id):
    cart.objects.get(id=id).delete()
    return redirect(carts)

def alladdress(request):
    email = request.session['user']
    user = User.objects.get(email=email)
    address= Address.objects.filter(user_id=user.id)
    return render(request,'app/alladdresses.html',{'address':address})

def cart2(request,id):
    wish=wishlist.objects.get(id=id)
    i=Item.objects.get(id=wish.product_id)
    cartt = cart.objects.filter(product_id=wish.product_id,user_id=wish.user_id)
    if not cartt:
        if i.offerprice == 0:
            cart(product_id=wish.product_id,user_id=wish.user_id,totalprice=i.price).save()
            wishlist.objects.get(id=id).delete()
            return redirect(signin)
        else:
            cart(product_id=wish.product_id,user_id=wish.user_id,totalprice=i.offerprice,discountprice=i.offerprice).save()
            wishlist.objects.get(id=id).delete()
            return redirect(signin)
    else:
        wishlist.objects.get(id=id).delete()
        return redirect(signin)

def checkout(request):
    email = request.session['user']
    user = User.objects.get(email=email)
    cartelemenets = cart.objects.filter(user_id=user.id)
    for i in cartelemenets:
        if i.quantity == 0:
            id =i.id
            cartremove(request,id)
            return redirect(signin)
        else:
            email = request.session['user']
            user = User.objects.get(email=email)
            cartobj = cart.objects.filter(user_id=user.id)
            sum = cartobj.aggregate(Sum('totalprice'))
            discamnt = cartobj.aggregate(Sum('discountprice'))
            address = Address.objects.filter(user_id=user.id)
            discamnt1 = list(discamnt.values())
            sum1 = list(sum.values())
            sum2 = int(sum1[0] * 100)
            discamnt2 = int(discamnt1[0] * 100)
            client = razorpay.Client(auth=(RAZORPAY_API_KEY, RAZORPAY_API_SECRET_KEY))
            if discamnt1[0] == 0:

                # coupondiscount = request.session['coupon']

        
                order_currency = 'INR'

                payment_order = client.order.create(dict(amount=sum2,currency=order_currency))
                payment_order_id = payment_order['id']
            else:
                order_currency = 'INR'

                payment_order = client.order.create(dict(amount=discamnt2,currency=order_currency))
                payment_order_id = payment_order['id']
            return render(request,'app/checkout.html',{'values':cartelemenets,'s':sum,'address':address,'discount':discamnt,'paymentid':payment_order_id})

    

    return render(request,'app/checkout.html',{'values':cartelemenets})
 

def applycoupon(request):
    if request.method == 'POST':
        id = request.GET.get('id','')
        code = request.POST.get('coupon')
        email = request.session['user']
        user = User.objects.get(email=email)
        cartelemenets = cart.objects.filter(user_id=user.id)
        cartobj = cart.objects.filter(user_id = user.id)
        total = cartobj.aggregate(Sum('totalprice'))
        disnt = cartobj.aggregate(Sum('discountprice'))
        address = Address.objects.filter(user_id=user.id)
        if coupon.objects.filter(couponcode=code,isactive=1):

            couponobj = coupon.objects.get(couponcode=code)
            request.session['placed'] = couponobj.id
            user = User.objects.get(email=email)
            cartobj2 = cart.objects.get(id=id)
            appliedcoupon = couponapplied.objects.filter(user_id=user.id,appliedcoupon_id=couponobj.id,placed=1)
            
            if not appliedcoupon:
                if cartobj2.discountprice == 0:
                    
                        sum = cartobj.aggregate(Sum('totalprice'))
                        price = list(sum.values())
                        for i in price:
                            discntpercentage = couponobj.discount
                            discamnt = i * discntpercentage/100
                            specialdiscnt = i- discamnt
                            request.session['coupon'] = specialdiscnt
                            specialdiscnt1 = int(specialdiscnt * 100)
                            couponapplied(couponofferprice=specialdiscnt,offerended=1,appliedcoupon_id=couponobj.id,user_id=user.id).save()
                            client = razorpay.Client(auth=(RAZORPAY_API_KEY, RAZORPAY_API_SECRET_KEY))
                            order_currency = 'INR'
                            payment_order = client.order.create(dict(amount=specialdiscnt1,currency=order_currency))
                            payment_order_id = payment_order['id']

                
                else:
                    discamnt = cartobj.aggregate(Sum('discountprice'))
                    prices = list(discamnt.values())
                    for j in prices:
                        discntpercentage = couponobj.discount
                        discamnt = j * discntpercentage/100
                        specialdiscnt = j- discamnt
                        request.session['coupon'] = specialdiscnt
                        specialdiscnt1 = int(specialdiscnt * 100)
                        couponapplied(couponofferprice=specialdiscnt,offerended=1,appliedcoupon_id=couponobj.id,user_id=user.id).save()
                        client = razorpay.Client(auth=(RAZORPAY_API_KEY, RAZORPAY_API_SECRET_KEY))
                        order_currency = 'INR'
                        payment_order = client.order.create(dict(amount=specialdiscnt1,currency=order_currency))
                        payment_order_id = payment_order['id']
            else:
                return render(request,'app/checkout.html',{'values':cartelemenets,'address':address,'error':'Coupon invalid','discount':disnt,'s':total})
        else:
            return render(request,'app/checkout.html',{'values':cartelemenets,'address':address,'error':'Coupon invalid','discount':disnt,'s':total})




    couponobj1 = couponapplied.objects.filter(user_id=user.id).latest('id')


    return render(request,'app/checkout.html',{'values':cartelemenets,'address':address,'coupon':couponobj1,'paymentid':payment_order_id})





def selectaddress(request,id):
    email = request.session['user']
    obj = User.objects.get(email=email)
    if Address.objects.filter(user_id=obj.id,is_active=1):
        Address.objects.filter(user_id = obj.id).update(is_active=0)
    
    if Address.objects.get(id=id,is_active=0):
        Address.objects.filter(id=id).update(is_active=1)
    return redirect(checkout)
    
def checkoutaddaddress(request):
    if request.method == 'POST':
        name = request.POST.get('name')
        address = request.POST.get('address')
        state = request.POST.get('state')
        city = request.POST.get('city')
        zip = request.POST.get('zip')
        email = request.session['user']
        phone = request.POST.get('phone')
        
        obj = User.objects.get(email=email)
        


        Address(user_id=obj.id,name=name,Address=address,state=state,city=city,zipcode=zip,is_active=0,phone=phone).save()
        return redirect(checkout)


def ordercomplete(request):
    email = request.session['user']
    userr = User.objects.get(email=email)
    objcart = cart.objects.filter(user_id=userr.id).all()
    objaddress = Address.objects.get(user_id=userr.id,is_active=1)
    # cartobj = cart.objects.filter(user_id=userr.id)
    
    if request.method == 'POST':
        stats = request.POST.get('mode',False)
        sum = request.POST.get('hide',False)
        # if request.session['placed']:
            # couponid = request.session['placed']
        
        if  couponapplied.objects.filter(user_id=userr.id):
            cc = couponapplied.objects.filter(user_id=userr.id).latest('id')
            if couponapplied.objects.filter(id=cc.id,placed=0):
                couponapplied.objects.filter(id=cc.id).update(placed=1)
                details = order()
                details.user_id = userr.id
                details.address_id = objaddress.id
                details.total = sum
                details.mode = stats
                details.save()
                orderid = order.objects.filter(user_id=userr.id).latest('id')
                for item in objcart:
                    items = ordereditem()
                    items.order_id = orderid.id
                    items.product_id = item.product_id
                    items.quantity = item.quantity
                    if item.discountprice == 0:
                        items.price = item.totalprice
                    else:
                        items.price = item.discountprice
                    items.save()
                cart.objects.filter(user_id=userr.id).all().delete()
                request.session['order'] = orderid.id
                currentordereditem = ordereditem.objects.filter(order_id=orderid.id).all()
                currentorder = order.objects.get(id=orderid.id)
                Addressobj = Address.objects.get(user_id=userr.id,is_active=1)

                return render(request,'app/ordercomplete.html',{'value':currentordereditem,'value2':currentorder,'address':Addressobj})
            else:
                

                details = order()
                details.user_id = userr.id
                details.address_id = objaddress.id
                details.total = sum
                details.mode = stats
                details.save()
                orderid = order.objects.filter(user_id=userr.id).latest('id')
                for item in objcart:
                    items = ordereditem()
                    items.order_id = orderid.id
                    items.product_id = item.product_id
                    items.quantity = item.quantity
                    if item.discountprice == 0:
                        items.price = item.totalprice
                    else:
                        items.price = item.discountprice
                    items.save()
                cart.objects.filter(user_id=userr.id).all().delete()
                request.session['order'] = orderid.id
                currentordereditem = ordereditem.objects.filter(order_id=orderid.id).all()
                currentorder = order.objects.get(id=orderid.id)
                Addressobj = Address.objects.get(user_id=userr.id,is_active=1)

                return render(request,'app/ordercomplete.html',{'value':currentordereditem,'value2':currentorder,'address':Addressobj})

    

                
                    
                    
        else:
            
            details = order()
            details.user_id = userr.id
            details.address_id = objaddress.id
            details.total = sum
            details.mode = stats
            details.save()
            orderid = order.objects.filter(user_id=userr.id).latest('id')
            for item in objcart:
                items = ordereditem()
                items.order_id = orderid.id
                items.product_id = item.product_id
                items.quantity = item.quantity
                if item.discountprice == 0:
                    items.price = item.totalprice
                else:
                    items.price = item.discountprice
                items.save()
                cart.objects.filter(user_id=userr.id).all().delete()
    

    
    
            request.session['order'] = orderid.id
            currentordereditem = ordereditem.objects.filter(order_id=orderid.id).all()
            currentorder = order.objects.get(id=orderid.id)
            Addressobj = Address.objects.get(user_id=userr.id,is_active=1)

            return render(request,'app/ordercomplete.html',{'value':currentordereditem,'value2':currentorder,'address':Addressobj})
                

def myorders(request):
    id = request.GET.get('id','')
    orders = order.objects.filter(user_id=id).all()
    items = ordereditem.objects.all()
    return render(request,'app/myorders.html',{'value1':orders,'value2':items})

def cancelproduct(request,id):
    order.objects.filter(id=id).update(status='cancelled')
    c = order.objects.get(id=id)
    orders = order.objects.filter(user_id=c.user_id).all()
    items = ordereditem.objects.all()
    return render(request,'app/myorders.html',{'value1':orders,'value2':items})
    

    

def buynow(request):
    productid = request.GET.get('id','')
    email = request.session['user']
    user = User.objects.get(email=email)
    item = Item.objects.get(id=productid)
    mycart = cart.objects.filter(product_id=productid,user_id=user.id)
    cart.objects.all().delete()
    if not mycart:
        if item.offerprice == 0:
            cart(product_id=productid,user_id=user.id,quantity=1,totalprice=item.price).save()
        else:
            cart(product_id=productid,user_id=user.id,quantity=1,totalprice=item.price,discountprice=item.offerprice).save()

        


    product = cart.objects.filter(product_id=productid,user_id=user.id).all()
    address = Address.objects.filter(user_id=user.id)
    cartobj = cart.objects.filter(user_id=user.id,product_id=productid)
    sum = cartobj.aggregate(Sum('totalprice'))
    discount = cartobj.aggregate(Sum('discountprice'))
    sum1 = list(sum.values())
    discount1 = list(discount.values())
    sum2 = int(sum1[0] * 100)
    discount2 = int(discount1[0] * 100)
    request.session['buynow'] = productid
    client = razorpay.Client(auth=(RAZORPAY_API_KEY, RAZORPAY_API_SECRET_KEY))
    if discount2 == 0:
        order_currency = 'INR'
        payment_order = client.order.create(dict(amount=sum2,currency=order_currency))
        payment_order_id = payment_order['id']
    else:
        order_currency = 'INR'
        payment_order = client.order.create(dict(amount=discount2,currency=order_currency))
        payment_order_id = payment_order['id']

    


    return render(request,'app/checkout.html',{'values':product,'s':sum,'address':address,'discount':discount,'paymentid':payment_order_id})


def search(request):
    if request.method == 'POST':
        name = request.POST.get('srch')
        item = Item.objects.get(name__icontains=name)
        return render(request,'app/home2.html',{'value':item})

def checkoutquantitydown(request,id):
    cartt = cart.objects.get(id=id)
    if cartt.quantity == 0:
        cartremove(request,id)
        return redirect(signin)
    else:
        if cartt.discountprice == 0:
            product_id = cartt.product_id
            items = Item.objects.get(id=product_id)
            cartt.quantity = cartt.quantity - 1
            cartt.totalprice = cartt.totalprice - items.price
            cartt.save()
        else:
            product_id = cartt.product_id
            items = Item.objects.get(id=product_id)
            cartt.quantity = cartt.quantity - 1
            cartt.discountprice = cartt.discountprice - items.offerprice
            cartt.save()
    return redirect(checkout)


def checkoutquantityup(request,id):
    cartt = cart.objects.get(id=id)
    if cartt.quantity == 0:
        cartremove(request,id)
    else:
        if cartt.discountprice == 0:
            product_id = cartt.product_id
            items = Item.objects.get(id=product_id)
            cartt.quantity = cartt.quantity +1
            cartt.totalprice = cartt.totalprice + items.price
            cartt.save()
        else:
            product_id = cartt.product_id
            items = Item.objects.get(id=product_id)
            cartt.quantity = cartt.quantity +1
            cartt.discountprice = cartt.discountprice + items.offerprice
            cartt.save()
    return redirect(checkout)



    
