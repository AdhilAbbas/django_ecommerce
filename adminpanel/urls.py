from django.conf.urls import url
from django.urls import path,include
from . import views
urlpatterns=[
    path('',views.adminlogin,name="adminlogin"),
    path('home',views.adminhome,name="adminhome"),
    path('viewuser',views.viewuser,name="viewuser"),
    path('block',views.block,name="userblock"),
    path('unblock',views.unblock,name="unblock"),
    path('logout',views.logout,name="logout"),
    path('orderedproducts',views.orderedproducts,name="orderedproducts"),
    path('orderdetails',views.orderdetails,name="orderdetails"),
    url(r'^updatestatus/(?P<id>\w+)',views.updatestatus,name="updatestatus"),
    path('discount',views.discount,name="discount"),
    path('addcoupon',views.addcoupon,name="addcoupon"),
    path('managecoupon',views.managecoupon,name="couponmanagement"),
    path('changestatus',views.changestatus,name="changestatus"),
    path('salesreport',views.salesreport,name="salesreport"),
    path('salesreport1',views.salesreport1,name="salesreport1"),
    path('categorymanagement',views.categorymanagement,name="categorymanagement"),
    
 ]