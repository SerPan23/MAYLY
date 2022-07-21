import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mayly_client/constants.dart';

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
