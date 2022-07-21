import 'package:get/get.dart';
import 'package:mayly_client/models/ApartmentModel.dart';

class FavouritesPageController extends GetxController {
  Future<List<Apartment>> fetchApartments() async {
    await Future.delayed(Duration(milliseconds: 1050));
    List<Apartment> _apartments = testApartments;

    return _apartments;
  }
}
