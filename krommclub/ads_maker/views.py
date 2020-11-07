from django.shortcuts import render
from django.http import HttpResponseRedirect
from django.contrib import messages
from django.shortcuts import render, redirect
from django.core.paginator import Paginator



from .models import SiteMap, Site
from .forms import NewSiteForm


def ads_maker(request):
    sites = Site.objects.all()
    form = NewSiteForm(request.POST or None)
    paginator = Paginator(sites, 10)
    page_number = request.GET.get('page', default=1)
    sites = paginator.get_page(page_number)
    context = {
        'form': form,
        'sites': sites,
        'paginator': paginator,
    }
    if not form.is_valid():
        return render(request, 'ads_maker.html', context)

    site = Site()
    site.url = form.cleaned_data['url']
    site.check_status()
    site.save()
    return render(request, 'ads_maker.html', context)
