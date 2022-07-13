import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mayly_client/constants.dart';
import 'package:mayly_client/controllers/SearchFiltersPageController.dart';
import 'package:mayly_client/widgets/ElevatedContainer.dart';

class SearchFiltersPage extends StatelessWidget {
  const SearchFiltersPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBgColor,
      appBar: AppBar(
        elevation: 0,
        centerTitle: true,
        toolbarHeight: 40.h,
        backgroundColor: Colors.white,
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
        title: const Text(
          "Фильтры",
          style: TextStyle(
            color: Colors.black,
          ),
        ),
      ),
      body: SafeArea(
        child: GetBuilder<SearchFiltersPageController>(
          init: SearchFiltersPageController(),
          builder: (controller) {
            return Column(
              children: [
                ElevatedContainer(
                  height: 50.h,
                  margin:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                  width: double.infinity,
                  color: Colors.white,
                  shadowcolor: kShadowColor,
                  borderRadius: BorderRadius.all(Radius.circular(30.r)),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () {},
                      borderRadius: BorderRadius.all(Radius.circular(30.r)),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.h, horizontal: 15.w),
                        child: Row(
                          children: [
                            Text(
                              "Где искать:",
                              style: TextStyle(
                                color: kTextAltColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            Text("гибкий поиск"),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                ElevatedContainer(
                  height: 50.h,
                  margin:
                      EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
                  width: double.infinity,
                  color: Colors.white,
                  shadowcolor: kShadowColor,
                  borderRadius: BorderRadius.all(Radius.circular(30.r)),
                  child: Material(
                    color: Colors.transparent,
                    child: InkWell(
                      onTap: () async {
                        final picked = await showDateRangePicker(
                          initialEntryMode: DatePickerEntryMode.calendarOnly,
                          locale: const Locale('ru'),
                          context: Get.context!,
                          lastDate: DateTime(2030),
                          firstDate: DateTime.now(),
                          currentDate: DateTime.now(),
                        );
                        if (picked != null) {
                          // print(picked.start);
                          // print(picked.end);
                          // print(picked.toString());
                          controller.selectDate(picked);
                        }
                      },
                      borderRadius: BorderRadius.all(Radius.circular(30.r)),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.h, horizontal: 15.w),
                        child: Row(
                          children: [
                            if (controller.startDate != null)
                              Text(
                                "Когда: ",
                                style: TextStyle(
                                  color: kTextAltColor,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            if (controller.startDate != null) Spacer(),
                            if (controller.startDate != null)
                              Text(
                                  "${controller.startDate} - ${controller.endDate}"),
                            if (controller.startDate == null)
                              Text("Выберите даты")
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }
}
