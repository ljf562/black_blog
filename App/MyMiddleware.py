'''
# -*- coding:utf-8 -*-
# @Time:2020/3/24 21:45
# @Author:chisha
# @Description:
'''
from django.http import HttpResponse
from django.shortcuts import redirect
from django.urls import reverse
from django.utils.deprecation import MiddlewareMixin


class MyMiddleware(MiddlewareMixin):
    def process_request(self, request):
        # return
    #     # print(request.method)
        # 全局路由保护
        print(request.path)
        # if request.user.is_authenticated and request.path in ['/loginb/'] :
        #     return
        # elif request.path not in ['/loginb/']:
        #     return redirect(reverse("App:loginb"))
