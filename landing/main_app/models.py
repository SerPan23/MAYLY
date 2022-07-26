from django.db import models
import datetime


class Apartment(models.Model):
    TYPE_CHOICES = (
        ('Flat', 'Квартира/Дом'),
        ('Hotel', 'Отель'),
        ('Room_in_hotel', 'Номер'),
        ('Room', 'Комната'),
    )
    type = models.CharField("Тип", choices=TYPE_CHOICES, default='', max_length=50)
    name = models.CharField("Название", default='', null=True, blank=True, max_length=250)
    description = models.TextField("Описание", default='', blank=True)
    is_full = models.BooleanField("Заполненно?", default=False)
    hotel_id = models.CharField("hotel_id", default='', blank=True, max_length=50)
    address = models.TextField("Адрес", default='', blank=True)
    cost = models.IntegerField('Цена', default=1)
    owner_email = models.EmailField('Email хозяина', default='', blank=True)
    are_we_intermediary = models.BooleanField("Мы посредник?", default=False)
    owner_contacts = models.TextField('Контакты хозяина', default='', blank=True)

    def __str__(self):
        return '{}'.format(self.name)


class Gallery(models.Model):
    image = models.ImageField(upload_to='gallery')
    apartment = models.ForeignKey(Apartment, on_delete=models.CASCADE, related_name='images')


class Reservation(models.Model):
    apartment = models.ForeignKey(Apartment, on_delete=models.CASCADE, related_name='reservation')
    start_date = models.DateField(blank=False, null=False, default=datetime.date.today())
    end_date = models.DateField(blank=False, null=False, default=datetime.date.today())
    guest_email = models.EmailField('Email гостя', default='', blank=True)
