from django.shortcuts import render,redirect

# Create your views here.
from client.models import client_reg, upload_land, upload_product1

from cryptography.fernet import Fernet
from six import b

from projectadmin.models import client_bargain


def client_index(request):

    return render(request, 'client/client_index.html')

def aboutus(request):

    return render(request, 'client/aboutus.html')

def services(request):

    return render(request, 'client/services.html')

def client_login(request):
    if request.method == "POST":
        uname = request.POST.get('uname')
        pswd = request.POST.get('password')
        try:
            check = client_reg.objects.get(uname=uname, password=pswd)
            print(check)
            request.session['client_id'] = check.id
            request.session['client_name'] = check.uname
            return redirect('client_home')
        except:
            pass
        return redirect('client_login')
    return render(request, 'client/client_login.html')

def client_register(request):
    if request.method == "POST":
        client_name = request.POST.get('client_name')
        mobile = request.POST.get('mobile')
        gender = request.POST.get('gender')
        location = request.POST.get('location')
        uname = request.POST.get('uname')
        password = request.POST.get('password')
        client_reg.objects.create(client_name=client_name, mobile=mobile, gender=gender, location=location,
                                        uname=uname,password=password)
        return redirect('client_login')
    return render(request, 'client/client_register.html')

def client_home(request):
    clientid=request.session['client_id']
    client_name=request.session['client_name']
    if request.method == "POST":
        client_name = request.POST.get('client_name')
        square_feet = request.POST.get('square_feet')
        patta_number = request.POST.get('patta_number')
        district = request.POST.get('district')
        taluk = request.POST.get('taluk')
        village = request.POST.get('village')
        key = Fernet.generate_key()  # this is your "password"
        cipher_suite = Fernet(key)

        enc_clientname=cipher_suite.encrypt(b(client_name))
        enc_squarefeet=cipher_suite.encrypt(b(square_feet))
        enc_pattanumber = cipher_suite.encrypt(b(patta_number))
        enc_district=cipher_suite.encrypt(b(district))
        enc_taluk = cipher_suite.encrypt(b(taluk))
        enc_village = cipher_suite.encrypt(b(village))
        upload_land.objects.create(client_id=clientid,client_name=client_name, square_feet=square_feet, patta_number=patta_number, district=district,
                                    taluk=taluk,village=village,enc_clientname=enc_clientname,enc_squarefeet=enc_squarefeet,enc_pattanumber=enc_pattanumber,
                                    enc_district=enc_district,enc_taluk=enc_taluk,enc_village=enc_village)
    return render(request, 'client/client_home.html',{'client_name':client_name})

def upload_product(request):
    pstatus="pending"
    clientid = request.session['client_id']
    client_name = request.session['client_name']
    if request.method == "POST":
        client_name = request.POST.get('client_name')
        district = request.POST.get('district')
        rice_name = request.POST.get('rice_name')
        quantity = request.POST.get('quantity')
        amount = request.POST.get('amount')

        key = Fernet.generate_key()  # this is your "password"
        cipher_suite = Fernet(key)

        enc_clientname = cipher_suite.encrypt(b(client_name))
        enc_district = cipher_suite.encrypt(b(district))
        enc_ricename = cipher_suite.encrypt(b(rice_name))
        enc_quantity = cipher_suite.encrypt(b(quantity))
        enc_amount = cipher_suite.encrypt(b(amount))

        upload_product1.objects.create(client_id=clientid, client_name=client_name, district=district,
                                   rice_name=rice_name, quantity=quantity,
                                   amount=amount, enc_clientname=enc_clientname, enc_district=enc_district,
                                   enc_ricename=enc_ricename, enc_quantity=enc_quantity,
                                   enc_amount=enc_amount,product_status=pstatus)
    return render(request, 'client/upload_product.html',{'client_name':client_name})

def clientview_adminmessage(request):
    adminaccept=''
    clientid = request.session['client_id']
    client_name = request.session['client_name']
    admin_message=client_bargain.objects.filter(client_id=clientid)

    return render(request, 'client/clientview_adminmessage.html',{'admin_message':admin_message})

def clientupdate_bargain(request,pk):
    status1 = "accept"
    unresult=client_bargain.objects.get(id=pk)
    unid1=unresult.id
    request.session['unid11']=unid1
    adminaccept=unresult.adminstatus1
    if adminaccept=="accept":
        client_bargain.objects.filter(id=unid1).update(clientstatus1=status1)
    else:
        return redirect("clientupdate_bargain1")

    return render(request, 'client/clientupdate_bargain.html')


def clientupdate_bargain1(request):
    cstatus="accept"
    unid11=request.session['unid11']
    clientbargain=client_bargain.objects.filter(id=unid11)
    if request.method == "POST":

        bargain_field = request.POST.get('bargain_field')
        if bargain_field=="yes":
            return redirect('clientupdate_bargain11')
        else:
            client_bargain.objects.filter(id=unid11).update(clientstatus1=cstatus)
    return render(request, 'client/clientupdate_bargain1.html',{'clientbargain':clientbargain})


def clientupdate_bargain11(request):
    cstatus="accept"
    unid11=request.session['unid11']
    clientbargain=client_bargain.objects.filter(id=unid11)
    if request.method == "POST":

        bargaining_amount = request.POST.get('bargaining_amount')
        client_bargain.objects.filter(id=unid11).update(fixedamount=bargaining_amount)
    return render(request, 'client/clientupdate_bargain11.html',{'clientbargain':clientbargain})