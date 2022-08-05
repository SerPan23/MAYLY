import 'package:mayly_client/models/UserModel.dart';

class Review {
  final int id;
  final String text, publicationDate;
  final User owner;
  final double raiting;

  Review({
    required this.id,
    required this.owner,
    required this.raiting,
    required this.text,
    required this.publicationDate,
  });

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'owner': owner.toJson(),
      'raiting': raiting,
      'text': text,
      'publicationDate': publicationDate,
    };
  }
}
