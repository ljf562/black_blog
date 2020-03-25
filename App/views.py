from captcha.helpers import captcha_image_url
from captcha.models import CaptchaStore
from django.contrib import auth
from django.contrib.auth import authenticate,logout,login
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from django.shortcuts import render, redirect


# Create your views here.
from django.urls import reverse

from App.forms import LoginForm
from App.models import Category, Article, Adminuser
from App.tools import BaiduPaginator

@login_required
def index(request):
    return render(request,'index.html')
    # return HttpResponse("hello")

@login_required
def public_left(request):
    return render(request,'public_left.html')

@login_required
def public_header(request):
    return render(request,'public_header.html')

@login_required
def wenzhang_xinwen(request,cid=-1,page=1):
    categories=Category.objects.all()
    print('hello')
    print(categories)
    postion = [cat.cid for cat in categories]
    print(postion)
    if request.method == "POST":
        cid = int(request.POST.get('cid',-1))
        keyword = request.POST.get('keyword','')
        # 文章检索
        # articles = Article.objects.filter(cid=cid,title__icontains=keyword)
        articles = Article.objects.filter(cid=cid,title__icontains=keyword)

    else:
        # 检索分类
        if cid < 0:
            first_category = categories.first() # 查询第一个分类
            cid = first_category.cid  # 第一个分类的cid

        # 文章检索
        articles = Article.objects.filter(cid=cid)

    pos = postion.index(cid)
    print("hello")
    print(articles)

    # 分页
    # 调用封装好的分页模块
    paginator = BaiduPaginator(articles,5)
    pager = paginator.page(page)

    # 设置上一页与下一页的值

    prepage=page
    nextpage=page
    if prepage-1>=1:
        prepage=page-1
    if nextpage+1<=paginator.num_pages:
        nextpage=page+1

    print(prepage,nextpage)

    print(pager)
    # page为当前页码
    # 5为每页显示的页码下标数量
    pager.page_range = paginator.custom_range(page,5)
    return render(request,'wenzhang_xinwen.html',locals()) 

@login_required
def tupian_pc_index(request,cid=-1):
    categories = Category.objects.all()
    if cid < 0:
        first_category = categories.first()  # 查询第一个分类
        cid = first_category.cid
    articles = Article.objects.filter(cid=cid)
    cate_name=Category.objects.filter(cid=cid).first()
    if request.method=="POST":
        data = request.POST.dict()
        data.pop('csrfmiddlewaretoken')
        article = Article.objects.get(pk=data['aid'])
        print(data)
        article.picture=data['picture']
        article.save()
        # Article.add(**data)
        # return HttpResponse("更改成功")
        return redirect(reverse("App:tupian_pc_index",kwargs={'cid':cid}))
    print(cate_name.name)
    return render(request,'tupian_pc_index.html',locals())


# def test(request):
#     return render(request,'hello1.html')
@login_required
def xitong_set(request):
    if request.method=="POST":
        data=request.POST.dict()
        data.pop('csrfmiddlewaretoken')
        print(data)
        if data["username"] and data["password"]:
            print(data["username"])
            user = Adminuser.objects.filter(username=data["username"]).first()
            if user:
                response = HttpResponse()
                response.write('<script>alert("用户名已存在，不能重复") ;history.go(-1); </script>')
                return response
            else:
                Adminuser.objects.create_user(**data)
        # user.save()
        # return HttpResponse('hello')
    return render(request,'xitong_set.html',locals())

@login_required
def change_psw(request):
    if request.method == "POST":
        data = request.POST.dict()
        if data["cofrim"]!=data["password"]:
            response = HttpResponse()
            response.write('<script>alert("两次密码不一致") ;history.go(-2); </script>')
            return response
        user=auth.authenticate(username=request.user.username,password=data['password_old'])
        if user:
            user.set_password(data["password"])
            user.save()
        else:
            response = HttpResponse()
            response.write('<script>alert("旧密码不正确") ;history.go(-2); </script>')
            return response
    return render(request,'change_psw.html',locals())


def loginb(request):
    if request.method == "POST":
        yzm = request.POST.get('yzm', '')
        username=request.POST.get('username','')
        password=request.POST.get('password','')
        # print(yzm)
        hashkey = request.POST.get('code','')
        # print("hello")
        # print(hashkey)
        # print(password,username)
        print("hello1")
        cap = CaptchaStore.objects.filter(hashkey=hashkey).first()
        user=authenticate(username=username,password=password)
        # print(request.user.is_authenticated)
        # print(user.username)
        # print(user.password)
        if cap and user:
            print("woshi 沙发")
            if cap.response == yzm.lower() :
                print("阿斯蒂芬")
                login(request,user)
                return redirect("/")

        response=HttpResponse()
        response.write('<script>alert("用户名,密码,验证码错误") ;history.go(-1); </script>')
        return response

    else:
        new_key = CaptchaStore.pick()
        image_url = captcha_image_url(new_key)
        # print(form.captcha)
        return render(request,'loginb.html',locals())

# def refresh(request):
#     new_key = CaptchaStore.pick()
#     res = captcha_image_url(new_key)
#     print(new_key)
#     print(res)
#     return HttpResponse(res)
@login_required()
def logout_view(request):
    logout(request)
    return redirect(reverse("App:loginb"))