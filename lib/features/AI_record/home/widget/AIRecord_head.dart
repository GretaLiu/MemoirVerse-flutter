import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/services/AIRecordService.dart';
import 'package:provider/provider.dart';

class AIRecordHeadWidget extends StatelessWidget {
  const AIRecordHeadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 248.w,
        height: 48.h,
        decoration: ShapeDecoration(
          color: Color(0x66BACD92),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shadows: [
            BoxShadow(
              color: const Color(0x3F7F7C7C),
              blurRadius: 4.r,
              offset: Offset(0, 2.w),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                context.read<AIRecordService>().isRecord = true;
              },
              child: Container(
                  width: 96.w,
                  height: 44.h,
                  decoration: context.watch<AIRecordService>().isRecord
                      ? ShapeDecoration(
                          color: Color(0x99BACD92),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x3F7F7C7C),
                              blurRadius: 4.r,
                              offset: Offset(0, 2.w),
                              spreadRadius: 0,
                            )
                          ],
                        )
                      : null,
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '随手记',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF3D6446),
                            fontSize: 18.sp,
                            fontFamily: 'Inter',
                            fontWeight:
                                context.watch<AIRecordService>().isRecord
                                    ? FontWeight.w700
                                    : FontWeight.w400,
                            height: 0.07,
                            letterSpacing: -0.41,
                          ),
                        )
                      ]))),
          SizedBox(width: 10.w),
          GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                context.read<AIRecordService>().isRecord = false;
              },
              child: Container(
                  width: 100.w,
                  height: 44.h,
                  decoration: context.watch<AIRecordService>().isRecord
                      ? null
                      : ShapeDecoration(
                          color: Color(0x99BACD92),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0x3F7F7C7C),
                              blurRadius: 4.r,
                              offset: Offset(0, 2.w),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '主题写作',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF3D6446),
                            fontSize: 18.sp,
                            fontFamily: 'Inter',
                            fontWeight:
                                context.watch<AIRecordService>().isRecord
                                    ? FontWeight.w400
                                    : FontWeight.w700,
                            height: 0.07,
                            letterSpacing: -0.41,
                          ),
                        )
                      ]))),
        ]));
  }
}
