import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mayly_client/constants.dart';
import 'package:mayly_client/controllers/FavouritesPageController.dart';
import 'package:mayly_client/models/ApartmentModel.dart';
import 'package:mayly_client/widgets/MiniApartmentBloc.dart';

class FavouritesPage extends StatelessWidget {
  const FavouritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FavouritesPageController>(
      init: FavouritesPageController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: kBgColor,
          appBar: AppBar(
            elevation: 0,
            centerTitle: true,
            toolbarHeight: 60.h,
            backgroundColor: Colors.white,
            systemOverlayStyle: kTransparentUiOverlay,
            title: Text(
              "Избранное",
              style: TextStyle(
                color: Colors.black,
                fontSize: 30.sp,
                fontWeight: FontWeight.w600,
              ),
            ),
            actions: [
              TextButton(
                style: ButtonStyle(
                  overlayColor: MaterialStateProperty.all(Colors.transparent),
                ),
                onPressed: () {},
                child: Text(
                  "Фильтры",
                  style: TextStyle(
                    fontSize: 16.sp,
                    color: kBrandColor,
                  ),
                ),
              ),
            ],
          ),
          body: Center(
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  Padding(
                    padding: EdgeInsets.only(top: 32.h),
                  ),
                  Collection(
                    func: controller.fetchApartments(),
                    header: "Вам понравилось",
                  ),
                  Collection(
                    func: controller.fetchApartments(),
                    header: "Специально для Вас",
                  ),
                  Collection(
                    func: controller.fetchApartments(),
                    header: "Вы часто посещаете",
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}

class Collection extends StatelessWidget {
  const Collection({Key? key, required this.func, required this.header})
      : super(key: key);
  final dynamic func;
  final String header;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 32.h, left: 16.w),
      child: SizedBox(
        // height: 222.h,
        height: 235.h,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              header,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            FutureBuilder<List<Apartment>>(
              future: func,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    height: 190.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) =>
                          MiniApartmentBloc(apartment: snapshot.data![index]),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
