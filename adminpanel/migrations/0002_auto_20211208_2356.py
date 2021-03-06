# Generated by Django 3.2.9 on 2021-12-08 23:56

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('adminpanel', '0001_initial'),
    ]

    operations = [
        migrations.AlterField(
            model_name='products',
            name='description',
            field=models.CharField(max_length=200, null=True),
        ),
        migrations.AlterField(
            model_name='products',
            name='discount',
            field=models.CharField(max_length=50),
        ),
        migrations.AlterField(
            model_name='products',
            name='image',
            field=models.FileField(upload_to='images/'),
        ),
        migrations.AlterField(
            model_name='products',
            name='name',
            field=models.CharField(max_length=50),
        ),
        migrations.AlterField(
            model_name='products',
            name='price',
            field=models.CharField(max_length=50),
        ),
        migrations.AlterField(
            model_name='products',
            name='quantity',
            field=models.CharField(max_length=50),
        ),
    ]
