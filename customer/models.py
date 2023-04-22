from django.db import models

# Create your models here.
class customer_reg(models.Model):
    id = models.AutoField(primary_key=True)
    customer_name = models.CharField(max_length=300)
    mobile = models.CharField(max_length=300)
    gender = models.CharField(max_length=300)
    location = models.CharField(max_length=300)
    uname = models.CharField(max_length=300)
    password = models.CharField(max_length=300)

class customer_bargain11(models.Model):
    id = models.AutoField(primary_key=True)
    pid = models.CharField(max_length=300)
    cutsomerid=models.CharField(max_length=300)
    cutsomername = models.CharField(max_length=300)
    client_id=models.CharField(max_length=300)
    client_name = models.CharField(max_length=300)
    enc_clientname = models.CharField(max_length=300)
    pname = models.CharField(max_length=300)
    district = models.CharField(max_length=300)
    quantity = models.CharField(max_length=300)
    originalamount = models.CharField(max_length=300)
    fixedamount = models.CharField(max_length=300)
    adminstatus1=models.CharField(max_length=300)
    customerstatus1 = models.CharField(max_length=300)

class customer_payment1(models.Model):
    id = models.AutoField(primary_key=True)
    pid = models.CharField(max_length=300)
    pname=models.CharField(max_length=300)
    cname = models.CharField(max_length=300)
    district=models.CharField(max_length=300)
    quantity = models.CharField(max_length=300)
    amount = models.CharField(max_length=300)
    cardno = models.CharField(max_length=300)
    cvv = models.CharField(max_length=300)
    holder_name = models.CharField(max_length=300)
    validity = models.CharField(max_length=300)
