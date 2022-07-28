import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mayly_client/constants.dart';

class MainPageController extends GetxController {
  var tabIndex = 0;
  void changeTabIndex(int index) {
    tabIndex = index;
    toggleSatusBarColor(tabIndex);
    update();
  }
}

void toggleSatusBarColor(int tabIndex) {
  if (tabIndex == 4)
    SystemChrome.setSystemUIOverlayStyle(kBrandColorUiOverlay);
  else
    SystemChrome.setSystemUIOverlayStyle(kWhiteUiOverlay);
}
