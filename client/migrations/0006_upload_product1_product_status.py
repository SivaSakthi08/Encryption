# Generated by Django 2.0.5 on 2021-03-04 10:14

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('client', '0005_upload_product1'),
    ]

    operations = [
        migrations.AddField(
            model_name='upload_product1',
            name='product_status',
            field=models.CharField(default='', max_length=300),
            preserve_default=False,
        ),
    ]
