import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mayly_client/constants.dart';
import 'package:mayly_client/controllers/SearchPageController.dart';
import 'package:mayly_client/pages/SearchFiltersPage.dart';
import 'package:animations/animations.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchPageController>(
      init: SearchPageController(),
      builder: (controller) {
        return Container(
          child: Center(
            child: Column(
              children: [
                SearchBar(),
              ],
            ),
          ),
        );
      },
    );
  }
}

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      margin: EdgeInsets.symmetric(vertical: 20.h, horizontal: 13.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: kShadowColor,
            spreadRadius: 0,
            blurRadius: 66,
            offset: Offset(0, -2.h),
          ),
        ],
        borderRadius: BorderRadius.all(Radius.circular(30.r)),
      ),
      child: OpenContainer(
        tappable: false,
        closedColor: Colors.transparent,
        closedElevation: 0,
        openElevation: 0,
        openColor: Colors.transparent,
        transitionType: ContainerTransitionType.fade,
        transitionDuration: const Duration(milliseconds: 700),
        openBuilder: (context, _) => SearchFiltersPage(),
        closedBuilder: (context, action) => Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: action,
            // onTap: () {
            //   Get.to(SearchFiltersPage(), transition: Transition.zoom);
            // },
            borderRadius: BorderRadius.all(Radius.circular(30.r)),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
              child: Row(
                children: const [
                  Icon(CupertinoIcons.search),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
