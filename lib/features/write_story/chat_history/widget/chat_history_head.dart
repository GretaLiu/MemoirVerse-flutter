import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/components/back.dart';
import 'package:memoirverse/services/AIRecordService.dart';
import 'package:provider/provider.dart';

class ChatHistoryHeadWidget extends StatelessWidget {
  const ChatHistoryHeadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(11.0.w, 3.0.h, 11.0.w, 0.h),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          BackWidget(),
          Expanded(
            child: Text(
              context.watch<AIRecordService>().selected_topic_title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF3D6446),
                fontSize: 20.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0.04,
                letterSpacing: -0.41,
              ),
            ),
          ),
          Container(
              width: 34.w,
              height: 34.h,
              decoration: const ShapeDecoration(
                color: Color(0x7FE04F5F),
                shape: OvalBorder(),
              ),
              child: Padding(
                  padding: EdgeInsets.all(8.w),
                  child: Container(
                    width: 22.w,
                    height: 22.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/delete.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ))),
        ]));
  }
}
