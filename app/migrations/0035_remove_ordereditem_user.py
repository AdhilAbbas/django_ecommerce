# Generated by Django 3.2.9 on 2021-12-22 10:26

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0034_alter_ordereditem_user'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='ordereditem',
            name='user',
        ),
    ]
