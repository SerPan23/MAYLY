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
    List<Apartment> _apartments = testApartments;

    return _apartments;
  }
}
