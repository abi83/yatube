from .settings import *

# DEBUG = True

ALLOWED_HOSTS += [
    '127.0.0.1',
    "testserver",
]
# EMAIL_BACKEND = "django.core.mail.backends.filebased.EmailBackend"
# EMAIL_FILE_PATH = os.path.join(BASE_DIR, "sent_emails")

EMAIL_BACKEND = 'django.core.mail.backends.smtp.EmailBackend'

EMAIL_HOST = 'smtp.yandex.ru'
EMAIL_HOST_USER = 'info@krommclub.ru'
EMAIL_HOST_PASSWORD = env('EMAIL_PSWD')
EMAIL_PORT = 587
EMAIL_USE_TLS = True
EMAIL_USE_SSL = False

# Always use IPython for shell_plus
SHELL_PLUS = 'ipython'
SHELL_PLUS_PRINT_SQL = True

STATICFILES_DIRS = ['static',]

INSTALLED_APPS += [
    'django_extensions',
    'debug_toolbar',
]

MIDDLEWARE += [
    "debug_toolbar.middleware.DebugToolbarMiddleware",
]

INTERNAL_IPS = [
    "127.0.0.1",
]

LOGGING['handlers']['file']['level'] = 'DEBUG'
LOGGING['handlers']['file']['filename'] = 'C:\\python\\app\\logging\\log.log'
