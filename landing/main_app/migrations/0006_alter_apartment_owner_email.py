# Generated by Django 4.0.6 on 2022-07-26 14:28

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('main_app', '0005_apartment_are_we_intermediary_and_more'),
    ]

    operations = [
        migrations.AlterField(
            model_name='apartment',
            name='owner_email',
            field=models.EmailField(blank=True, default='', max_length=254, verbose_name='Email хозяина'),
        ),
    ]
