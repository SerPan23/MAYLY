class User {
  final int id;
  final String login, name, surname, email, phone, image;

  final double landlord_raiting, renter_raiting;

  User({
    required this.id,
    required this.landlord_raiting,
    required this.renter_raiting,
    required this.login,
    required this.name,
    required this.surname,
    required this.email,
    required this.phone,
    required this.image,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'landlord_raiting': landlord_raiting,
      'renter_raiting': renter_raiting,
      'login': login,
      'name': name,
      'surname': surname,
      'email': email,
      'phone': phone,
      'image': image,
    };
  }
}

User testUser = User(
  id: 0,
  landlord_raiting: 4.7,
  renter_raiting: 4.9,
  login: 'test',
  name: 'Test',
  surname: 'User',
  email: "support@mayly.ru",
  phone: '+79851110041',
  image:
      'https://img.freepik.com/free-photo/pretty-smiling-joyfully-female-with-fair-hair-dressed-casually-looking-with-satisfaction_176420-15187.jpg?w=2000&t=st=1658422536~exp=1658423136~hmac=372ed1938ef0c90a0bc1bf1eea2458f2d090798866a3b54960d9b756b3aa2c66',
);
