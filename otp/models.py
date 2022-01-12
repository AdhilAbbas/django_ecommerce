from django.db import models
from django.db.models.deletion import CASCADE
from app.models import Accounts
from django.db import models
class profile(models.Model):
    user=models.OneToOneField(Accounts,on_delete=CASCADE)
    otp=models.CharField(max_length=10)

