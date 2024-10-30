import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/core/services/chatgpt_prompt_service.dart';
import 'package:provider/provider.dart';

class StoryEditTitleWidget extends StatelessWidget {
  const StoryEditTitleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(top: 10.h, bottom: 10.h),
        child: Container(
            width: 360.w,
            height: 40.h,
            decoration: ShapeDecoration(
              color: Colors.white.withOpacity(0.5),
              shape: RoundedRectangleBorder(
                side: const BorderSide(width: 1, color: Color(0x66807D7D)),
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            child: Padding(
                padding: EdgeInsets.only(
                    left: 22.w, top: 6.h, bottom: 6.h, right: 6.w),
                child: Text(
                  context.watch<ChatGPTPromptService>().story!.title,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 1.3,
                    letterSpacing: -0.41,
                  ),
                ))));
  }
}
