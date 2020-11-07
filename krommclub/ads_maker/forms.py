from django import forms
from django.core.exceptions import ValidationError

from .models import Site
import string


class NewSiteForm(forms.Form):
    def clean_url(self):
        cleaned_data = self.cleaned_data['url'].lower()
        accepted = string.ascii_lowercase + '.:/'
        for letter in cleaned_data:
            if letter not in accepted:
                raise ValidationError('It is not an URL')

        return cleaned_data

    url = forms.CharField(
        max_length=30,
        min_length=5,
        label='Site URL',
        help_text='Enter correct site URL',
        # required=True,
        error_messages={'required': 'Please enter your name'},
        # validators=[url_validator(),],
    )
