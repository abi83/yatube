from django.db import models


class Site(models.Model):
    url = models.URLField(unique=True, help_text='Your site url without http or https')
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)

    def __str__(self):
        return self.url


class SiteMap(models.Model):
    url = models.URLField(unique=True, help_text='xxx')
    count = models.IntegerField
    site = models.ForeignKey(Site, blank=False, on_delete=models.CASCADE, related_name="site")
    created_at = models.DateTimeField(auto_now_add=True)
    updated_at = models.DateTimeField(auto_now=True)



