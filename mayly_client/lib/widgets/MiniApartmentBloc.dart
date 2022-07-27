import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mayly_client/constants.dart';
import 'package:mayly_client/models/ApartmentModel.dart';
import 'package:mayly_client/pages/ApartmentPage.dart';
import 'package:mayly_client/widgets/ElevatedContainer.dart';
import 'package:mayly_client/widgets/StarRatingBloc.dart';

class MiniApartmentBloc extends StatelessWidget {
  const MiniApartmentBloc({Key? key, required this.apartment})
      : super(key: key);
  final Apartment apartment;
  @override
  Widget build(BuildContext context) {
    return ElevatedContainer(
      // width: 110.w,
      // height: 177.h,
      width: 150.w,
      height: 215.h,
      margin: EdgeInsets.only(
        right: 20.w,
        top: 10.h,
        bottom: 10.h,
      ),
      borderRadius: BorderRadius.all(Radius.circular(8.r)),
      child: OpenContainer(
        tappable: false,
        closedShape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.r)),
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
                  height: 110.h,
                  // decoration: BoxDecoration(
                  //   // color: Colors.grey[100],
                  //   borderRadius: BorderRadius.all(Radius.circular(8.r)),
                  // ),
                  child: Center(
                    child: Image.network(
                      apartment.images[0],
                      fit: BoxFit.cover,
                      height: 240,
                      width: double.infinity,
                    ),
                  ),
                ),
                SizedBox(height: 5.h),
                Container(
                  height: 76.h,
                  child: Padding(
                    padding: EdgeInsets.only(
                      left: 3.w,
                      right: 3.w,
                      bottom: 1.h,
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          child: Text(
                            apartment.title,
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                            overflow: TextOverflow.clip,
                            maxLines: 2,
                          ),
                        ),
                        Container(
                          height: 20.h,
                          child: StarRating(
                            rating: apartment.raiting,
                          ),
                        ),
                        Container(
                          height: 20.h,
                          child: Text(
                            "${apartment.cost}₽ ночь",
                            style: TextStyle(
                              fontSize: 14.sp,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
