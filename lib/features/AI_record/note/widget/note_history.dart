import 'dart:io';

import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/core/hive/hive_chat_prompt_model.dart';
import 'package:memoirverse/core/services/chatgpt_prompt_service.dart';
import 'package:memoirverse/core/services/db_service.dart';
import 'package:memoirverse/features/write_story/chat_history/chat_history.dart';
import 'package:memoirverse/global/app_constants.dart';
import 'package:memoirverse/services/AIRecordService.dart';
import 'package:provider/provider.dart';

class NoteHistoryWidget extends StatelessWidget {
  const NoteHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      // 设置控制器
      child: Column(
        children: buildChatHistory(context), // 生成一个长列表
      ),
    );
  }

  List<Widget> buildChatHistory(BuildContext context) {
    List<Widget> noteHistory = [];
    var chatHistory = context.watch<LocalDBService>().chatHistory;
    for (int i = chatHistory.length - 1; i >= 0; i--) {
      HiveChatPromptModel chat = chatHistory.values.toList()[i];
      String chatId = chat.id;
      if (chat.topic == AppConstants.noTopic) {
        var note = Padding(
            padding: EdgeInsets.fromLTRB(7.0.w, 3.0.h, 16.0.w, 13.0.h),
            child:
                Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
              SizedBox(
                width: 156.w,
                height: 28.h,
                child: Text(
                  formatDate(
                      chat.date!, [yyyy, '年', mm, '月', dd, '日', HH, ":", nn]),
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: 'Inder',
                    fontWeight: FontWeight.w400,
                    height: 0,
                    letterSpacing: -0.41,
                  ),
                ),
              ),
              IntrinsicHeight(
                  child: Row(children: [
                VerticalDivider(
                  width: 38.w,
                  thickness: 2.w,
                  indent: 0.w,
                  endIndent: 0,
                  color: Color(0xFFF5DAD2),
                ),
                Expanded(
                    child: chat.summary.startsWith("/data")
                        ? Row(mainAxisSize: MainAxisSize.min, children: [
                            Container(
                              width: 120.w,
                              height: 120.h,
                              decoration: ShapeDecoration(
                                image: DecorationImage(
                                  image: FileImage(File(chat.summary)),
                                  fit: BoxFit.fill,
                                ),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                shadows: const [
                                  BoxShadow(
                                    color: Color(0xB2BACD92),
                                    blurRadius: 10,
                                    offset: Offset(2, 2),
                                    spreadRadius: 0,
                                  )
                                ],
                              ),
                            )
                          ])
                        : GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              context
                                  .read<ChatGPTPromptService>()
                                  .openChatHistory(chatId);
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const ChatHistoryPage()),
                              );
                            },
                            child: Container(
                                decoration: ShapeDecoration(
                                  color: Color(0xFFFCFFE0),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  shadows: [
                                    BoxShadow(
                                      color: Color(0xB2BACD92),
                                      blurRadius: 10.r,
                                      offset: Offset(2.w, 2.h),
                                      spreadRadius: 0,
                                    )
                                  ],
                                ),
                                child: Padding(
                                    padding: EdgeInsets.all(12.w),
                                    child: Text(
                                      chat.summary,
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontSize: 18.sp,
                                        fontFamily: 'Inder',
                                        fontWeight: FontWeight.w400,
                                        height: 0,
                                        letterSpacing: -0.41,
                                      ),
                                    )))))
              ]))
            ]));
        noteHistory.add(note);
      }
    }
    return noteHistory;
  }
}
