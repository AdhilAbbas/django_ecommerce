# Generated by Django 3.2.9 on 2021-12-07 07:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0011_auto_20211207_0732'),
    ]

    operations = [
        migrations.AddField(
            model_name='account',
            name='email',
            field=models.CharField(default=True, max_length=50),
        ),
        migrations.AddField(
            model_name='account',
            name='username',
            field=models.CharField(default=True, max_length=50),
        ),
    ]
