import 'package:animations/animations.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:mayly_client/constants.dart';
import 'package:mayly_client/models/ApartmentModel.dart';
import 'package:mayly_client/pages/ApartmentPage.dart';

class MiniApartmentBloc extends StatelessWidget {
  const MiniApartmentBloc({Key? key, required this.apartment})
      : super(key: key);
  final Apartment apartment;
  @override
  Widget build(BuildContext context) {
    return Container(
      // width: 110.w,
      // height: 177.h,
      width: 140.w,
      height: 190.h,
      margin: EdgeInsets.only(
        right: 16.w,
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
                Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      apartment.title,
                      style: TextStyle(
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w400,
                      ),
                      overflow: TextOverflow.clip,
                      maxLines: 2,
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
                        "от ${apartment.cost}/сут",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
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