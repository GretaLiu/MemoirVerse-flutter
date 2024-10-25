import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/core/hive/hive_chat_prompt_model.dart';
import 'package:memoirverse/core/services/chatgpt_prompt_service.dart';
import 'package:memoirverse/core/services/db_service.dart';
import 'package:memoirverse/features/write_story/widget/chat_bubble.dart';
import 'package:provider/provider.dart';

class ChatHistoryBodyWidget extends StatelessWidget {
  const ChatHistoryBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: context.read<ChatGPTPromptService>().chat.length,
        itemBuilder: (BuildContext context, int index) {
          return ChatBubble(
              text: "${context.read<ChatGPTPromptService>().chat[index].text}",
              sender:
                  "${context.read<ChatGPTPromptService>().chat[index].sender}");
        },
      ),
    );
  }
}
