import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mayly_client/constants.dart';
import 'package:mayly_client/widgets/StarRatingBloc.dart';

class ReviewBlock extends StatelessWidget {
  ReviewBlock({
    Key? key,
    required this.index,
    required this.itemCount,
  }) : super(key: key);
  final int index, itemCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        minHeight: 77.h,
        maxWidth: double.infinity,
      ),
      // color: Colors.grey,
      // margin: EdgeInsets.only(bottom: 30.h),
      padding: EdgeInsets.all(2.r),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 50.r,
            width: 50.r,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(8.r)),
              color: Colors.grey[400],
            ),
            child: Center(
              child: ClipRRect(
                borderRadius: BorderRadius.all(Radius.circular(8.r)),
                child: Image.network(
                  "https://img.freepik.com/free-photo/pretty-smiling-joyfully-female-with-fair-hair-dressed-casually-looking-with-satisfaction_176420-15187.jpg?w=2000&t=st=1658422536~exp=1658423136~hmac=372ed1938ef0c90a0bc1bf1eea2458f2d090798866a3b54960d9b756b3aa2c66",
                  fit: BoxFit.cover,
                  height: 240,
                  width: double.infinity,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10.w,
          ),
          Expanded(
            child: Column(
              children: [
                Row(
                  children: [
                    Container(
                      child: Text(
                        "Username",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      child: StarRating(
                        rating: 4.2,
                      ),
                    ),
                    Spacer(),
                    Container(
                      child: Text(
                        "2 мин назад",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w400,
                          color: kTextAltColor,
                        ),
                      ),
                    ),
                  ],
                ),
                SizedBox(height: 10.h),
                Container(
                  child: Text(
                    "Все круто! Понравилось местоположение гостиницы!",
                  ),
                ),
                if (itemCount - 1 != index)
                  Container(
                    width: double.infinity,
                    height: 1.h,
                    color: Color.fromRGBO(232, 232, 232, 1),
                    margin: EdgeInsets.symmetric(vertical: 16.h),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
