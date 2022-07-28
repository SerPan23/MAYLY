import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mayly_client/constants.dart';
import 'package:mayly_client/controllers/SearchFiltersPageController.dart';
import 'package:mayly_client/controllers/SearchPageController.dart';
import 'package:mayly_client/pages/MainPage.dart';
import 'package:mayly_client/pages/SearchPage.dart';
import 'package:mayly_client/widgets/Buttons.dart';
import 'package:mayly_client/widgets/ElevatedContainer.dart';

class SearchFiltersPage extends StatelessWidget {
  final dynamic data;
  const SearchFiltersPage({Key? key, this.data}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
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
          init: SearchFiltersPageController(data: data),
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
                      onTap: () {
                        var placetmp;
                        Get.defaultDialog(
                          title: "Выберите город:",
                          content: AutocompleteBasicExample(c: controller),
                          confirm: CupertinoButton(
                            onPressed: () {
                              controller.updatePlace(controller.placetmp);
                              Get.back();
                            },
                            child: Text(
                              "Добавить",
                              style: TextStyle(
                                color: Color.fromRGBO(0, 183, 74, 1),
                                fontSize: 18.sp,
                              ),
                            ),
                          ),
                          cancel: CupertinoButton(
                            child: Text(
                              "Отмена",
                              style: TextStyle(
                                color: Color.fromRGBO(249, 49, 84, 1),
                                fontSize: 18.sp,
                              ),
                            ),
                            onPressed: () {
                              Get.back();
                            },
                          ),
                        );
                      },
                      borderRadius: BorderRadius.all(Radius.circular(30.r)),
                      child: Container(
                        padding: EdgeInsets.symmetric(
                            vertical: 5.h, horizontal: 15.w),
                        child: Row(
                          children: [
                            Text(
                              "Куда:",
                              style: TextStyle(
                                color: kTextAltColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Spacer(),
                            // if (controller.startDate != null)
                            //   Text("${controller.place}"),
                            // if (controller.startDate == null)
                            //   Text("искать везде"),

                            Text(controller.filters.place ?? "искать везде"),
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
                          initialDateRange: controller.makeDateRange(),
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
                            const Text(
                              "Когда: ",
                              style: TextStyle(
                                color: kTextAltColor,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            const Spacer(),
                            if (controller.filters.startDate != null)
                              Text(
                                  "${controller.filters.startDate} - ${controller.filters.endDate}"),
                            if (controller.filters.startDate == null)
                              const Text("любые даты")
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Spacer(),
                BaseButton(
                  width: 200.w,
                  height: 50.h,
                  action: () {
                    Get.delete<SearchPageController>();
                    // Get.offAll(
                    //   () => SearchPage(),
                    //   arguments: {
                    //     "is_filtering": true,
                    //     "filters": controller.filters,
                    //   },
                    // );
                    Get.offAll(
                      () => MainPage(),
                      arguments: {
                        "is_filtering": true,
                        "filters": controller.filters,
                      },
                    );
                  },
                  padding:
                      EdgeInsets.symmetric(vertical: 8.h, horizontal: 10.w),
                  color: kBrandColor,
                  text: Text(
                    "Искать",
                    style: TextStyle(color: Colors.white, fontSize: 20.sp),
                  ),
                ),
                SizedBox(
                  height: 10.h,
                )
              ],
            );
          },
        ),
      ),
    );
  }
}

class Utils {
  // Generates acceptable max height for Suggestion Box.
  static double maxBoxHeight({
    required int? sizeByItem,
    required int matchers,
  }) {
    final size = 60.0;

    // Set size by [sizeByItem].
    if (sizeByItem != null) return size * sizeByItem;

    // Set size by [matchers].
    return size * ((matchers > 3) ? 4 : matchers);
  }
}

class AutocompleteBasicExample extends StatelessWidget {
  const AutocompleteBasicExample({Key? key, required this.c}) : super(key: key);
  final SearchFiltersPageController c;
  @override
  Widget build(BuildContext context) {
    return RawAutocomplete(
      optionsBuilder: (TextEditingValue textEditingValue) async {
        if (textEditingValue.text == '') {
          return const Iterable<String>.empty();
        } else {
          List<String> matches =
              await c.fetchSuggestions(textEditingValue.text.toLowerCase());
          return matches;
        }
      },
      onSelected: (String selection) {
        print('You just selected $selection');
        c.placetmp = selection;
      },
      fieldViewBuilder: (BuildContext context,
          TextEditingController textEditingController,
          FocusNode focusNode,
          VoidCallback onFieldSubmitted) {
        return TextField(
          decoration: InputDecoration(
            border: UnderlineInputBorder(),
            label: Text("Город"),
          ),
          controller: textEditingController,
          focusNode: focusNode,
          onSubmitted: (String value) {},
        );
      },
      optionsViewBuilder: (BuildContext context,
          void Function(String) onSelected, Iterable<String> options) {
        return Align(
          alignment: Alignment.topLeft,
          child: Opacity(
            opacity: 1,
            child: ConstrainedBox(
              constraints: BoxConstraints(
                maxWidth: MediaQuery.of(context).size.width,
                maxHeight: Utils.maxBoxHeight(
                  matchers: options.length,
                  sizeByItem: 30,
                ),
              ),
              child: Material(
                color: Colors.white,
                elevation: 2,
                child: SingleChildScrollView(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: options.map(
                      (opt) {
                        return Container(
                          child: Material(
                            color: Colors.transparent,
                            elevation: 0,
                            child: InkWell(
                              onTap: () {
                                onSelected(opt);
                              },
                              child: Container(
                                width: 240.w,
                                padding: EdgeInsets.all(10),
                                child: Text(
                                  opt,
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    ).toList(),
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
