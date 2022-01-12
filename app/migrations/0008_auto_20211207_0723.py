# Generated by Django 3.2.9 on 2021-12-07 07:23

from django.db import migrations, models
import django.db.models.manager


class Migration(migrations.Migration):

    dependencies = [
        ('app', '0007_account'),
    ]

    operations = [
        migrations.AlterModelManagers(
            name='account',
            managers=[
                ('object', django.db.models.manager.Manager()),
            ],
        ),
        migrations.RemoveField(
            model_name='account',
            name='number',
        ),
        migrations.RemoveField(
            model_name='account',
            name='user',
        ),
        migrations.AddField(
            model_name='account',
            name='email',
            field=models.CharField(default=True, max_length=50),
        ),
        migrations.AddField(
            model_name='account',
            name='is_active',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='account',
            name='is_admin',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='account',
            name='is_staff',
            field=models.BooleanField(default=False),
        ),
        migrations.AddField(
            model_name='account',
            name='last_login',
            field=models.DateTimeField(blank=True, null=True, verbose_name='last login'),
        ),
        migrations.AddField(
            model_name='account',
            name='password',
            field=models.CharField(default=True, max_length=20),
        ),
        migrations.AddField(
            model_name='account',
            name='phone',
            field=models.IntegerField(default=True),
        ),
        migrations.AddField(
            model_name='account',
            name='username',
            field=models.CharField(default=True, max_length=50),
        ),
    ]
