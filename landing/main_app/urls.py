from django.urls import path
from . import views

urlpatterns = [
    path('', views.index, name='index'),
    path('advertisement/<int:pk>/', views.advertisement_page),
]