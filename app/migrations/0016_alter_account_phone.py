# Generated by Django 3.2.9 on 2021-12-07 08:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0015_account_is_active'),
    ]

    operations = [
        migrations.AlterField(
            model_name='account',
            name='phone',
            field=models.BigIntegerField(default=True),
        ),
    ]
