from .views import *
from django.urls import path
from django.conf.urls.static import static

urlpatterns = [
    path('', HomeView.as_view(), name='index'),
]
