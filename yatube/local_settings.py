from .settings import *

EMAIL_BACKEND = "django.core.mail.backends.filebased.EmailBackend"
EMAIL_FILE_PATH = os.path.join(BASE_DIR, "sent_emails")

# Always use IPython for shell_plus
SHELL_PLUS = "ipython"
SHELL_PLUS_PRINT_SQL = True

STATICFILES_DIRS = ['static',]

INSTALLED_APPS += [
    #'django_extensions',
    #"debug_toolbar",
]

