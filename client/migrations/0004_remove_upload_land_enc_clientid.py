# Generated by Django 2.0.5 on 2021-03-02 05:11

from django.db import migrations


class Migration(migrations.Migration):

    dependencies = [
        ('client', '0003_auto_20210302_1034'),
    ]

    operations = [
        migrations.RemoveField(
            model_name='upload_land',
            name='enc_clientid',
        ),
    ]