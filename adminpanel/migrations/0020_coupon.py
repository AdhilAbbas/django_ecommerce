# Generated by Django 3.2.9 on 2021-12-28 06:33

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('adminpanel', '0019_catagry_discount'),
    ]

    operations = [
        migrations.CreateModel(
            name='coupon',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('couponcode', models.CharField(max_length=20)),
                ('discount', models.IntegerField(max_length=10)),
                ('isactive', models.IntegerField(max_length=5)),
            ],
        ),
    ]
