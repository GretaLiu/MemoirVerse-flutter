import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class BackWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Container(
            width: 32.w,
            height: 32.h,
            decoration: ShapeDecoration(
              color: Colors.white.withOpacity(0.6000000238418579),
              shape: OvalBorder(),
            ),
            child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Container(
                  width: 16.w,
                  height: 16.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/back.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ))));
  }
}
