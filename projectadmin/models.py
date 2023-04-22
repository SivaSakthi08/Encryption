from django.db import models

# Create your models here.
class client_bargain(models.Model):
    id = models.AutoField(primary_key=True)
    uniid = models.CharField(max_length=300)
    client_id=models.CharField(max_length=300)
    client_name = models.CharField(max_length=300)
    enc_clientname = models.CharField(max_length=300)
    pname = models.CharField(max_length=300)
    district = models.CharField(max_length=300)
    quantity = models.CharField(max_length=300)
    originalamount = models.CharField(max_length=300)
    fixedamount = models.CharField(max_length=300)
    adminstatus1=models.CharField(max_length=300)
    clientstatus1 = models.CharField(max_length=300)

