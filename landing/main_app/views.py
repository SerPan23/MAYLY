from django.core.mail import send_mail
from django.http import HttpResponseRedirect
from django.shortcuts import render

from landing import settings
from .models import Apartment, Reservation

from django.utils.safestring import mark_safe
import datetime

from .utilits import get_booked_days

months = {
    '1': 'Январь',
    '2': 'Февраль',
    '3': 'Март',
    '4': 'Апрель',
    '5': 'Май',
    '6': 'Июнь',
    '7': 'Июль',
    '8': 'Август',
    '9': 'Сентябрь',
    '10': 'Октябрь',
    '11': 'Ноябрь',
    '12': 'Декабрь',
}


def index(request):
    res_data = {'apartments': Apartment.objects.filter(is_full=False).exclude(type='Room_in_hotel')}
    # for i in res_data['apartments']:
        # print(i.id, i.name)
    return render(request, 'main_app/index.html', res_data)


def advertisement_page(request, pk):
    res_data = {'pk': pk, 'apartment': Apartment.objects.get(id=int(pk))}
    d = datetime.date.today()
    if res_data['apartment'].type == 'Hotel':
        res_data['rooms'] = Apartment.objects.filter(hotel_id=pk).filter(is_full=False)
    else:
        booked_days = []
        for j in Reservation.objects.filter(apartment=res_data['apartment']):
            booked_days += get_booked_days(j.start_date, j.end_date)
        res_data['booked_days'] = booked_days
        # print(booked_days)

    return render(request, 'main_app/advertisement_page.html', res_data)


def book(request, pk):
    if request.method == "POST":
        email = request.POST.get("email", "")
        sdate = request.POST.get("sdate", "")
        edate = request.POST.get("edate", "")
        data = pk.split('|')
        apartment = Apartment.objects.get(id=int(data[0]))
        reservation = Reservation.objects.create(apartment=apartment)
        reservation.start_date = datetime.datetime.strptime(str(sdate), "%d.%m.%Y")
        reservation.end_date = datetime.datetime.strptime(str(edate), "%d.%m.%Y")
        reservation.guest_email = email
        reservation.save()
        apr_name = ''
        if apartment.type == 'Room_in_hotel':
            h = Apartment.objects.get(id=int(apartment.hotel_id))
            apr_name = h.name + " (" + apartment.name + ")"
        else:
            apr_name = apartment.name
        owner_message = 'Пользователь: ' + email + ' забронировал у вас '+ apr_name +'.\nДаты брони: ' + sdate + ' - ' \
            + edate + '\nЕсли по каким-то причинам вас не устраивают эти даты напишите нам igracom@yandex.ru'
        send_mail(settings.EMAIL_TOPIC, owner_message,
                  settings.EMAIL_HOST_USER, [apartment.owner_email])

        guest_message = 'Вы забронировали ' + apr_name + '.\nДаты брони: ' + sdate + ' - ' + edate \
                  + '\nЕсли Вы передумали приезжать в эти даты напишите нам igracom@yandex.ru'
        send_mail(settings.EMAIL_TOPIC, guest_message,
                  settings.EMAIL_HOST_USER, [email])
    return HttpResponseRedirect("/")
