import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SearchWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 316.w,
        height: 40.h,
        decoration: ShapeDecoration(
          color: Colors.white.withOpacity(0.699999988079071),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0xFFD9D9D9)),
            borderRadius: BorderRadius.circular(15),
          ),
        ),
        child: Align(
            alignment: Alignment.centerRight,
            child: Padding(
                padding: EdgeInsets.only(right: 10.w),
                child: Container(
                  width: 24.w,
                  height: 24.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/seach.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ))));
  }
}
