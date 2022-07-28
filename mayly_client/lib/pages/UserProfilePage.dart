import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mayly_client/constants.dart';
import 'package:mayly_client/controllers/UserProfilePageController.dart';
import 'package:mayly_client/widgets/ElevatedContainer.dart';

class UserProfilePage extends StatelessWidget {
  const UserProfilePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<UserProfilePageController>(
      init: UserProfilePageController(),
      builder: (context) {
        return Scaffold(
          backgroundColor: kBgColor,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            toolbarHeight: 0,
            backgroundColor: kBrandColor,
            systemOverlayStyle: kBrandColorUiOverlay,
            title: Text(
              "Профиль",
              style: TextStyle(
                color: Colors.white,
                fontSize: 30.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
          body: Stack(
            children: [
              SafeArea(
                child: Column(
                  children: [
                    Container(
                      height: 246.h,
                      child: Stack(
                        children: [
                          ElevatedContainer(
                            color: kBrandColor,
                            height: 205,
                            borderRadius: BorderRadius.all(Radius.zero),
                            child: Column(
                              children: [
                                Row(
                                  children: [
                                    IconButton(
                                      onPressed: () {
                                        Get.back();
                                      },
                                      icon: Icon(
                                        CupertinoIcons.back,
                                        size: 30.sp,
                                        color: Colors.white,
                                      ),
                                    ),
                                    Text(
                                      "Профиль",
                                      style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 30.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
