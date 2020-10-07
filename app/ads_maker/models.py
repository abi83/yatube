# import requests
# import datetime
from django.db import models

# from .ads_settings import headers


class Site(models.Model):
    url = models.URLField(unique=True, help_text='Input valid ULR of your site with http://', null=False)
    status = models.CharField(max_length=3, null=False, default='200')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    # def __init__(self, given_url, status, created_at, updated_at, pk):
    #     r = requests.get(given_url, headers=headers)
    #     if r.status_code == 200:
    #         self.status = r.status_code
    #         self.url = given_url
    #         self.created_at = datetime.datetime.now()
    #         self.updated_at = datetime.datetime.now()
    #         self.pk = pk
    #     else:
    #         raise ConnectionError(f'Site {given_url} can not be reached')


    def __str__(self):
        return self.url


class SiteMap(models.Model):
    url = models.URLField(unique=True, help_text='Sitemaps URL')
    count = models.IntegerField
    site = models.ForeignKey(Site, blank=False, on_delete=models.CASCADE, related_name="sitemap_site")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)



