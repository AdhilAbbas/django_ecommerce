from os import name
from django.urls import path,include
from . import views
urlpatterns=[
    path('addproduct',views.addproduct,name="addproduct"),
    path('listproduct',views.listproduct,name="listproduct"),
    path('editproduct',views.editproduct,name="editproduct"),
    path('deleteproduct',views.deleteproduct,name="deleteproduct"),
    path('logout',views.logout,name="logout"),
    path('addcategory',views.addcategory,name="addcategory"),
    path('addbanner',views.addbanner,name="addbanner"),
    path('poffer',views.poffer,name="poffer"),
]