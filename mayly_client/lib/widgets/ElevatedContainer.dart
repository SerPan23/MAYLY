import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mayly_client/constants.dart';

class ElevatedContainer extends StatelessWidget {
  final Widget child;
  final double width;
  final double height;
  final dynamic margin;
  final dynamic padding;
  final dynamic color;
  final dynamic shadowcolor;
  final BorderRadiusGeometry borderRadius;
  const ElevatedContainer(
      {Key? key,
      required this.child,
      required this.width,
      required this.height,
      this.margin,
      this.color,
      this.shadowcolor,
      required this.borderRadius,
      this.padding})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      margin: margin ?? const EdgeInsets.all(0),
      padding: padding ?? const EdgeInsets.all(0),
      decoration: BoxDecoration(
        color: color ?? Colors.white,
        boxShadow: [
          BoxShadow(
            color: shadowcolor ?? kShadowColor,
            spreadRadius: 1,
            blurRadius: 10,
            offset: const Offset(0, 0),
          ),
        ],
        borderRadius: borderRadius,
      ),
      child: child,
    );
  }
}
