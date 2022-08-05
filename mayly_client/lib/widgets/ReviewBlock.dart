import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mayly_client/constants.dart';
import 'package:mayly_client/models/ReviewModel.dart';
import 'package:mayly_client/widgets/StarRatingBloc.dart';

class ReviewBlock extends StatelessWidget {
  ReviewBlock({
    Key? key,
    required this.index,
    required this.itemCount,
    required this.review,
  }) : super(key: key);
  final int index, itemCount;
  final Review review;

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
                  review.owner.image,
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
                        review.owner.login,
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                    Spacer(),
                    Container(
                      child: StarRating(
                        rating: review.raiting,
                      ),
                    ),
                    Spacer(),
                    Container(
                      child: Text(
                        review.publicationDate,
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
                    review.text,
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
