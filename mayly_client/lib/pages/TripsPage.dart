import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mayly_client/constants.dart';
import 'package:mayly_client/controllers/TripsPageController.dart';
import 'package:mayly_client/models/ApartmentModel.dart';
import 'package:mayly_client/widgets/CollectionBlock.dart';
import 'package:mayly_client/widgets/MiniApartmentBloc.dart';

class TripsPage extends StatelessWidget {
  const TripsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<TripsPageController>(
      init: TripsPageController(),
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
              "Поездки",
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
                    header: "Текущие брони",
                  ),
                  Collection(
                    func: controller.fetchApartments(),
                    header: "Запланированные брони",
                  ),
                  Collection(
                    func: controller.fetchApartments(),
                    header: "Архив",
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
