import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, required this.text, required this.sender});
  final String text;
  final String sender;

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.only(left: 15.0.w, top: 13.h, right: 16.w),
        child: Align(
            alignment:
                sender == "user" ? Alignment.centerRight : Alignment.centerLeft,
            child:

                //  Container(
                //     width: 320.w,
                //     decoration: const ShapeDecoration(
                //       color: Color(0xFFFFFAF5),
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.only(
                //           topLeft: Radius.circular(15),
                //           topRight: Radius.circular(15),
                //           bottomRight: Radius.circular(15),
                //         ),
                //       ),
                //       shadows: [
                //         BoxShadow(
                //           color: Color(0x3F7F7C7C),
                //           blurRadius: 4,
                //           offset: Offset(0, 4),
                //           spreadRadius: 0,
                //         )
                //       ],
                //     ),
                //     child: Padding(
                //         padding: EdgeInsets.fromLTRB(15.0.w, 7.h, 7.w, 25.h),
                //         child: SizedBox(
                //           width: 297.w,
                //           child: Text(
                //             '你好！很高兴和你聊天。我听说你的童年时期充满了性情林立的温暖故事，我很感兴趣。能和我分享一些你童年时期与邻里之前发生的有趣的故事吗？',
                //             style: TextStyle(
                //               color: Colors.black,
                //               fontSize: 18.sp,
                //               fontFamily: 'Inter',
                //               fontWeight: FontWeight.w400,
                //               height: 1.3,
                //               letterSpacing: -0.41,
                //             ),
                //           ),
                //         )))
                Container(
                    width: 320.w,
                    decoration: ShapeDecoration(
                      color: sender == "user"
                          ? Color(0xFFF6EADD)
                          : Color(0xFFFFFAF5),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topLeft: const Radius.circular(15),
                          topRight: const Radius.circular(15),
                          bottomLeft: sender == "user"
                              ? const Radius.circular(15)
                              : Radius.zero,
                          bottomRight: sender == "user"
                              ? Radius.zero
                              : const Radius.circular(15),
                        ),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x3F7F7C7C),
                          blurRadius: 4,
                          offset: Offset(0, 4),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Padding(
                        padding: EdgeInsets.fromLTRB(15.0.w, 7.h, 7.w, 15.h),
                        child: SizedBox(
                          width: 297.w,
                          child: Text(
                            text,
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 18.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 1.3,
                              letterSpacing: -0.41,
                            ),
                          ),
                        )))));
  }
}
