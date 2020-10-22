from django.forms import ModelForm
from .models import Site

class NewSiteForm(ModelForm):
    class Meta:
        model = Site
        # url = forms.URLField(initial='http://') Field.initial
        # https://docs.djangoproject.com/en/3.1/ref/forms/fields/
        fields = ('url',)
