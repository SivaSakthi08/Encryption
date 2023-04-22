# Generated by Django 2.0.5 on 2021-03-01 17:10

from django.db import migrations, models


class Migration(migrations.Migration):

    dependencies = [
        ('client', '0001_initial'),
    ]

    operations = [
        migrations.CreateModel(
            name='upload_land',
            fields=[
                ('id', models.AutoField(primary_key=True, serialize=False)),
                ('client_id', models.CharField(max_length=300)),
                ('client_name', models.CharField(max_length=300)),
                ('square_feet', models.CharField(max_length=300)),
                ('patta_number', models.CharField(max_length=300)),
                ('district', models.CharField(max_length=300)),
                ('taluk', models.CharField(max_length=300)),
                ('village', models.CharField(max_length=300)),
            ],
        ),
    ]
