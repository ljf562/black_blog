# This is an auto-generated Django model module.
# You'll have to do the following manually to clean this up:
#   * Rearrange models' order
#   * Make sure each model has one field with primary_key=True
#   * Make sure each ForeignKey has `on_delete` set to the desired behavior.
#   * Remove `managed = False` lines if you wish to allow Django to create, modify, and delete the table
# Feel free to rename the models, but don't rename db_table values or field names.
import re

from django.contrib.auth.models import AbstractUser
from django.db import models



class Article(models.Model):
    aid = models.AutoField(primary_key=True)
    title = models.CharField(max_length=100, blank=True, null=True)
    content = models.CharField(max_length=10000, blank=True, null=True)
    create_time = models.DateTimeField(blank=True, null=True)
    cid = models.ForeignKey('Category', models.DO_NOTHING, db_column='cid', blank=True, null=True)
    hits = models.IntegerField(blank=True, null=True)
    replies = models.IntegerField(blank=True, null=True)
    picture = models.CharField(max_length=300, blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'article'

    @classmethod
    def add(cls, **kwargs):
        cid = kwargs.pop('cid')
        tag = kwargs.pop('tag')
        obj = cls(**kwargs)
        obj.cid = Category.objects.get(pk=cid)
        obj.save()
        tags = re.split(r'[, ]+', tag)
        Tag.add(obj, tags)

        return obj


class Category(models.Model):
    cid = models.AutoField(primary_key=True)
    name = models.CharField(unique=True, max_length=100)
    num = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'category'


class Mark(models.Model):
    mid = models.AutoField(primary_key=True)
    content = models.CharField(max_length=1000, blank=True, null=True)
    create_time = models.DateTimeField(blank=True, null=True)
    uid = models.ForeignKey('User', models.DO_NOTHING, db_column='uid', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'mark'


class Tag(models.Model):
    tid = models.AutoField(primary_key=True)
    name = models.CharField(max_length=30, blank=True, null=True)
    aid = models.ForeignKey(Article, models.CASCADE, db_column='aid', blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'tag'

    @classmethod
    def add(cls, article, tags):
        if len(tags) > 0:
            for t in tags:
                tag = Tag(name=t)
                tag.aid = article
                tag.save()


class User(models.Model):
    uid = models.AutoField(primary_key=True)
    username = models.CharField(unique=True, max_length=30)
    password = models.CharField(max_length=128)
    phone = models.CharField(max_length=11, blank=True, null=True)
    email = models.CharField(max_length=200, blank=True, null=True)
    portrait = models.CharField(max_length=300, blank=True, null=True)
    regtime = models.DateTimeField(blank=True, null=True)
    isforbid = models.IntegerField(blank=True, null=True)

    class Meta:
        managed = False
        db_table = 'user'

class Adminuser(AbstractUser):
    uid = models.AutoField(primary_key=True)
    username = models.CharField(unique=True, max_length=30)
    password = models.CharField(max_length=128)

    class Meta:
        # managed = False
        db_table = 'adminuser'