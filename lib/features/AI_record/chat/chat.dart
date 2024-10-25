import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/core/services/chatgpt_prompt_service.dart';
import 'package:memoirverse/features/AI_record/chat/widget/chat_top.dart';
import 'package:memoirverse/features/AI_record/chat/widget/speak_box.dart';
import 'package:memoirverse/features/write_story/chat_history/chat_history.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatelessWidget {
  const ChatPage({super.key});

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
            SizedBox(height: 51.h),
            const ChatTopWidget(),
            Padding(
                padding: EdgeInsets.fromLTRB(37.w, 10.h, 37.w, 10.h),
                child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Expanded(
                          child: Container(
                        width: 92.w,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1.w,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0xE57F7C7C),
                            ),
                          ),
                        ),
                      )),
                      Text(
                        '下拉查看历史记录',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF7F7C7C),
                          fontSize: 16.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 1.3,
                          letterSpacing: -0.41,
                        ),
                      ),
                      Expanded(
                          child: Container(
                        width: 92.w,
                        decoration: ShapeDecoration(
                          shape: RoundedRectangleBorder(
                            side: BorderSide(
                              width: 1.w,
                              strokeAlign: BorderSide.strokeAlignCenter,
                              color: Color(0xFF7F7C7C),
                            ),
                          ),
                        ),
                      ))
                    ])),
            Expanded(
                child: new RefreshIndicator(
                    onRefresh: () {
                      return Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const ChatHistoryPage()),
                      );
                    },
                    child: ListView(padding: EdgeInsets.all(0), children: [
                      Padding(
                          padding: EdgeInsets.fromLTRB(33.w, 20.h, 33.w, 20.h),
                          child: Text(
                            context.watch<ChatGPTPromptService>().AI_ask,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 1.3,
                              letterSpacing: -0.41,
                            ),
                          )),
                    ]))),
            GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  showModalBottomSheet(
                    context: context,
                    //isScrollControlled: true,
                    builder: (BuildContext context) {
                      return Container(
                          height: 475.h,
                          decoration: const ShapeDecoration(
                            color: Color(0xFFFFFFF4),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(40),
                                topRight: Radius.circular(40),
                              ),
                            ),
                          ),
                          child: SpeakBoxWidget());
                    },
                  );
                },
                child: Container(
                    width: 152.w,
                    height: 72.h,
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.10000000149011612),
                      shape: RoundedRectangleBorder(
                        side: BorderSide(width: 2, color: Color(0xB275A47F)),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Container(
                            width: 32.w,
                            height: 32.h,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/mic.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            '回话',
                            style: TextStyle(
                              color: Color(0xFF3D6446),
                              fontSize: 28.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0,
                              letterSpacing: -0.41,
                            ),
                          )
                        ]))),
            SizedBox(height: 37.h)
          ])),
    );
  }
}
