import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mayly_client/constants.dart';
import 'package:mayly_client/models/ApartmentModel.dart';
import 'package:mayly_client/widgets/ElevatedContainer.dart';
import 'package:mayly_client/widgets/StarRatingBloc.dart';

class FullApartmentBloc extends StatelessWidget {
  const FullApartmentBloc({Key? key, required this.apartment})
      : super(key: key);
  final Apartment apartment;
  @override
  Widget build(BuildContext context) {
    final CarouselController _controller = CarouselController();
    int _current = 0;
    return GetBuilder<FullApartmentBloclController>(
      init: FullApartmentBloclController(),
      builder: (controller) {
        return ElevatedContainer(
          width: double.infinity,
          constraints: BoxConstraints(minHeight: 370.h),
          margin: EdgeInsets.only(
            // left: 10.w,
            // right: 10.w,
            bottom: 35.h,
          ),
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
          child: Padding(
            padding: EdgeInsets.only(
              // top: 10.h,
              bottom: 10.h,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  height: 240.h,
                  child: Stack(
                    children: [
                      Container(
                        decoration: BoxDecoration(
                          // color: Colors.grey,
                          borderRadius: BorderRadius.all(Radius.circular(8.r)),
                        ),
                        child: ClipRRect(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(8.r),
                            topRight: Radius.circular(8.r),
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
                  constraints: BoxConstraints(minHeight: 120.h),
                  padding: EdgeInsets.only(
                    right: 5.w,
                    left: 5.w,
                  ),
                  width: double.infinity,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.min,
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
                            // Container(
                            //   height: 20.h,
                            //   child: Text(
                            //     "от ${apartment.cost}/сут",
                            //     style: TextStyle(
                            //       fontSize: 16.sp,
                            //       fontWeight: FontWeight.w600,
                            //     ),
                            //   ),
                            // ),
                          ],
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Container(
                        width: double.infinity,
                        height: 1.h,
                        color: Color.fromRGBO(232, 232, 232, 1),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        apartment.title,
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      SizedBox(height: 6.h),
                      Text(
                        apartment.address.toString(),
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: kTextAltColor,
                        ),
                      ),
                      SizedBox(height: 8.h),
                      Text(
                        apartment.description,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}

class FullApartmentBloclController extends GetxController {
  String getDifferenceInDays(dynamic date) {
    date = date.split('.');
    DateTime dateTimeCreatedAt =
        DateTime.parse('${date[2]}-${date[1]}-${date[0]}');
    DateTime dateTimeNow = DateTime.now();
    final differenceInDays = dateTimeNow.difference(dateTimeCreatedAt).inDays;
    return differenceInDays.toString();
  }
}
