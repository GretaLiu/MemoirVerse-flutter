import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatHistoryTimeWidget extends StatelessWidget {
  final String time;

  const ChatHistoryTimeWidget({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 13.w, top: 10.h),
        child: Align(
            alignment: Alignment.centerLeft,
            child: Container(
                width: 206.w,
                height: 36.h,
                decoration: const BoxDecoration(
                  color: Color(0x2675A47F),
                  border: Border(
                    left: BorderSide(width: 2, color: Color(0xFF75A47F)),
                    top: BorderSide(color: Color(0xFF75A47F)),
                    right: BorderSide(color: Color(0xFF75A47F)),
                    bottom: BorderSide(color: Color(0xFF75A47F)),
                  ),
                ),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Padding(
                        padding: EdgeInsets.only(left: 8.w),
                        child: Text(
                          time,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0.09,
                            letterSpacing: -0.41,
                          ),
                        ))))));
  }
}
