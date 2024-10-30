import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/core/services/chatgpt_prompt_service.dart';
import 'package:memoirverse/features/AI_record/chat/chat.dart';
import 'package:memoirverse/features/user/welcome.dart';
import 'package:memoirverse/global/app_constants.dart';
import 'package:memoirverse/services/UserService.dart';
import 'package:provider/provider.dart';

class NoteBottomWidget extends StatelessWidget {
  const NoteBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
        width: 390.w,
        decoration: ShapeDecoration(
          shape: RoundedRectangleBorder(
            side: BorderSide(
              width: 2.h,
              strokeAlign: BorderSide.strokeAlignCenter,
              color: const Color(0xFFBACD92),
            ),
          ),
        ),
      ),
      Padding(
          padding: EdgeInsets.fromLTRB(10.0.w, 18.0.h, 10.0.w, 10.0.h),
          child: Row(children: [
            GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  context.read<UserService>().need_signin = true;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const WelcomePage()),
                  );
                },
                child: Container(
                    width: 124.w,
                    height: 52.h,
                    decoration: ShapeDecoration(
                      color: Color(0x7FBACD92),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Padding(
                        padding:
                            EdgeInsets.fromLTRB(12.0.w, 8.0.h, 12.0.w, 8.0.h),
                        child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Row(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Container(
                                      width: 22.w,
                                      height: 22.h,
                                      decoration: const BoxDecoration(
                                        image: DecorationImage(
                                          image: AssetImage(
                                              "assets/images/image.png"),
                                          fit: BoxFit.fill,
                                        ),
                                      ),
                                    ),
                                    Text(
                                      '上传照片',
                                      textAlign: TextAlign.center,
                                      style: TextStyle(
                                        color: Color(0xFF3D6446),
                                        fontSize: 18.sp,
                                        fontFamily: 'Inter',
                                        fontWeight: FontWeight.w400,
                                        height: 0.07,
                                        letterSpacing: -0.41,
                                      ),
                                    ),
                                  ])
                            ])))),
            SizedBox(width: 10.w),
            GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  context.read<ChatGPTPromptService>().startNewChat(
                      topic: AppConstants.noTopic, question: null);
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => const ChatPage()),
                  );
                },
                child: Container(
                    width: 124.w,
                    height: 52.h,
                    decoration: ShapeDecoration(
                      color: Color(0x7FBACD92),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Padding(
                        padding:
                            EdgeInsets.fromLTRB(12.0.w, 8.0.h, 12.0.w, 8.0.h),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 22.w,
                                    height: 22.h,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image:
                                            AssetImage("assets/images/mic.png"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  ),
                                  Text(
                                    '讲个故事',
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                      color: Color(0xFF3D6446),
                                      fontSize: 18.sp,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 0.07,
                                      letterSpacing: -0.41,
                                    ),
                                  ),
                                ])
                          ],
                        ))))
          ])),
      SizedBox(
        width: 348.w,
        height: 39.h,
        child: Text(
          '讲个故事记录一下吧～',
          style: TextStyle(
            color: Color(0xFF828282),
            fontSize: 20.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 0,
            letterSpacing: -0.41,
          ),
        ),
      ),
      SizedBox(height: 10.h)
    ]);
  }
}
