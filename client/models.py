from django.db import models

# Create your models here.
class client_reg(models.Model):
    id = models.AutoField(primary_key=True)
    client_name = models.CharField(max_length=300)
    mobile = models.CharField(max_length=300)
    gender = models.CharField(max_length=300)
    location = models.CharField(max_length=300)
    uname = models.CharField(max_length=300)
    password = models.CharField(max_length=300)

class upload_land(models.Model):
    id = models.AutoField(primary_key=True)
    client_id=models.CharField(max_length=300)
    client_name = models.CharField(max_length=300)
    square_feet = models.CharField(max_length=300)
    patta_number = models.CharField(max_length=300)
    district = models.CharField(max_length=300)
    taluk = models.CharField(max_length=300)
    village = models.CharField(max_length=300)
    enc_clientname = models.CharField(max_length=300)
    enc_squarefeet = models.CharField(max_length=300)
    enc_pattanumber = models.CharField(max_length=300)
    enc_district = models.CharField(max_length=300)
    enc_taluk = models.CharField(max_length=300)
    enc_village = models.CharField(max_length=300)

class upload_product1(models.Model):
    id = models.AutoField(primary_key=True)
    client_id=models.CharField(max_length=300)
    client_name = models.CharField(max_length=300)
    district = models.CharField(max_length=300)
    rice_name = models.CharField(max_length=300)
    quantity = models.CharField(max_length=300)
    amount = models.CharField(max_length=300)
    enc_clientname = models.CharField(max_length=300)
    enc_district = models.CharField(max_length=300)
    enc_ricename = models.CharField(max_length=300)
    enc_quantity = models.CharField(max_length=300)
    enc_amount = models.CharField(max_length=300)
    product_status=models.CharField(max_length=300)

