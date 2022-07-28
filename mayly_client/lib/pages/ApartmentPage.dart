import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mayly_client/constants.dart';
import 'package:mayly_client/controllers/ApartmentPageController.dart';
import 'package:mayly_client/models/ApartmentModel.dart';
import 'package:mayly_client/models/FiltersModel.dart';
import 'package:mayly_client/widgets/Buttons.dart';
import 'package:mayly_client/widgets/ElevatedContainer.dart';
import 'package:mayly_client/widgets/FullApartmentBloc.dart';
import 'package:mayly_client/widgets/ReviewBlock.dart';

class ApartmentPage extends StatelessWidget {
  const ApartmentPage({Key? key, required this.apartment, this.filters})
      : super(key: key);
  final Apartment apartment;
  final Filters? filters;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<ApartmentPageController>(
      init: ApartmentPageController(apartment: apartment, filters: filters),
      builder: (controller) {
        return Scaffold(
          backgroundColor: kBgColor,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            toolbarHeight: 50.h,
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
            actionsIconTheme: IconThemeData(color: Colors.black, size: 25.r),
            actions: [
              GestureDetector(
                onTap: () {
                  print("Tap on share");
                },
                child: Container(
                  margin: EdgeInsets.only(right: 15.w),
                  child: Center(
                    child: Icon(
                      CupertinoIcons.share,
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  print("Tap on like");
                },
                child: Container(
                  margin: EdgeInsets.only(right: 15.w),
                  child: Center(
                    child: Icon(
                      CupertinoIcons.heart,
                    ),
                  ),
                ),
              ),
            ],
          ),
          body: SafeArea(
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
                    FullApartmentBloc(apartment: controller.apartment),
                    ElevatedContainer(
                      width: double.infinity,
                      constraints: BoxConstraints(minHeight: 50.h),
                      margin: EdgeInsets.only(bottom: 35.h),
                      child: Padding(
                        padding: EdgeInsets.only(
                            left: 5.w, right: 5.w, top: 10.h, bottom: 10.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              child: Text(
                                "Удобства для Вас",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 16.sp),
                              ),
                            ),
                            Convenience(
                              text: "первая береговая линия",
                              icon: CupertinoIcons.tree,
                            ),
                            Convenience(
                              text: "завтрак включен в стоимость",
                              icon: CupertinoIcons.add,
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
                            left: 5.w, right: 5.w, top: 9.h, bottom: 9.h),
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
          ),
          bottomNavigationBar: BottomBookBar(
            controller: controller,
          ),
        );
      },
    );
  }
}

class BottomBookBar extends StatelessWidget {
  const BottomBookBar({
    Key? key,
    required this.controller,
  }) : super(key: key);
  final ApartmentPageController controller;
  @override
  Widget build(BuildContext context) {
    return ElevatedContainer(
      height: 80.h,
      color: Colors.white,
      borderRadius: BorderRadius.all(Radius.zero),
      child: SafeArea(
        child: Padding(
          padding: EdgeInsets.only(left: 15.w, right: 15.w, top: 10.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "${controller.apartment.cost}₽ ночь",
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  GestureDetector(
                    onTap: () async {
                      final picked = await showDateRangePicker(
                        initialEntryMode: DatePickerEntryMode.calendarOnly,
                        locale: const Locale('ru'),
                        context: Get.context!,
                        lastDate: DateTime(2030),
                        firstDate: DateTime.now(),
                        currentDate: DateTime.now(),
                        initialDateRange: controller.makeDateRange(),
                      );
                      if (picked != null) {
                        // print(picked.start);
                        // print(picked.end);
                        // print(picked.toString());
                        controller.selectDate(picked);
                      }
                    },
                    child: Text(
                      controller.filters?.startDate == null
                          ? "даты не выбраны"
                          : "${controller.filters!.startDate} - ${controller.filters!.endDate}",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w500,
                        decoration: TextDecoration.underline,
                      ),
                    ),
                  ),
                ],
              ),
              BaseButton(
                height: 45.h,
                width: 150.w,
                text: Text(
                  "Забронировать",
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class Convenience extends StatelessWidget {
  const Convenience({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(minHeight: 40.h),
      margin: EdgeInsets.only(top: 10.h),
      child: Row(
        children: [
          Container(
            width: 35.r,
            height: 35.r,
            decoration: const BoxDecoration(
              shape: BoxShape.circle,
              color: kBrandColor,
            ),
            child: Center(
              child: Icon(
                icon,
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: 10.w),
          Text(
            text,
            style: TextStyle(
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
