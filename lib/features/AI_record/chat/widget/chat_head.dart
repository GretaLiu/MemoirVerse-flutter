import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/components/back.dart';
import 'package:memoirverse/core/services/chatgpt_prompt_service.dart';
import 'package:memoirverse/core/services/db_service.dart';
import 'package:memoirverse/features/AI_record/chat/widget/voice_setup.dart';
import 'package:memoirverse/features/write_story/chat_history/chat_history.dart';
import 'package:provider/provider.dart';

class ChatHeadWidget extends StatelessWidget {
  const ChatHeadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(11.0.w, 3.0.h, 11.0.w, 0.h),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          BackWidget(),
          SizedBox(width: 56.w),
          Expanded(
              child: Center(
                  child: CustomPopup(
                      arrowColor: Color(0xFFFCFDFA),
                      barrierColor: Colors.green.withOpacity(0.1),
                      backgroundColor: Color(0xFFFCFDFA),
                      content: const VoiceSetupWidget(),
                      child: Container(
                          width: 60.w,
                          height: 40.h,
                          decoration: ShapeDecoration(
                            color: Color(0x4C75A47F),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20),
                            ),
                          ),
                          child: Center(
                              child: Container(
                            width: 36.w,
                            height: 36.h,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/speak.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          )))))),
          GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                context.read<ChatGPTPromptService>().saveChatHistory();
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const ChatHistoryPage()),
                );
              },
              child: Container(
                  width: 88.w,
                  height: 40.h,
                  decoration: ShapeDecoration(
                    color: Colors.white.withOpacity(0.6000000238418579),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '下一步',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Color(0xFF3D6446),
                            fontSize: 18.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 1.3,
                            letterSpacing: 0.20,
                          ),
                        ),
                      ]))),
        ]));
  }
}
