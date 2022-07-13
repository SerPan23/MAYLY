import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mayly_client/constants.dart';
import 'package:mayly_client/controllers/MainPageController.dart';
import 'package:mayly_client/widgets/BottomNavigation.dart';

import 'SearchPage.dart';

class MainPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<MainPageController>(
        init: MainPageController(),
        builder: (controller) {
          return Scaffold(
            backgroundColor: kBgColor,
            appBar: AppBar(
              elevation: 0,
              toolbarHeight: 0,
              backgroundColor: Colors.transparent,
              systemOverlayStyle: kWhiteUiOverlay,
            ),
            body: SafeArea(
              child: IndexedStack(
                index: controller.tabIndex,
                children: [
                  SearchPage(),
                  Container(
                    child: Center(child: Text("Избранное")),
                  ),
                  Container(
                    child: Center(child: Text("Поездки")),
                  ),
                  Container(
                    child: Center(child: Text("Сообщения")),
                  ),
                  Container(
                    child: Center(child: Text("Профиль")),
                  ),
                ],
              ),
            ),
            bottomNavigationBar: BottomNavigation(),
          );
        });
  }
}
