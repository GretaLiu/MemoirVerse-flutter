import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/components/search.dart';
import 'package:memoirverse/features/write_story/chat_history/chat_history.dart';
import 'package:memoirverse/services/WriteStoryService.dart';
import 'package:provider/provider.dart';

class ChatSummaryHistoryWidget extends StatelessWidget {
  const ChatSummaryHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(
        height: 20.h,
      ),
      SizedBox(
        width: 164.w,
        height: 20.h,
        child: Text(
          '聊天记录',
          textAlign: TextAlign.center,
          style: TextStyle(
            color: Colors.black,
            fontSize: 18.sp,
            fontFamily: 'Inder',
            fontWeight: FontWeight.w400,
            height: 0.07,
            letterSpacing: -0.41,
          ),
        ),
      ),
      SearchWidget(),
      Expanded(
          child: ListView.builder(
              padding: EdgeInsets.all(10.h),
              itemBuilder: (BuildContext context, int index) {
                return buildStory(context, index); //每个item的布局
              },
              itemCount: context
                  .watch<WriteStoryService>()
                  .chat_summary_history
                  .length))
    ]);
  }

  Widget buildStory(BuildContext context, int index) {
    return Padding(
        padding: EdgeInsets.fromLTRB(7.0.w, 3.0.h, 7.0.w, 13.0.h),
        child: GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const ChatHistoryPage()),
              );
            },
            child: Container(
                width: 362.w,
                decoration: const ShapeDecoration(
                  color: Color(0x7FF3E2CF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(15),
                      topRight: Radius.circular(15),
                      bottomRight: Radius.circular(15),
                    ),
                  ),
                ),
                child: Column(children: [
                  SizedBox(height: 15.h),
                  SizedBox(
                    width: 328.w,
                    height: 22.h,
                    child: Text(
                      context
                          .watch<WriteStoryService>()
                          .chat_summary_history[index]["time"],
                      style: TextStyle(
                        color: Color(0xFF7F7C7C),
                        fontSize: 14.sp,
                        fontFamily: 'Inder',
                        fontWeight: FontWeight.w400,
                        height: 0.11,
                        letterSpacing: -0.41,
                      ),
                    ),
                  ),
                  Center(
                      child: SizedBox(
                    width: 328.w,
                    child: Text(
                      context
                          .watch<WriteStoryService>()
                          .chat_summary_history[index]["summary"],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 16.sp,
                        fontFamily: 'Inder',
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                        letterSpacing: -0.41,
                      ),
                    ),
                  )),
                  SizedBox(height: 10.h)
                ]))));
  }
}
