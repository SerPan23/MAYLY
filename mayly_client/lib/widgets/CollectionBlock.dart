import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:mayly_client/models/ApartmentModel.dart';
import 'package:mayly_client/widgets/MiniApartmentBloc.dart';

class Collection extends StatelessWidget {
  const Collection({Key? key, required this.func, required this.header})
      : super(key: key);
  final dynamic func;
  final String header;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(bottom: 32.h, left: 16.w),
      child: SizedBox(
        // height: 222.h,
        height: 250.h,
        width: double.infinity,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              header,
              style: TextStyle(
                fontSize: 24.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
            FutureBuilder<List<Apartment>>(
              future: func,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  return SizedBox(
                    height: 215.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      physics: const BouncingScrollPhysics(),
                      itemCount: snapshot.data?.length,
                      itemBuilder: (context, index) =>
                          MiniApartmentBloc(apartment: snapshot.data![index]),
                    ),
                  );
                } else {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
