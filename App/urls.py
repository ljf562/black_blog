"""blog_后台 URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/2.2/topics/http/urls/
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

from App import views

app_name="App"

urlpatterns = [
    path('',views.index,name='index'),
    path('public_left/',views.public_left,name='public_left'),
    path('public_header/',views.public_header,name='public_header'),

    path('wenzhang_xinwen/',views.wenzhang_xinwen,name='wenzhang_xinwen'),
    path('wenzhang_xinwen/<int:cid>/', views.wenzhang_xinwen, name='wenzhang_xinwen'),
    path('wenzhang_xinwen/<int:cid>/<int:page>/', views.wenzhang_xinwen, name='wenzhang_xinwen'),

    path('tupian_pc_index/', views.tupian_pc_index, name='tupian_pc_index'),
    path('tupian_pc_index/<int:cid>/',views.tupian_pc_index,name='tupian_pc_index'),

    # path('test/',views.test,name='test'),
    path('xitong_set/',views.xitong_set,name="xitong_set"),

    path('change_psw/',views.change_psw,name='change_psw'),

    path('loginb/',views.loginb,name='loginb'),
    # path("refresh/",views.refresh,name='refresh'),
    path('logout/',views.logout_view,name='logout')
]
