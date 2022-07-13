import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:mayly_client/constants.dart';
import 'package:mayly_client/controllers/MainPageController.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/cupertino.dart';

class BottomNavigation extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(
      builder: (controller) {
        return Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: kShadowColor,
                spreadRadius: 0,
                blurRadius: 6,
                offset: Offset(0, -2.h),
              ),
            ],
          ),
          child: SalomonBottomBar(
            itemPadding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 10.w),
            //margin: EdgeInsets.all(4),
            currentIndex: controller.tabIndex,
            onTap: (int index) {
              controller.changeTabIndex(index);
            },
            items: [
              SalomonBottomBarItem(
                icon: Icon(
                  CupertinoIcons.search,
                  size: 30.r,
                ),
                title: Text("Поиск"),
                selectedColor: Colors.purple,
              ),
              SalomonBottomBarItem(
                icon: Icon(
                  CupertinoIcons.heart,
                  size: 30.r,
                ),
                title: Text("Избранное"),
                selectedColor: Colors.pink,
              ),
              SalomonBottomBarItem(
                icon: Icon(
                  CupertinoIcons.car_detailed,
                  size: 30.r,
                ),
                title: Text("Поездки"),
                selectedColor: Colors.orange,
              ),
              SalomonBottomBarItem(
                icon: Icon(
                  CupertinoIcons.mail,
                  size: 30.r,
                ),
                title: Text("Сообщения"),
                selectedColor: Colors.blueAccent,
              ),
              SalomonBottomBarItem(
                icon: Icon(
                  CupertinoIcons.person,
                  size: 30.r,
                ),
                title: Text("Профиль"),
                selectedColor: Colors.teal,
              ),
            ],
          ),
        );
      },
    );
  }
}
