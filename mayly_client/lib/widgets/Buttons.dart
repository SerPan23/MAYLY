import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mayly_client/constants.dart';
import 'package:mayly_client/widgets/ElevatedContainer.dart';

class BaseButton extends StatelessWidget {
  const BaseButton({
    Key? key,
    required this.width,
    required this.height,
    this.margin,
    this.color,
    required this.text,
    this.padding,
    this.action,
  }) : super(key: key);
  final double width;
  final double height;
  final dynamic margin;
  final dynamic padding;
  final Color? color;
  final Widget text;
  final dynamic action;
  @override
  Widget build(BuildContext context) {
    return ElevatedContainer(
      width: width,
      height: height,
      margin: margin,
      color: color ?? kBrandColor,
      shadowcolor: kShadowColor,
      borderRadius: BorderRadius.all(Radius.circular(30.r)),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          borderRadius: BorderRadius.all(Radius.circular(30.r)),
          onTap: action ?? () {},
          child: Container(
            padding: padding,
            child: Center(
              child: text,
            ),
          ),
        ),
      ),
    );
  }
}
