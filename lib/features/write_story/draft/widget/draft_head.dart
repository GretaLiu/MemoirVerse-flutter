import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/components/back.dart';
import 'package:memoirverse/core/services/chatgpt_prompt_service.dart';
import 'package:provider/provider.dart';

class DraftHeadWidget extends StatelessWidget {
  const DraftHeadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(11.0.w, 3.0.h, 11.0.w, 0.h),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          BackWidget(),
          Expanded(
            child: Text(
              'AI 创作',
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
          GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                context
                    .read<ChatGPTPromptService>()
                    .sendGenerateSummaryPrompt();
              },
              child: Container(
                  width: 52.w,
                  height: 36.h,
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.800000011920929),
                    shape: RoundedRectangleBorder(
                      side:
                          const BorderSide(width: 1, color: Color(0xFF75A47F)),
                      borderRadius: BorderRadius.circular(30),
                    ),
                    shadows: [
                      BoxShadow(
                        color: Color(0x3F7F7C7C),
                        blurRadius: 2.r,
                        offset: Offset(0, 2),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Center(
                      child: Container(
                    width: 24.w,
                    height: 24.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/refresh.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  )))),
        ]));
  }
}
