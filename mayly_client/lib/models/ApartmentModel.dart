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
  final int id, cost, ownerId;
  final String title, description, publicationDate;
  final Address address;
  final double raiting;
  final List<String> images;
  Apartment({
    required this.id,
    required this.ownerId,
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
      'ownerId': ownerId,
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
