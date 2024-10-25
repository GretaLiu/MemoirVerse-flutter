import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/components/back.dart';

class StoryEditHeadWidget extends StatelessWidget {
  const StoryEditHeadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(11.0.w, 3.0.h, 11.0.w, 0.h),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          BackWidget(),
          Expanded(
            child: Text(
              '编辑',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF3D6446),
                fontSize: 20.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0.04,
                letterSpacing: -0.41,
              ),
            ),
          ),
          Container(
            width: 22.w,
            height: 22.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/disk.png"),
                fit: BoxFit.fill,
              ),
            ),
          )
        ]));
  }
}
