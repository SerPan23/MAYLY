import 'package:get/get.dart';

class SearchFiltersPageController extends GetxController {
  dynamic startDate, endDate;

  void selectDate(dynamic picked) {
    dynamic t1 = picked.start.toString().split('-');
    dynamic t2 = picked.end.toString().split('-');
    startDate = t1[2].split(' ')[0] + '.' + t1[1] + '.' + t1[0];
    endDate = t2[2].split(' ')[0] + '.' + t2[1] + '.' + t2[0];
    update();
  }
}
