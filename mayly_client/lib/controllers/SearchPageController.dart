import 'package:get/get.dart';

class SearchPageController extends GetxController {
  dynamic startDate, endDate, place;
  @override
  void onInit() {
    super.onInit();
    var args = Get.arguments;
    print(args);
    if (args != null) {
      startDate = args["startDate"];
      endDate = args["endDate"];
      place = args["place"];
    }
  }

  dynamic collectData() {
    return {
      "startDate": startDate,
      "endDate": endDate,
      "place": place,
    };
  }
}
