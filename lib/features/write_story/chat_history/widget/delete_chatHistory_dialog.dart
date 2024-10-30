import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/components/close.dart';
import 'package:memoirverse/components/custom_button.dart';
import 'package:memoirverse/core/services/chatgpt_prompt_service.dart';
import 'package:memoirverse/features/landing/landing_page.dart';
import 'package:provider/provider.dart';

class DeleteChathistoryDialog extends StatelessWidget {
  const DeleteChathistoryDialog({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 348.w,
        height: 212.h,
        decoration: ShapeDecoration(
          color: Color(0xFFFFFFF4),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0x7FC8C7AC)),
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
          CloseWidget(),
          SizedBox(height: 30.h),
          Text(
            '您即将删除本组对话',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 22.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 1.3,
              letterSpacing: -0.41,
            ),
          ),
          SizedBox(height: 30.h),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            CustomButton(
                width: 80.w,
                height: 40.h,
                color: Colors.white,
                borderColor: Color(0xFFE04F5F),
                selected: true,
                needBorder: true,
                text: "取消",
                fontColor: Color(0xCCE04F5F),
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                onPress: () {
                  //context.read<AIRecordService>().isDeleteTopic = false;
                  Navigator.of(context).pop();
                }),
            SizedBox(width: 90.w),
            CustomButton(
                width: 80.w,
                height: 48.h,
                color: Color(0xCCE04F5F),
                selected: true,
                needBorder: true,
                text: "删除",
                fontColor: Colors.white,
                fontSize: 18.sp,
                fontWeight: FontWeight.w600,
                onPress: () {
                  context.read<ChatGPTPromptService>().deleteChatHistory();
                  Navigator.of(context).pop();
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LandingPage()),
                  );
                }),
          ])
        ]));
  }
}
