import os
from datetime import datetime

from django.conf import settings
from django.contrib.auth.decorators import login_required
from django.http import HttpResponse
from django.shortcuts import render, redirect

# Create your views here.
from django.urls import reverse

from App.models import Article, Category, Tag

@login_required
def delete_article(request,aid,cid=-1,page=1):
    """

    :param request:
    :param aid: 文章id
    :param cid: 类别
    :param page: 页码
    :return:
    """
    arcticle=Article.objects.get(pk=aid)
    if arcticle:
        arcticle.delete()
    return redirect(reverse("App:wenzhang_xinwen",kwargs={'cid':cid,'page':page}))




# def test(request):
#     return render(request,'hello1.html')
@login_required
def publish_article(request,cid=-1):
    if request.method == "POST":
        data = request.POST.dict()
        data.pop('csrfmiddlewaretoken')
        # data.pop('photo')
        file=request.FILES.get('photo','')
        data.pop('photo')
        if file:
            savePath=os.path.join(settings.MDEIA_ROOT,file.name)
            print(savePath)
            with open(savePath,'wb') as f:
                if file.multiple_chunks():
                    for myf in file.chunks():
                        f.write(myf)
                        print('大于2.5')
                else:
                    f.write(file.read())
                    print('小于2.5')

            data['picture']="/upload/"+file.name
        data['create_time']=datetime.now()
        print(data, type(data))

        Article.add(**data)
        # return HttpResponse('文件上传成功')
        return redirect(reverse("App:wenzhang_xinwen"))
    else:
        cid = cid if cid > 0 else Category.first_category().cid

        return render(request,'wenzhang_xinwen_fabu.html',locals())

@login_required
def update_article(request,cid,aid):
    article = Article.objects.get(pk=aid)
    tag = Tag.objects.filter(aid=aid)
    if request.method == "POST":
        data = request.POST.dict()
        data.pop('csrfmiddlewaretoken')
        print("woshishui")

        # data.pop('photo')
        file=request.FILES.get('picture','')
        print(file)
        if file:
            savePath=os.path.join(settings.MDEIA_ROOT,file.name)
            print(savePath)
            with open(savePath,'wb') as f:
                if file.multiple_chunks():
                    for myf in file.chunks():
                        f.write(myf)
                        print('大于2.5')
                else:
                    f.write(file.read())
                    print('小于2.5')

            data['picture']="/static/upload/"+file.name
        data['create_time'] = datetime.now()
        data['aid']=article.aid
        print(data)
        article.delete()
        Article.add(**data)
        # return HttpResponse('文件上传成功')
        return redirect(reverse("App:wenzhang_xinwen"))
    else:
        s=''
        for t in tag:
            s+=t.name
            s+=","
        s=s[:-1]
        print(s)
        print(tag)

        return render(request,'wenzhang_xinwen_info.html',locals())


