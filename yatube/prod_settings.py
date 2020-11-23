from .settings import *

ALLOWED_HOSTS += [
    'krommclub.ru',
]

STATIC_ROOT = os.path.join(BASE_DIR, 'static')

EMAIL_BACKEND = "django.core.mail.backends.filebased.EmailBackend"
EMAIL_FILE_PATH = os.path.join(BASE_DIR, "sent_emails")
