# Generated by Django 3.2.9 on 2021-12-06 11:11

import django.contrib.auth.models
from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0004_alter_usersignup_name'),
    ]

    operations = [
        migrations.AlterField(
            model_name='usersignup',
            name='name',
            field=models.CharField(max_length=20, verbose_name=django.contrib.auth.models.User),
        ),
    ]
