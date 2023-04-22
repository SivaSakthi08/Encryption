from django.shortcuts import render,redirect

# Create your views here.
from client.models import upload_product1, upload_land
from customer.models import customer_bargain11, customer_payment1
from projectadmin.models import client_bargain
from django.contrib import messages

def admin_login(request):
    if request.method == "POST":
        username = request.POST.get('uname')
        password = request.POST.get('password')
        if username == "admin" and password == "admin":
            return redirect('admin_home')
    return render(request, 'projectadmin/admin_login.html')

def admin_home(request):
    searchresult = upload_product1.objects.all()
    return render(request, 'projectadmin/admin_home.html',{'searchresult':searchresult})

def adminsend_requestclient(request,pk):
    status = "pending"
    status1="accept"
    uniqueresult=upload_product1.objects.get(id=pk)
    unid=uniqueresult.id
    request.session['uniqueid']=unid
    client_id=uniqueresult.client_id
    client_name=uniqueresult.client_name
    enc_clientname=uniqueresult.enc_clientname
    uniqueresult1=upload_product1.objects.filter(id=unid)
    if request.method == "POST":
        pname = request.POST.get('pname')
        district = request.POST.get('district')
        quantity = request.POST.get('quantity')
        amount = request.POST.get('amount')
        bargain_field = request.POST.get('bargain_field')
        if bargain_field=="yes":
            return redirect('adminsend_requestclient1')
        else:
            client_bargain.objects.create(uniid=unid,client_id=client_id,client_name=client_name,enc_clientname=enc_clientname,
                                          pname=pname,district=district,quantity=quantity,originalamount=amount,fixedamount=amount,
                                          adminstatus1=status1,clientstatus1=status)
    return render(request, 'projectadmin/adminsend_requestclient.html',{'uniqueresult1':uniqueresult1})

def adminsend_requestclient1(request):
    status = "pending"
    uniqueid=request.session['uniqueid']
    uniqueresult2 = upload_product1.objects.filter(id=uniqueid)
    if request.method == "POST":
        clientid = request.POST.get('clientid')
        clientname = request.POST.get('clientname')
        enclient_name = request.POST.get('enclient_name')
        pname = request.POST.get('pname')
        district = request.POST.get('district')
        quantity = request.POST.get('quantity')
        amount = request.POST.get('amount')
        bargaining_amount = request.POST.get('bargaining_amount')
        client_bargain.objects.create(uniid=uniqueid, client_id=clientid, client_name=clientname,
                                      enc_clientname=enclient_name,
                                      pname=pname, district=district, quantity=quantity, originalamount=amount,
                                      fixedamount=bargaining_amount, adminstatus1=status,clientstatus1=status)
    return render(request, 'projectadmin/adminsend_requestclient1.html',{'uniqueresult2':uniqueresult2})



def adminview_clientbargain(request):
    bargain_result = client_bargain.objects.all()
    return render(request, 'projectadmin/adminview_clientbargain.html',{'bargain_result':bargain_result})


def adminview_clientbargain1(request,pk):

    unqid=client_bargain.objects.get(id=pk)
    unid11=unqid.id
    request.session['final_unid']=unid11
    clientstatus=unqid.clientstatus1
    if clientstatus=="accept":
        return redirect('final_price')
    else:
        return redirect('updateagain_bargain')
    return render(request, 'projectadmin/adminview_clientbargain1.html')


def final_price(request):
    pstatus="promote to sale"
    finalprice = ''
    funid = request.session['final_unid']
    finalupdate = client_bargain.objects.filter(id=funid)
    for a in finalupdate:
        pid = a.uniid
        finalprice = a.fixedamount
    upload_product1.objects.filter(id=pid).update(amount=finalprice,product_status=pstatus)

    return render(request, 'projectadmin/final_price.html')


def updateagain_bargain(request):
    astatus="accept"
    funid = request.session['final_unid']
    updateagain1 = client_bargain.objects.filter(id=funid)
    if request.method == "POST":
        bargain_field = request.POST.get('bargain_field')
        if bargain_field=="yes":
            return redirect('updateagain_bargain1')
        else:
            client_bargain.objects.filter(id=funid).update(adminstatus1=astatus)
            messages.success(request, 'Admin Accept the Client Deal')
    return render(request, 'projectadmin/updateagain_bargain.html',{'updateagain1':updateagain1})

def updateagain_bargain1(request):
    astatus="accept"
    funid = request.session['final_unid']
    updateagain1 = client_bargain.objects.filter(id=funid)
    if request.method == "POST":

        bargaining_amount = request.POST.get('bargaining_amount')

        client_bargain.objects.filter(id=funid).update(fixedamount=bargaining_amount)
    return render(request, 'projectadmin/updateagain_bargain1.html',{'updateagain1':updateagain1})

def adminview_customerbargain(request):
    cbargain_result = customer_bargain11.objects.all()
    return render(request, 'projectadmin/adminview_customerbargain.html',{'cbargain_result':cbargain_result})

def adminview_customerbargain1(request,pk):
    unqid = customer_bargain11.objects.get(id=pk)
    unid22 = unqid.id
    request.session['cfinal_unid'] = unid22
    customerstatus = unqid.customerstatus1
    if customerstatus == "accept":
        return redirect('customerfinal_price')
    else:
        return redirect('customerupdateagain_bargain')

    return render(request, 'projectadmin/adminview_customerbargain1.html')

def customerfinal_price(request):
    pstatus = "Not able to Buy"
    astatus="accept"
    finalprice = ''
    funid1 = request.session['cfinal_unid']
    finalupdate = customer_bargain11.objects.filter(id=funid1)
    for a in finalupdate:
        pid = a.pid

    upload_product1.objects.filter(id=pid).update(product_status=pstatus)
    customer_bargain11.objects.filter(id=funid1).update(adminstatus1=astatus)
    final_result = customer_bargain11.objects.filter(id=funid1)
    messages.success(request, 'Admin Accept the Customer Deal')
    return render(request, 'projectadmin/customerfinal_price.html',{'final_result':final_result})


def customerupdateagain_bargain(request):
    astatus = "accept"
    funid1 = request.session['cfinal_unid']
    cupdateagain1 = customer_bargain11.objects.filter(id=funid1)
    if request.method == "POST":
        bargain_field = request.POST.get('bargain_field')
        if bargain_field=="yes":
            return redirect('customerupdateagain_bargain1')
        else:
            customer_bargain11.objects.filter(id=funid1).update(adminstatus1=astatus)
    return render(request, 'projectadmin/customerupdateagain_bargain.html',{'cupdateagain1':cupdateagain1})

def customerupdateagain_bargain1(request):
    funid = request.session['cfinal_unid']
    cupdateagain1 = customer_bargain11.objects.filter(id=funid)
    if request.method == "POST":
        bargaining_amount = request.POST.get('bargaining_amount')
        customer_bargain11.objects.filter(id=funid).update(fixedamount=bargaining_amount)
    return render(request, 'projectadmin/customerupdateagain_bargain1.html',{'cupdateagain1':cupdateagain1})


def view_customerpayment(request):
    view_payment = customer_payment1.objects.all()
    return render(request, 'projectadmin/view_customerpayment.html',{'view_payment':view_payment})

def view_landdetails(request):
    view_land = upload_land.objects.all()
    return render(request, 'projectadmin/view_landdetails.html',{'view_land':view_land})