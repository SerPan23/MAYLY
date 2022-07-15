import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mayly_client/constants.dart';
import 'package:mayly_client/models/ApartmentModel.dart';
import 'package:mayly_client/pages/ApartmentPage.dart';

class ApartmentBloc extends StatelessWidget {
  const ApartmentBloc({Key? key, required this.apartment}) : super(key: key);
  final Apartment apartment;
  @override
  Widget build(BuildContext context) {
    final CarouselController _controller = CarouselController();
    int _current = 0;
    return GetBuilder<ApartmentBloclController>(
      init: ApartmentBloclController(),
      builder: (controller) {
        return Container(
          width: double.infinity,
          height: 350.h,
          margin: EdgeInsets.only(
            left: 19.w,
            right: 19.w,
            bottom: 35.h,
          ),
          child: OpenContainer(
            tappable: false,
            closedShape: const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(
                Radius.circular(0),
              ),
            ),
            closedColor: Colors.white,
            closedElevation: 0,
            openElevation: 0,
            openColor: Colors.white,
            transitionType: ContainerTransitionType.fadeThrough,
            transitionDuration: const Duration(milliseconds: 500),
            openBuilder: (context, _) => ApartmentPage(apartment: apartment),
            closedBuilder: (context, action) => Material(
              color: Colors.transparent,
              child: InkWell(
                onTap: action,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 20.h,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: 20.h,
                            child: StarRating(
                              rating: apartment.raiting,
                            ),
                          ),
                          Container(
                            height: 20.h,
                            child: Text(
                              "от ${apartment.cost}/сут",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 240.h,
                      child: Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              // color: Colors.grey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(8.r)),
                            ),
                            child: CarouselSlider(
                              options: CarouselOptions(
                                height: 240.0,
                                viewportFraction: 1,
                                onPageChanged: (index, reason) {
                                  _current = index;
                                  controller.update();
                                },
                              ),
                              items: apartment.images
                                  .map(
                                    (item) => Container(
                                      width: double.infinity,
                                      child: Center(
                                        child: Image.network(
                                          item,
                                          fit: BoxFit.cover,
                                          height: 240,
                                          width: double.infinity,
                                        ),
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                          ),
                          Positioned.fill(
                            child: Align(
                              alignment: Alignment.bottomCenter,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: apartment.images.asMap().entries.map(
                                  (entry) {
                                    return Container(
                                      width: _current == entry.key ? 8.r : 7.r,
                                      height: _current == entry.key ? 8.r : 7.r,
                                      margin: EdgeInsets.symmetric(
                                          vertical: 20.h, horizontal: 3.w),
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        color: _current == entry.key
                                            ? Colors.white
                                            : Colors.white.withAlpha(100),
                                      ),
                                    );
                                  },
                                ).toList(),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      height: 90.h,
                      width: double.infinity,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            apartment.title,
                            style: TextStyle(
                              fontSize: 16.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            apartment.address.toString(),
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            "${controller.getDifferenceInDays(apartment.publicationDate)} дней назад",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                              color: kTextAltColor,
                            ),
                          ),
                        ],
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

class StarRating extends StatelessWidget {
  final double rating;

  StarRating({this.rating = .0});

  Widget buildStar(BuildContext context, int index) {
    Icon icon;
    if (index >= rating) {
      icon = Icon(
        // CupertinoIcons.star_fill,
        // color: kTextAltColor,
        CupertinoIcons.star,
        color: kBrandColor,
        size: 17.r,
      );
    } else if (index > rating - 1 && index < rating) {
      icon = Icon(
        CupertinoIcons.star_lefthalf_fill,
        color: kBrandColor,
        size: 17.r,
      );
    } else {
      icon = Icon(
        CupertinoIcons.star_fill,
        color: kBrandColor,
        size: 17.r,
      );
    }
    return icon;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(
        5,
        (index) => buildStar(context, index),
      ),
    );
  }
}

class ApartmentBloclController extends GetxController {
  String getDifferenceInDays(dynamic date) {
    date = date.split('.');
    DateTime dateTimeCreatedAt =
        DateTime.parse('${date[2]}-${date[1]}-${date[0]}');
    DateTime dateTimeNow = DateTime.now();
    final differenceInDays = dateTimeNow.difference(dateTimeCreatedAt).inDays;
    return differenceInDays.toString();
  }
}
