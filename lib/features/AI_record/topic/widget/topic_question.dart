import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/components/close.dart';
import 'package:memoirverse/core/services/chatgpt_prompt_service.dart';
import 'package:memoirverse/features/AI_record/chat/chat.dart';
import 'package:memoirverse/services/AIRecordService.dart';
import 'package:provider/provider.dart';

class TopicQuestionWidget extends StatelessWidget {
  TopicQuestionWidget({super.key, required this.title});
  String title;
  List<int> questions = [0, 1, 2];
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 368.w,
        height: 524.h,
        decoration: ShapeDecoration(
          color: const Color(0xFFFFFFF4),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1.w, color: Color(0x7FC8C7AC)),
            borderRadius: BorderRadius.circular(15),
          ),
          shadows: [
            BoxShadow(
              color: const Color(0x3F000000),
              blurRadius: 4.r,
              offset: Offset(0, 4.h),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(children: [
          CloseWidget(),
          SizedBox(
            width: 119.w,
            height: 36.28.h,
            child: Text(
              title,
              style: TextStyle(
                color: Color(0xFF3D6446),
                fontSize: 30.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0,
                letterSpacing: -0.41,
              ),
            ),
          ),
          SizedBox(height: 15.h),
          SizedBox(
            width: 332.w,
            height: 40.h,
            child: Text(
              '挑选一个您感兴趣的话题聊聊吧～',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF3D6446),
                fontSize: 20.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: -0.41,
              ),
            ),
          ),
          SizedBox(height: 10.h),
          Expanded(
              child: ListView.builder(
                  itemBuilder: (BuildContext context, int index) {
                    return buildQuestion(context, index); //每个item的布局
                  },
                  itemCount: 3)),
          GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                context.read<AIRecordService>().generateRandomQuestions();
              },
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 24.w,
                      height: 24.18.h,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/refresh.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 65.w,
                      height: 28.22.h,
                      child: Text(
                        '换一批',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF3D6446),
                          fontSize: 20.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 0,
                          letterSpacing: -0.41,
                        ),
                      ),
                    )
                  ])),
          SizedBox(height: 24.h)
        ]));
  }

  Widget buildQuestion(BuildContext context, int index) {
    String detail = "";
    Map? question = context.watch<AIRecordService>().random_questions[index];
    if (question == null)
      detail = "";
    else
      detail = question["detail"];
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          if (detail.isNotEmpty) {
            context
                .read<ChatGPTPromptService>()
                .startNewChat(topic: title, question: question);
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const ChatPage()),
            );
          }
        },
        child: Padding(
            padding: EdgeInsets.fromLTRB(15.0.w, 5.0.h, 17.0.w, 13.0.h),
            child: Container(
                width: 336.w,
                decoration: ShapeDecoration(
                  color: Color(0x99F3E2CF),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.r),
                  ),
                  shadows: [
                    BoxShadow(
                      color: Color(0x3F7F7C7C),
                      blurRadius: 10.r,
                      offset: Offset(-2.w, 2.h),
                      spreadRadius: 0,
                    )
                  ],
                ),
                child: Padding(
                    padding:
                        EdgeInsets.fromLTRB(14.0.w, 10.0.h, 10.0.w, 13.0.h),
                    child: SizedBox(
                        width: 288.w,
                        child: Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Expanded(
                                  child: Text(
                                detail,
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18.sp,
                                  fontFamily: 'Inder',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                  letterSpacing: -0.41,
                                ),
                              )),
                              SizedBox(width: 13.w),
                              Container(
                                width: 12.w,
                                height: 12.09.h,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/previous.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                              SizedBox(width: 8.w)
                            ]))))));
  }
}
