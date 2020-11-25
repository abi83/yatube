from .settings import *

DEBUG = True

ALLOWED_HOSTS += [
    '127.0.0.1',
    "testserver",
]
EMAIL_BACKEND = "django.core.mail.backends.filebased.EmailBackend"
EMAIL_FILE_PATH = os.path.join(BASE_DIR, "sent_emails")

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

LOGGING = {
    'version': 1,
    'disable_existing_loggers': False,
    'handlers': {
        'file': {
            'level': 'INFO',
            'class': 'logging.FileHandler',
            'filename': 'C:\\python\\app\\logging\\log.log',
            'formatter': 'verbose',
        },
    },
    'loggers': {
        'yatube': {
            'handlers': ['file',],
            'level': 'INFO',
            'propagate': True,
        },
    },
    'formatters': {
        'verbose': {
            'format': '%(levelname)s %(asctime)s %(module)s: %(message)s'
        }
    },
}