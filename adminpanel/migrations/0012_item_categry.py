# Generated by Django 3.2.9 on 2021-12-13 12:48

from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    dependencies = [
        ('adminpanel', '0011_remove_item_category'),
    ]

    operations = [
        migrations.AddField(
            model_name='item',
            name='categry',
            field=models.ForeignKey(default=True, on_delete=django.db.models.deletion.CASCADE, to='adminpanel.catagry'),
        ),
    ]