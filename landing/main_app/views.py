from django.shortcuts import render


def index(request):
    res_data = {}
    return render(request, 'main_app/index.html', res_data)
