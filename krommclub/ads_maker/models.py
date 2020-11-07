# import requests
# import datetime
from django.db import models
import requests
from requests.exceptions import ConnectionError


class Site(models.Model):
    url = models.URLField(unique=True, null=False)
    status = models.CharField(max_length=3, null=False, default='200')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    class Meta:
        ordering = ('-updated_at',)

    def check_status(self):
        try:
            r = requests.get(str(self.url), headers={})
        except ConnectionError:
            self.status = 'xxx'
            return
        self.status = r.status_code

    def get_sitemap(self):
        sitemaps_list = []
        sitemaps_list.append()

    def __str__(self):
        return self.url


class SiteMap(models.Model):
    url = models.URLField(unique=True, help_text='Sitemaps URL')
    count = models.IntegerField
    site = models.ForeignKey(Site, blank=False, on_delete=models.CASCADE, related_name="site")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)
    is_sm_index = models.BooleanField(null=True)



