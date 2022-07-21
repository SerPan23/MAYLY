import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mayly_client/constants.dart';
import 'package:mayly_client/controllers/ApartmentPageController.dart';
import 'package:mayly_client/models/ApartmentModel.dart';
import 'package:mayly_client/widgets/ElevatedContainer.dart';
import 'package:mayly_client/widgets/FullApartmentBloc.dart';
import 'package:mayly_client/widgets/ReviewBlock.dart';

class ApartmentPage extends StatelessWidget {
  const ApartmentPage({Key? key, required this.apartment}) : super(key: key);
  final Apartment apartment;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
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
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Padding(
                  padding: EdgeInsets.only(
                    left: 10.w,
                    right: 10.w,
                  ),
                  child: Column(
                    children: [
                      SizedBox(height: 16.h),
                      FullApartmentBloc(apartment: apartment),
                      ElevatedContainer(
                        width: double.infinity,
                        constraints: BoxConstraints(minHeight: 218.h),
                        margin: EdgeInsets.only(bottom: 35.h),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 15.w, top: 9.h, bottom: 9.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 6.h),
                                child: Text(
                                  "Свободные номера",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ElevatedContainer(
                        width: double.infinity,
                        constraints: BoxConstraints(minHeight: 50.h),
                        margin: EdgeInsets.only(bottom: 35.h),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 15.w, right: 15.w, top: 9.h, bottom: 9.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 6.h),
                                child: Text(
                                  "Удобства для Вас",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp),
                                ),
                              ),
                              Container(
                                constraints: BoxConstraints(minHeight: 40.h),
                                color: Colors.grey,
                                margin: EdgeInsets.only(bottom: 10.h),
                              ),
                              Container(
                                constraints: BoxConstraints(minHeight: 40.h),
                                color: Colors.grey,
                                margin: EdgeInsets.only(bottom: 10.h),
                              ),
                            ],
                          ),
                        ),
                      ),
                      ElevatedContainer(
                        width: double.infinity,
                        constraints: BoxConstraints(minHeight: 80.h),
                        margin: EdgeInsets.only(bottom: 35.h),
                        child: Padding(
                          padding: EdgeInsets.only(
                              left: 15.w, right: 15.w, top: 9.h, bottom: 9.h),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                margin: EdgeInsets.only(bottom: 6.h),
                                child: Text(
                                  "Отзывы",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 16.sp),
                                ),
                              ),
                              Container(
                                constraints:
                                    BoxConstraints(maxHeight: (86 * 3).h),
                                child: ListView.builder(
                                  physics: const BouncingScrollPhysics(),
                                  itemCount: 3,
                                  itemBuilder: (context, index) {
                                    return ReviewBlock(
                                        index: index, itemCount: 3);
                                  },
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
