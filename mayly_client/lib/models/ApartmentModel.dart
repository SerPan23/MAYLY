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
  final String? street;
  final String? contry;
  final String? city;
  final String? zipcode;
  final Geo? geo;

  Address({
    this.street,
    this.contry,
    this.city,
    this.zipcode,
    this.geo,
  });

  Map<String, dynamic> toJson() {
    return {
      'street': street,
      'contry': contry,
      'city': city,
      'zipcode': zipcode,
      'geo': geo?.toJson(),
    };
  }
}

class Apartment {
  final int id, cost;
  final String title, description;
  final Address address;
  Apartment({
    required this.id,
    required this.cost,
    required this.title,
    required this.description,
    required this.address,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'cost': cost,
      'title': title,
      'description': description,
      'address': address.toJson(),
    };
  }
}
