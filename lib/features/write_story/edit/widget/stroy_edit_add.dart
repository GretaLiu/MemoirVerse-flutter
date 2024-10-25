import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoryEditAddWidget extends StatelessWidget {
  const StoryEditAddWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 112.w,
        height: 76.h,
        decoration: ShapeDecoration(
          color: Colors.white,
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0x66807D7D)),
            borderRadius: BorderRadius.circular(15),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(children: [
          Text(
            '图片',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0.08,
              letterSpacing: -0.41,
            ),
          ),
          Container(
            width: 80.w,
            decoration: ShapeDecoration(
              shape: RoundedRectangleBorder(
                side: BorderSide(
                  width: 1.w,
                  strokeAlign: BorderSide.strokeAlignCenter,
                  color: Color(0x66807D7D),
                ),
              ),
            ),
          ),
          Text(
            '文字',
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0.08,
              letterSpacing: -0.41,
            ),
          )
        ]));
  }
}
