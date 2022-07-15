import 'package:get/get.dart';
import 'package:mayly_client/models/ApartmentModel.dart';
import 'package:mayly_client/models/FiltersModel.dart';

class SearchPageController extends GetxController {
  Filters filters = Filters();
  List<Apartment> apartments = [];
  @override
  void onInit() async {
    super.onInit();
    var args = Get.arguments;
    print(args);
    if (args != null) {
      filters = args["filters"];
    }
    // apartments = await fetchApartments();
    update();
  }

  dynamic collectData() {
    return {
      "filters": filters,
    };
  }

  Future<List<Apartment>> fetchApartments() async {
    await Future.delayed(Duration(milliseconds: 1050));
    List<Apartment> _apartments = [
      Apartment(
        id: 0,
        ownerId: 0,
        cost: 3000,
        title: "Название отеля 1",
        description: "Описание",
        raiting: 4.5,
        publicationDate: "13.07.2022",
        address: Address(
          house: 'дом 5 строение 2',
          street: 'ул. Солнечная',
          contry: "Россия",
          city: "Анапа",
          geo: Geo(
            lat: 44.8857008,
            lng: 37.31991909999999,
          ),
        ),
        images: [
          'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
          'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
          'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
        ],
      ),
      Apartment(
        id: 1,
        ownerId: 30,
        cost: 2200,
        title: "Название отеля 2",
        description: "Описание",
        raiting: 5,
        publicationDate: "11.07.2022",
        address: Address(
          house: 'дом 1',
          street: 'ул. Тестовая',
          contry: "Россия",
          city: "Анапа",
          geo: Geo(
            lat: 44.8857008,
            lng: 37.31991909999999,
          ),
        ),
        images: [
          'https://images.unsplash.com/photo-1520342868574-5fa3804e551c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=6ff92caffcdd63681a35134a6770ed3b&auto=format&fit=crop&w=1951&q=80',
          'https://images.unsplash.com/photo-1522205408450-add114ad53fe?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=368f45b0888aeb0b7b08e3a1084d3ede&auto=format&fit=crop&w=1950&q=80',
          'https://images.unsplash.com/photo-1519125323398-675f0ddb6308?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=94a1e718d89ca60a6337a6008341ca50&auto=format&fit=crop&w=1950&q=80',
        ],
      ),
      Apartment(
        id: 2,
        ownerId: 0,
        cost: 2430,
        title: "Название отеля 3",
        description: "Описание",
        raiting: 3.5,
        publicationDate: "14.07.2022",
        address: Address(
          house: 'дом 4',
          street: 'ул. Зимняя',
          contry: "Россия",
          city: "Анапа",
          geo: Geo(
            lat: 44.8857008,
            lng: 37.31991909999999,
          ),
        ),
        images: [
          'https://images.unsplash.com/photo-1523205771623-e0faa4d2813d?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=89719a0d55dd05e2deae4120227e6efc&auto=format&fit=crop&w=1953&q=80',
          'https://images.unsplash.com/photo-1508704019882-f9cf40e475b4?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=8c6e5e3aba713b17aa1fe71ab4f0ae5b&auto=format&fit=crop&w=1352&q=80',
          'https://images.unsplash.com/photo-1519985176271-adb1088fa94c?ixlib=rb-0.3.5&ixid=eyJhcHBfaWQiOjEyMDd9&s=a0c8d632e977f94e5d312d9893258f59&auto=format&fit=crop&w=1355&q=80'
        ],
      ),
    ];

    return _apartments;
  }
}
