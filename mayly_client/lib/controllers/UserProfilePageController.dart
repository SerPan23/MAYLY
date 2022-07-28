import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:mayly_client/constants.dart';

class UserProfilePageController extends GetxController {
  @override
  void onClose() {
    // TODO: implement onClose
    super.onClose();
    SystemChrome.setSystemUIOverlayStyle(kTransparentUiOverlay);
  }
}
