from os import name
from django.conf.urls import url
from django.urls import path
from django.urls.conf import include
from . import views

urlpatterns=[
    path('',views.signin,name="signin"),
    path('signup',views.signup,name="signup"),
    path('showproduct',views.showproduct,name="showproduct"),
    path('logout',views.logout,name="userlogout"),
    path('myaccount',views.myaccount,name="myaccount"),
    path('addaddress',views.addaddress,name="addaddress"),
    path('wishlist',views.wishlistes,name="wishlist"),
    path('wish',views.wish,name="wish"),
    path('wishremove',views.wishremove,name="wishremove"),
    path('cart',views.carts,name="cart"),
    path('tocart',views.tocart,name="tocart"),
    url(r'^quantityup/(?P<id>\w+)',views.up,name="quantityup"),
    url(r'^quantitydown/(?P<id>\w+)',views.down,name="quantitydown"),
    url(r'^cartremove/(?P<id>\w+)',views.cartremove,name="cartremove"),
    path('alladdresses',views.alladdress,name="alladdresses"),
    path('updateaddress',views.updateaddress,name="updateaddress"),
    # url(r'^updateaddress/(?P<id>\w+)',views.updateaddress,name="updateaddress"),
    url(r'^eachaddressupdate/(?P<id>\w+)',views.eachaddressupdate,name="eachaddressupdate"),
    url(r'^removeaddress/(?P<id>\w+)',views.removeaddress,name="removeaddress"),
    url(r'^cart2/(?P<id>\w+)',views.cart2,name="cart2"),
    path('checkout',views.checkout,name="checkout"),
    url(r'^selectaddress/(?P<id>\w+)',views.selectaddress,name="selectaddress"),
    path('checkoutaddaddress',views.checkoutaddaddress,name="checkoutaddaddress"),
    path('ordercomplete',views.ordercomplete,name="ordercomplete"),
    path('myorders',views.myorders,name="myorders"),
    url(r'^cancelproduct/(?P<id>\w+)',views.cancelproduct,name="cancelproduct"),
    path('buynow',views.buynow,name="buynow"),
    path('applycoupon',views.applycoupon,name="applycoupon"),
    url(r'^checkoutquantityup/(?P<id>\w+)',views.checkoutquantityup,name="checkoutquantityup"),
    url(r'^checkoutquantitydown/(?P<id>\w+)',views.checkoutquantitydown,name="checkoutquantitydown"),
    path('search',views.search,name="search"),
    # path('tocart',views.tocart,name="tocart"),

]