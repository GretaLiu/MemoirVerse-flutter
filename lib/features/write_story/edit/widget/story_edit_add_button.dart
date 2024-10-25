import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoryEditAddButtonWidget extends StatelessWidget {
  const StoryEditAddButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        color: Colors.white,
        offset: Offset(100.0.w, 0.0),
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0x66807D7D)),
            borderRadius: BorderRadius.circular(15)),
        itemBuilder: (BuildContext context) {
          return <PopupMenuEntry<String>>[
            PopupMenuItem(
                value: "text",
                child: Center(
                    child: Text(
                  '图片',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0.08,
                    letterSpacing: -0.41,
                  ),
                ))),
            const PopupMenuDivider(),
            PopupMenuItem(
                value: "text",
                child: Center(
                    child: Text(
                  '文字',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0.08,
                    letterSpacing: -0.41,
                  ),
                )))
          ];
        },
        onSelected: (dynamic value) {},
        icon: Container(
            width: 32.w,
            height: 32.h,
            decoration: ShapeDecoration(
              color: Colors.white.withOpacity(0.5),
              shape: const OvalBorder(
                side: BorderSide(width: 1, color: Color(0x66807D7D)),
              ),
            ),
            child: Padding(
                padding: EdgeInsets.all(8.w),
                child: Container(
                  width: 14.w,
                  height: 14.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/plus.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                ))));
  }
}
