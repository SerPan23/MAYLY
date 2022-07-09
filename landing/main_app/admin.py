from django.contrib import admin
from .models import *


class GalleryInline(admin.TabularInline):
    fk_name = 'apartment'
    model = Gallery


@admin.register(Apartment)
class ApartmentAdmin(admin.ModelAdmin):
    inlines = [GalleryInline]


admin.site.register(Reservation)