import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mayly_client/constants.dart';
import 'package:mayly_client/controllers/SearchPageController.dart';
import 'package:mayly_client/models/ApartmentModel.dart';
import 'package:mayly_client/pages/SearchFiltersPage.dart';
import 'package:animations/animations.dart';
import 'package:mayly_client/widgets/ApartmentBlock.dart';

class SearchPage extends StatelessWidget {
  const SearchPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<SearchPageController>(
      init: SearchPageController(),
      builder: (controller) {
        return Scaffold(
          backgroundColor: kBgColor,
          appBar: PreferredSize(
            preferredSize: Size.fromHeight(100.h),
            child: Container(
              decoration: BoxDecoration(
                color: Colors.white,
                boxShadow: [
                  BoxShadow(
                    color: kShadowColor,
                    spreadRadius: 0,
                    blurRadius: 6,
                    offset: Offset(0, 2.h),
                  ),
                ],
              ),
              child: Center(
                child: SearchBar(c: controller),
              ),
            ),
          ),
          body: SafeArea(
            child: Center(
              child: Column(
                children: [
                  Expanded(
                    child: FutureBuilder<List<Apartment>>(
                      future: controller.fetchApartments(),
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          return ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            padding: EdgeInsets.only(top: 35.h),
                            itemCount: snapshot.data?.length,
                            itemBuilder: (context, index) => ApartmentBloc(
                              apartment: snapshot.data![index],
                              filters: controller.filters,
                            ),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    ),
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

class SearchBar extends StatelessWidget {
  const SearchBar({
    Key? key,
    required this.c,
  }) : super(key: key);
  final SearchPageController c;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50.h,
      margin: EdgeInsets.only(top: 25.h, right: 13.w, left: 13.w),
      width: double.infinity,
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: const [
          BoxShadow(
            color: kShadowColor,
            spreadRadius: 0,
            blurRadius: 10,
            offset: Offset(0, 0),
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
        openBuilder: (context, _) => SearchFiltersPage(data: c.collectData()),
        closedBuilder: (context, action) => Material(
          color: Colors.transparent,
          child: InkWell(
            onTap: action,
            borderRadius: BorderRadius.all(Radius.circular(30.r)),
            child: Container(
              padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 15.w),
              child: Row(
                children: [
                  Icon(CupertinoIcons.search),
                  SizedBox(
                    width: 15.w,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        c.filters.place ?? "Куда?",
                        style: TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 18.sp),
                      ),
                      const Spacer(),
                      Row(
                        children: [
                          if (c.filters.place == null)
                            Text(
                              "искать везде",
                              style: TextStyle(
                                color: kTextAltColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp,
                              ),
                            ),
                          if (c.filters.place == null)
                            SizedBox(
                              width: 5.w,
                            ),
                          if (c.filters.startDate == null ||
                              c.filters.endDate == null)
                            Text(
                              "любые даты",
                              style: TextStyle(
                                color: kTextAltColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp,
                              ),
                            ),
                          if (c.filters.startDate != null ||
                              c.filters.endDate != null)
                            Text(
                              "${c.filters.startDate} - ${c.filters.endDate}",
                              style: TextStyle(
                                color: kTextAltColor,
                                fontWeight: FontWeight.bold,
                                fontSize: 12.sp,
                              ),
                            ),
                        ],
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
