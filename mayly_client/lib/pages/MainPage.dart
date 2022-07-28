import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:mayly_client/constants.dart';
import 'package:mayly_client/controllers/MainPageController.dart';
import 'package:mayly_client/pages/FavouritesPage.dart';
import 'package:mayly_client/pages/TripsPage.dart';
import 'package:mayly_client/pages/UserProfilePage.dart';
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
            body: IndexedStack(
              index: controller.tabIndex,
              children: [
                SearchPage(),
                FavouritesPage(),
                TripsPage(),
                Container(
                  child: Center(child: Text("Сообщения")),
                ),
                UserProfilePage(),
              ],
            ),
            bottomNavigationBar: BottomNavigation(),
          );
        });
  }
}
