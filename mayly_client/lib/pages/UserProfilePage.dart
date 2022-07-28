import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mayly_client/constants.dart';
import 'package:mayly_client/controllers/UserProfilePageController.dart';

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
            toolbarHeight: 0,
            backgroundColor: kBrandColor,
            systemOverlayStyle: kBrandColorUiOverlay,
          ),
          body: SafeArea(
            child: Column(
              children: [
                Container(
                  height: 246.h,
                  child: Stack(
                    children: [
                      Container(
                        color: kBrandColor,
                        height: 205,
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
