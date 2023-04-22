from django.shortcuts import render,redirect

# Create your views here.
from client.models import upload_product1
from customer.models import customer_reg, customer_bargain11, customer_payment1

from django.contrib import messages
def customer_login(request):
    if request.method == "POST":
        uname = request.POST.get('uname')
        pswd = request.POST.get('password')
        try:
            check = customer_reg.objects.get(uname=uname, password=pswd)
            print(check)
            request.session['customer_id'] = check.id
            request.session['customer_name'] = check.uname
            return redirect('customer_home')
        except:
            pass
        return redirect('customer_login')
    return render(request, 'customer/customer_login.html')

def customer_register(request):
    if request.method == "POST":
        customer_name = request.POST.get('customer_name')
        mobile = request.POST.get('mobile')
        gender = request.POST.get('gender')
        location = request.POST.get('location')
        uname = request.POST.get('uname')
        password = request.POST.get('password')
        customer_reg.objects.create(customer_name=customer_name, mobile=mobile, gender=gender, location=location,
                                        uname=uname,password=password)
        return redirect('customer_login')
    return render(request, 'customer/customer_register.html')

def customer_home(request):
    pstatus="promote to sale"
    searchresult=''
    customerid=request.session['customer_id']
    customername=request.session['customer_name']
    if request.method == "POST":
        district = request.POST.get('district')
        print(district)
        searchresult=upload_product1.objects.filter(district=district,product_status=pstatus)
    return render(request, 'customer/customer_home.html',{'searchresult':searchresult})

def customer_bargain(request,pk):
    status = "pending"
    status1 = "accept"
    customerid = request.session['customer_id']
    customername = request.session['customer_name']
    uniqueresult=upload_product1.objects.get(id=pk)
    unid=uniqueresult.id
    request.session['pid11'] = unid
    client_id = uniqueresult.client_id
    client_name = uniqueresult.client_name
    enc_clientname = uniqueresult.enc_clientname
    productresult=upload_product1.objects.filter(id=unid)
    if request.method == "POST":
        pname = request.POST.get('pname')
        district = request.POST.get('district')
        quantity = request.POST.get('quantity')
        amount = request.POST.get('amount')
        bargain_field = request.POST.get('bargain_field')
        if bargain_field=="yes":
            return redirect('customer_bargain1')
        else:
            customer_bargain11.objects.create(pid=unid,cutsomerid=customerid,cutsomername=customername,client_id=client_id,client_name=client_name,enc_clientname=enc_clientname,
                                          pname=pname,district=district,quantity=quantity,originalamount=amount,fixedamount=amount,
                                          adminstatus1=status,customerstatus1=status1)
        messages.success(request, 'Customer Accept This Price')
    return render(request, 'customer/customer_bargain.html',{'productresult':productresult})

def customer_bargain1(request):
    customerid = request.session['customer_id']
    customername = request.session['customer_name']
    status = "pending"
    productid = request.session['pid11']
    uniqueresult2 = upload_product1.objects.filter(id=productid)
    if request.method == "POST":
        clientid = request.POST.get('clientid')
        clientname = request.POST.get('clientname')
        enclient_name = request.POST.get('enclient_name')
        pname = request.POST.get('pname')
        district = request.POST.get('district')
        quantity = request.POST.get('quantity')
        amount = request.POST.get('amount')
        bargaining_amount = request.POST.get('bargaining_amount')
        customer_bargain11.objects.create(pid=productid, cutsomerid=customerid,cutsomername=customername,client_id=clientid, client_name=clientname,
                                      enc_clientname=enclient_name,
                                      pname=pname, district=district, quantity=quantity, originalamount=amount,
                                      fixedamount=bargaining_amount, adminstatus1=status,customerstatus1=status)
    return render(request, 'customer/customer_bargain1.html',{'uniqueresult2':uniqueresult2})


def cviewadmin_bargain(request):
    customerid = request.session['customer_id']
    customername = request.session['customer_name']
    bargain11=customer_bargain11.objects.filter(cutsomerid=customerid)
    return render(request, 'customer/cviewadmin_bargain.html',{'bargain11':bargain11})

def customer_againbargain(request,pk):
    cusstatus="accept"
    customerid = request.session['customer_id']
    customername = request.session['customer_name']
    uniqueresult = customer_bargain11.objects.get(id=pk)
    unresultid = uniqueresult.id
    request.session['unresultid1'] = unresultid
    cusbargain = customer_bargain11.objects.filter(id=unresultid)
    if request.method == "POST":
        bargain_field = request.POST.get('bargain_field')
        if bargain_field=="yes":
            return redirect('customer_againbargain1')
        else:
            customer_bargain11.objects.filter(id=unresultid).update(customerstatus1=cusstatus)
            messages.success(request, 'Customer Accept This Price')
    return render(request, 'customer/customer_againbargain.html',{'cusbargain':cusbargain})


def customer_againbargain1(request):
    customerid = request.session['customer_id']
    customername = request.session['customer_name']
    unresultid1=request.session['unresultid1']
    cusbargain = customer_bargain11.objects.filter(id=unresultid1)
    if request.method == "POST":
        bargaining_amount = request.POST.get('bargaining_amount')
        customer_bargain11.objects.filter(id=unresultid1).update(fixedamount=bargaining_amount)
    return render(request, 'customer/customer_againbargain1.html',{'cusbargain':cusbargain})

def customer_payment(request):
    s1="accept"
    customerid = request.session['customer_id']
    customername = request.session['customer_name']
    finalcus_bargain = customer_bargain11.objects.filter(cutsomerid=customerid,adminstatus1=s1,customerstatus1=s1)
    return render(request, 'customer/customer_payment.html',{'finalcus_bargain':finalcus_bargain})


def payment1(request,pk):
    customerid = request.session['customer_id']
    customername = request.session['customer_name']
    paymentresult=customer_bargain11.objects.get(id=pk)
    pay_unid=paymentresult.id
    payment_get=customer_bargain11.objects.filter(id=pay_unid)
    if request.method == "POST":
        pid = request.POST.get('pid')
        pname = request.POST.get('cname')
        cname = request.POST.get('pname')
        district = request.POST.get('district')
        quantity = request.POST.get('quantity')
        amount = request.POST.get('amount')
        cardno = request.POST.get('card_number')
        cvv = request.POST.get('cvv')
        holder_name = request.POST.get('holder_name')
        validity = request.POST.get('card_validity')
        customer_payment1.objects.create(pid=pid,pname=pname,cname=cname,district=district,quantity=quantity,
                                         amount=amount,cardno=cardno,cvv=cvv,holder_name=holder_name,validity=validity)
    return render(request, 'customer/payment1.html',{'payment_get':payment_get})
