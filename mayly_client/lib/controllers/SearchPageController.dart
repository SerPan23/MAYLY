import 'package:get/get.dart';
import 'package:mayly_client/models/FiltersModel.dart';

class SearchPageController extends GetxController {
  Filters filters = Filters();
  @override
  void onInit() {
    super.onInit();
    var args = Get.arguments;
    print(args);
    if (args != null) {
      filters = args["filters"];
    }
  }

  dynamic collectData() {
    return {
      "filters": filters,
    };
  }
}
