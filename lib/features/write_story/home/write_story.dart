import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/features/AI_record/home/widget/AIRecord_head.dart';
import 'package:memoirverse/features/AI_record/note/notes.dart';
import 'package:memoirverse/features/write_story/home/widget/chat_summary_history.dart';
import 'package:memoirverse/features/write_story/home/widget/write_story_head.dart';

class WriteStoryPage extends StatelessWidget {
  const WriteStoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: 390.w,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(color: Color(0xFFFFFFF4)),
            child: Column(children: [
              SizedBox(height: 50.h),
              const WriteStoryHeadWidget(),
              const Expanded(child: ChatSummaryHistoryWidget())
            ])));
  }
}
