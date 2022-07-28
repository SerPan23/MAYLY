import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mayly_client/models/ApartmentModel.dart';
import 'package:mayly_client/models/FiltersModel.dart';

class ApartmentPageController extends GetxController {
  ApartmentPageController({required this.apartment, this.filters});
  final Apartment apartment;
  Filters? filters;
  @override
  void onInit() async {
    super.onInit();
    if (filters == null) {
      filters = Filters();
    } else {
      filters = Filters(
        startDate: filters!.startDate,
        endDate: filters!.endDate,
        place: filters!.place,
      );
    }
    update();
  }

  void selectDate(dynamic picked) {
    dynamic t1 = picked.start.toString().split('-');
    dynamic t2 = picked.end.toString().split('-');
    filters?.startDate = t1[2].split(' ')[0] + '.' + t1[1] + '.' + t1[0];
    filters?.endDate = t2[2].split(' ')[0] + '.' + t2[1] + '.' + t2[0];
    update();
  }

  DateTimeRange? makeDateRange() {
    if (filters?.startDate == null) return null;

    DateTime sDate = DateTime.parse(
        filters!.startDate.toString().split('.').reversed.join());
    DateTime eDate =
        DateTime.parse(filters!.endDate.toString().split('.').reversed.join());
    return DateTimeRange(start: sDate, end: eDate);
  }
}
