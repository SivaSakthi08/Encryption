"""mas_encryption URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.0/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path
from django.conf.urls import url
from django.conf.urls.static import static
from client import views as clientviews
from customer import views as customerviews
from projectadmin import views as projectadminviews
from mas_encryption import settings
urlpatterns = [
    path('admin/', admin.site.urls),
    url('^$',clientviews.client_index, name="client_index"),
    url(r'^aboutus/$',clientviews.aboutus, name="aboutus"),
    url(r'^services/$',clientviews.services, name="services"),
    url(r'^client_login/$',clientviews.client_login, name="client_login"),
    url(r'^client_register/$',clientviews.client_register, name="client_register"),
    url(r'^client_home/$',clientviews.client_home, name="client_home"),
    url(r'^upload_product/$',clientviews.upload_product, name="upload_product"),
    url(r'^clientview_adminmessage/$',clientviews.clientview_adminmessage, name="clientview_adminmessage"),
    url(r'^clientupdate_bargain/(?P<pk>\d+)/$', clientviews.clientupdate_bargain,name="clientupdate_bargain"),
    url(r'^clientupdate_bargain1/$', clientviews.clientupdate_bargain1,name="clientupdate_bargain1"),
    url(r'^clientupdate_bargain11/$', clientviews.clientupdate_bargain11,name="clientupdate_bargain11"),

    url(r'^customer_login/$',customerviews.customer_login, name="customer_login"),
    url(r'^customer_register/$',customerviews.customer_register, name="customer_register"),
    url(r'^customer_home/$',customerviews.customer_home, name="customer_home"),
    url(r'^customer_bargain/(?P<pk>\d+)/$',customerviews.customer_bargain, name="customer_bargain"),
    url(r'^customer_bargain1/$',customerviews.customer_bargain1, name="customer_bargain1"),
    url(r'^cviewadmin_bargain/$',customerviews.cviewadmin_bargain, name="cviewadmin_bargain"),
    url(r'^customer_againbargain/(?P<pk>\d+)/$',customerviews.customer_againbargain, name="customer_againbargain"),
    url(r'^customer_againbargain1/$',customerviews.customer_againbargain1, name="customer_againbargain1"),
    url(r'^customer_payment/$',customerviews.customer_payment, name="customer_payment"),
    url(r'^payment1/(?P<pk>\d+)/$',customerviews.payment1, name="payment1"),

    url(r'^admin_login/$', projectadminviews.admin_login, name="admin_login"),
    url(r'^admin_home/$',projectadminviews.admin_home, name="admin_home"),
    url(r'^adminsend_requestclient/(?P<pk>\d+)/$',projectadminviews.adminsend_requestclient,name="adminsend_requestclient"),
    url(r'^adminsend_requestclient1/$', projectadminviews.adminsend_requestclient1, name="adminsend_requestclient1"),
    url(r'^adminview_clientbargain/$', projectadminviews.adminview_clientbargain, name="adminview_clientbargain"),
    url(r'^adminview_clientbargain1/(?P<pk>\d+)/$', projectadminviews.adminview_clientbargain1, name="adminview_clientbargain1"),
    url(r'^final_price/$', projectadminviews.final_price, name="final_price"),
    url(r'^updateagain_bargain/$', projectadminviews.updateagain_bargain, name="updateagain_bargain"),
    url(r'^updateagain_bargain1/$', projectadminviews.updateagain_bargain1, name="updateagain_bargain1"),
    url(r'^adminview_customerbargain/$', projectadminviews.adminview_customerbargain, name="adminview_customerbargain"),
    url(r'^adminview_customerbargain1/(?P<pk>\d+)/$', projectadminviews.adminview_customerbargain1, name="adminview_customerbargain1"),
    url(r'^customerfinal_price/$', projectadminviews.customerfinal_price, name="customerfinal_price"),
    url(r'^customerupdateagain_bargain/$', projectadminviews.customerupdateagain_bargain, name="customerupdateagain_bargain"),
    url(r'^customerupdateagain_bargain1/$', projectadminviews.customerupdateagain_bargain1, name="customerupdateagain_bargain1"),
    url(r'^view_customerpayment/$', projectadminviews.view_customerpayment, name="view_customerpayment"),
    url(r'^view_landdetails/$', projectadminviews.view_landdetails, name="view_landdetails"),

]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
