import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mayly_client/constants.dart';
import 'package:mayly_client/controllers/FavouritesPageController.dart';
import 'package:mayly_client/widgets/CollectionBlock.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavouritesPageController>(
      init: FavouritesPageController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: kBgColor,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            toolbarHeight: 50.h,
            backgroundColor: Colors.white,
            systemOverlayStyle: kTransparentUiOverlay,
            title: Text(
              "Избранное",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            // actions: [
            //   Padding(
            //     padding: EdgeInsets.only(right: 16.w),
            //     child: InkWell(
            //       highlightColor: Colors.transparent,
            //       splashColor: Colors.transparent,
            //       onTap: () {
            //         Get.back();
            //       },
            //       child: Icon(
            //         CupertinoIcons.line_horizontal_3_decrease,
            //         color: kBrandColor,
            //       ),
            //     ),
            //   ),
            // ],
          ),
          body: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 32.h),
                  ),
                  Collection(
                    func: controller.fetchApartments(),
                    header: "Вам понравилось",
                  ),
                  Collection(
                    func: controller.fetchApartments(),
                    header: "Специально для Вас",
                  ),
                  Collection(
                    func: controller.fetchApartments(),
                    header: "Вы часто посещаете",
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
