# Generated by Django 3.2.9 on 2021-12-15 03:54

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0024_address_is_active'),
    ]

    operations = [
        migrations.AddField(
            model_name='address',
            name='state',
            field=models.CharField(default=True, max_length=20),
        ),
    ]
