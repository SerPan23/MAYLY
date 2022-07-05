from django.shortcuts import render


def index(request):
    res_data = {}
    return render(request, 'main_app/index.html', res_data)


def advertisement_page(request, pk):
    res_data = {'pk': pk}
    return render(request, 'main_app/advertisement_page.html', res_data)
