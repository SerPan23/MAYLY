import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mayly_client/constants.dart';
import 'package:mayly_client/controllers/MyProfilePageController.dart';
import 'package:mayly_client/pages/UserProfilePage.dart';
import 'package:mayly_client/widgets/Buttons.dart';
import 'package:mayly_client/widgets/ElevatedContainer.dart';

class MyProfilePage extends StatelessWidget {
  const MyProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<MyProfilePageController>(
      init: MyProfilePageController(),
      builder: (context) {
        return Scaffold(
          backgroundColor: kBgColor,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            toolbarHeight: 50.h,
            backgroundColor: Colors.white,
            systemOverlayStyle: kTransparentUiOverlay,
            title: Text(
              "Мой профиль",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
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
                    UserInfoBlock(),
                    MenuBlock(
                      title: "Настройки аккаунта",
                      children: [
                        MenuItemBlock(
                          text: "Личная информация",
                          icon: CupertinoIcons.profile_circled,
                        ),
                        MenuItemBlock(
                          text: "Смена пароля",
                          icon: CupertinoIcons.lock,
                        ),
                      ],
                    ),
                    MenuBlock(
                      title: "Прием гостей",
                      children: [
                        MenuItemBlock(
                          text: "Сдать свое жильё",
                          icon: CupertinoIcons.home,
                        ),
                      ],
                    ),
                    MenuBlock(
                      title: "Поддержка",
                      children: [
                        MenuItemBlock(
                          text: "Написать нам",
                          icon: CupertinoIcons.mail,
                        ),
                      ],
                    ),
                    BaseButton(
                      width: double.infinity,
                      height: 40.h,
                      text: Text(
                        "Выйти",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 22.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}

class UserInfoBlock extends StatelessWidget {
  const UserInfoBlock({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedContainer(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: 50.h),
      margin: EdgeInsets.only(bottom: 35.h),
      child: Padding(
        padding:
            EdgeInsets.only(left: 10.w, right: 10.w, top: 20.h, bottom: 20.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CircleAvatar(
              radius: 25.r,
              backgroundColor: Colors.grey[400],
            ),
            SizedBox(height: 10.h),
            Container(
              child: Text(
                "Сергей",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 30.sp,
                ),
              ),
            ),
            SizedBox(height: 10.h),
            GestureDetector(
              onTap: () {
                Get.to(UserProfilePage());
              },
              child: Container(
                child: Text(
                  "Посмотреть профиль",
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16.sp,
                    decoration: TextDecoration.underline,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuBlock extends StatelessWidget {
  const MenuBlock({
    Key? key,
    required this.title,
    required this.children,
  }) : super(key: key);
  final String title;
  final List<Widget> children;
  @override
  Widget build(BuildContext context) {
    return ElevatedContainer(
      width: double.infinity,
      constraints: BoxConstraints(minHeight: 100.h),
      margin: EdgeInsets.only(bottom: 35.h),
      child: Padding(
        padding:
            EdgeInsets.only(left: 10.w, right: 10.w, top: 10.h, bottom: 10.h),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(bottom: 16.h),
              child: Text(
                title,
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
              ),
            ),
            for (var item in children) item
          ],
        ),
      ),
    );
  }
}

class MenuItemBlock extends StatelessWidget {
  MenuItemBlock({
    Key? key,
    required this.text,
    required this.icon,
  }) : super(key: key);
  final String text;
  final IconData icon;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          width: double.infinity,
          constraints: BoxConstraints(minHeight: 30.h),
          padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 5.h),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  Icon(icon),
                  SizedBox(width: 10.w),
                  Text(
                    text,
                    style:
                        TextStyle(fontWeight: FontWeight.bold, fontSize: 16.sp),
                  ),
                ],
              ),
              Icon(CupertinoIcons.chevron_right),
            ],
          ),
        ),
        Container(
          width: double.infinity,
          height: 1.h,
          color: Color.fromRGBO(232, 232, 232, 1),
          margin: EdgeInsets.only(top: 5.h, bottom: 10.h),
        ),
      ],
    );
  }
}
