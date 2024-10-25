import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:memoirverse/features/write_story/chat_history/widget/chat_history_bottom.dart';
import 'package:memoirverse/features/write_story/chat_history/widget/chat_history_body.dart';
import 'package:memoirverse/features/write_story/chat_history/widget/chat_history_head.dart';
import 'package:memoirverse/features/write_story/chat_history/widget/chat_history_time.dart';

class ChatHistoryPage extends StatelessWidget {
  const ChatHistoryPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: 390.w,
            height: 844.h,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage("assets/images/chat_background.png"),
                fit: BoxFit.fill,
              ),
            ),
            child: Column(children: [
              SizedBox(height: 31.h),
              const ChatHistoryHeadWidget(),
              SizedBox(height: 15.h),
              ChatHistoryTimeWidget(
                  time: formatDate(DateTime.now(),
                      [yyyy, '年', mm, '月', dd, '日', HH, ":", nn])),
              const ChatHistoryBodyWidget(),
              const ChatHistoryBottomWidget(),
              SizedBox(height: 36.h)
            ])));
  }
}
