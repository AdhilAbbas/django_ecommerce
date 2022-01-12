from os import truncate
from django.contrib.auth.models import AbstractBaseUser,BaseUserManager, User
from django.db import models
from django.db.models.deletion import CASCADE
from adminpanel.models import Item,coupon
from django.utils import timezone



class Accounts(models.Model):
    user=models.OneToOneField(User,on_delete=CASCADE)
    phone=models.BigIntegerField()
class Address(models.Model):
    user = models.ForeignKey(User,on_delete=models.CASCADE)
    name = models.CharField(max_length=20)
    Address = models.TextField(max_length=50)
    state = models.CharField(max_length=20,default=True)
    city = models.CharField(max_length=20)
    zipcode = models.CharField(max_length=20)
    phone = models.BigIntegerField(default=True)
    is_active = models.BooleanField(default=0)

class wishlist(models.Model):
    product = models.ForeignKey(Item,on_delete=models.CASCADE)
    user = models.ForeignKey(User,on_delete=models.CASCADE,default=True)
class cart(models.Model):
    product = models.ForeignKey(Item,on_delete=models.CASCADE)
    user = models.ForeignKey(User,on_delete=models.CASCADE,default=True)
    quantity = models.IntegerField(default=True)
    totalprice = models.IntegerField(default=True)
    discountprice = models.IntegerField(default=0)




class order(models.Model):
    user = models.ForeignKey(User,on_delete=CASCADE)
    address = models.ForeignKey(Address,on_delete=CASCADE)
    status = models.CharField(max_length=50,default='pending')
    total = models.IntegerField(default=True)
    mode = models.CharField(max_length=20,default=True)
    date_added = models.DateField(default=timezone.now)


class ordereditem(models.Model):
    order = models.ForeignKey(order,on_delete=CASCADE,default=True)
    product = models.ForeignKey(Item,on_delete=CASCADE,default=True)
    quantity = models.IntegerField(default=True)
    price = models.IntegerField(default=True)


class couponapplied(models.Model):
    appliedcoupon = models.ForeignKey(coupon,on_delete=CASCADE)
    user = models.ForeignKey(User,on_delete=CASCADE)
    couponofferprice = models.IntegerField(default=0)
    offerended = models.BooleanField(default=0)
    placed = models.BooleanField(default=0)








