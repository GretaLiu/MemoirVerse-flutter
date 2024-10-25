import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CloseWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          Navigator.of(context).pop();
        },
        child: Align(
            alignment: Alignment.topRight,
            child: Padding(
                padding: EdgeInsets.fromLTRB(15.0.w, 16.0.h, 16.0.w, 0.h),
                child: Container(
                  width: 14.w,
                  height: 14.11.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/close.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ))));
  }
}
