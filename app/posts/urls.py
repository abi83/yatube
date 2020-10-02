from django.urls import path

from . import views

urlpatterns = [
    path('', views.groups_list, name='index'),
    path('<str:group_slug>/', views.group_posts, name='group')
]