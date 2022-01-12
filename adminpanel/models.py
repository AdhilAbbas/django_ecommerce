from django.db import models
from django.db.models.fields.files import FileField, ImageField
import datetime
import os


class catagry(models.Model):
   
    catname=models.TextField(default=True)
    discount = models.IntegerField(default=0)



def filepath(request, filename):
    old_filename = filename
    timeNow = datetime.datetime.now().strftime('%Y%m%d%H:%M:%S')
    filename = "%s%s" % (timeNow, old_filename)
    return os.path.join('uploads/', filename)

class Item(models.Model):
    name = models.CharField(max_length=20)
    price = models.IntegerField()
    description = models.TextField(max_length=500, null=True)
    categry = models.ForeignKey(catagry,on_delete=models.CASCADE,default=True)
    image = models.ImageField(upload_to=filepath, null=True, blank=True)
    offerprice = models.IntegerField(max_length=20,default=0)
    # productoffer = models.IntegerField(default=0)

class coupon(models.Model):
    couponcode = models.CharField(max_length=20)
    discount = models.IntegerField(max_length=10)
    isactive = models.IntegerField(max_length=5)


