import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/components/custom_button.dart';
import 'package:memoirverse/core/services/chatgpt_prompt_service.dart';
import 'package:memoirverse/features/AI_record/chat/chat.dart';
import 'package:memoirverse/features/write_story/draft/draft.dart';
import 'package:provider/provider.dart';

class ChatHistoryBottomWidget extends StatelessWidget {
  const ChatHistoryBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomButton(
          width: 160.w,
          height: 52.h,
          color: Colors.white,
          selected: true,
          needBorder: true,
          text: "接着聊",
          fontColor: Color(0xFF75A47F),
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          onPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChatPage()),
            );
          }),
      SizedBox(width: 15.w),
      CustomButton(
          width: 160.w,
          height: 52.h,
          color: Color(0xFF75A47F),
          selected: true,
          needBorder: true,
          text: "生成故事",
          fontColor: Colors.white,
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          onPress: () {
            context.read<ChatGPTPromptService>().draft.clear();
            context.read<ChatGPTPromptService>().draft_index = 0;
            context.read<ChatGPTPromptService>().sendGenerateDraftPrompt();
            context.read<ChatGPTPromptService>().sendGenerateDraftTitlePrompt();
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const DraftPage()),
            );
          }),
    ]);
  }
}
