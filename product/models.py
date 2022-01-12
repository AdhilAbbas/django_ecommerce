from django.db import models
import datetime
import os

def filepath(request, filename):
    old_filename = filename
    timeNow = datetime.datetime.now().strftime('%Y%m%d%H:%M:%S')
    filename = "%s%s" % (timeNow, old_filename)
    return os.path.join('banner/', filename)

class banner(models.Model):
    image = models.ImageField(upload_to=filepath, null=True, blank=True)
    
