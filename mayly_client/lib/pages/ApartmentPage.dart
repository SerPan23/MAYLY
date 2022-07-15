import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mayly_client/constants.dart';
import 'package:mayly_client/controllers/ApartmentPageController.dart';
import 'package:mayly_client/models/ApartmentModel.dart';

class ApartmentPage extends StatelessWidget {
  const ApartmentPage({Key? key, required this.apartment}) : super(key: key);
  final Apartment apartment;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 40.h,
        backgroundColor: Colors.transparent,
        systemOverlayStyle: kTransparentUiOverlay,
        leading: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            Get.back();
          },
          child: const Icon(
            CupertinoIcons.back,
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: GetBuilder<ApartmentPageController>(
          init: ApartmentPageController(apartment: apartment),
          builder: (controller) {
            return Expanded(
              child: Container(
                height: double.infinity,
                color: Colors.white,
              ),
            );
          },
        ),
      ),
    );
  }
}
