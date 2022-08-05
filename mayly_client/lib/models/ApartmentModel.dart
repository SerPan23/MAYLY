import 'package:mayly_client/models/UserModel.dart';

class Geo {
  final double lat;
  final double lng;

  Geo({
    this.lat = 0.0,
    this.lng = 0.0,
  });

  Map<String, dynamic> toJson() {
    return {
      'lat': lat,
      'lng': lng,
    };
  }
}

class Address {
  final String? house;
  final String? street;
  final String? contry;
  final String? city;
  final Geo? geo;

  Address({
    this.house,
    this.street,
    this.contry,
    this.city,
    this.geo,
  });

  Map<String, dynamic> toJson() {
    return {
      'house': house,
      'street': street,
      'contry': contry,
      'city': city,
      'geo': geo?.toJson(),
    };
  }

  @override
  String toString() {
    return "${contry}, ${city}, ${street}, ${house}";
  }
}

class Apartment {
  final int id, cost;
  final String title, description, publicationDate, type;
  final Address address;
  final double raiting;
  final User owner;

  final List<String> images;
  Apartment({
    required this.id,
    required this.type,
    required this.owner,
    required this.cost,
    required this.title,
    required this.description,
    required this.address,
    required this.raiting,
    required this.publicationDate,
    required this.images,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'ownerId': owner.toJson(),
      'cost': cost,
      'title': title,
      'description': description,
      'raiting': raiting,
      'publicationDate': publicationDate,
      'address': address.toJson(),
      'images': images,
    };
  }
}

List<Apartment> testApartments = [
  Apartment(
    id: 0,
    type: 'room_in_hotel',
    owner: testUser,
    cost: 3000,
    title: "Название номера 1",
    description:
        'Гостиница Мир располагается в чарующем, тихом уголке города, недалеко от станции метро "Московская" и южных ворот города Санкт-Петербурга - площади Победы, всего в десяти минутах езды от аэропорта "Пулково" и пятнадцати - до Невского проспекта.',
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
      'https://cf.bstatic.com/images/hotel/max1280x900/524/52478862.jpg',
      'https://anextour-moscow.ru/images/hotels/gallery/561978/0-0_94471600959596.jpg',
      'https://civilianglobal.com/wp-content/uploads/2014/08/rioja-5.jpg?x82022',
    ],
  ),
  Apartment(
    id: 1,
    type: 'room_in_hotel',
    owner: testUser,
    cost: 2200,
    title: "Название номера 2",
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
      'https://cf.bstatic.com/images/hotel/max1280x900/524/52478862.jpg',
      'https://anextour-moscow.ru/images/hotels/gallery/561978/0-0_94471600959596.jpg',
      'https://civilianglobal.com/wp-content/uploads/2014/08/rioja-5.jpg?x82022',
    ],
  ),
  Apartment(
    id: 2,
    type: 'house',
    owner: testUser,
    cost: 2430,
    title: "Название дома",
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
      'https://cf.bstatic.com/images/hotel/max1280x900/524/52478862.jpg',
      'https://anextour-moscow.ru/images/hotels/gallery/561978/0-0_94471600959596.jpg',
      'https://civilianglobal.com/wp-content/uploads/2014/08/rioja-5.jpg?x82022',
    ],
  ),
];
