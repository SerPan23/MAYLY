import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ElevatedContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final EdgeInsets margin;
  final Color color;
  final Color shadowcolor;
  final BorderRadiusGeometry borderRadius;
  const ElevatedContainer(
      {Key? key,
      required this.child,
      required this.width,
      required this.height,
      required this.margin,
      required this.color,
      required this.shadowcolor,
      required this.borderRadius})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin,
      decoration: BoxDecoration(
        color: color,
        boxShadow: [
          BoxShadow(
            color: shadowcolor,
            spreadRadius: 0,
            blurRadius: 66,
            offset: Offset(0, -2.h),
          ),
        ],
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }
}
