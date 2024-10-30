import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/components/custom_textfield.dart';
import 'package:memoirverse/core/services/chatgpt_prompt_service.dart';
import 'package:provider/provider.dart';

class StoryEditDialog extends StatelessWidget {
  StoryEditDialog({super.key, required this.index});
  int index;
  final textController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    String content =
        context.watch<ChatGPTPromptService>().story!.paragraph[index];
    textController.text = content;
    return Container(
        width: 368.w,
        height: 600.h,
        decoration: ShapeDecoration(
          color: const Color(0xFFFFFFF4),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0x7FC8C7AC)),
            borderRadius: BorderRadius.circular(15),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(children: [
          Padding(
              padding: EdgeInsets.all(10.w),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Container(
                            width: 80.w,
                            height: 40.h,
                            decoration: ShapeDecoration(
                              color: Colors.white,
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1, color: Color(0xFF75A47F)),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '取消',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF75A47F),
                                  fontSize: 18.sp,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0.07,
                                  letterSpacing: -0.41,
                                ),
                              ),
                            ))),
                    GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          context
                              .read<ChatGPTPromptService>()
                              .updateParagraph(index, textController.text);
                        },
                        child: Container(
                            width: 80.w,
                            height: 40.h,
                            decoration: ShapeDecoration(
                              color: Color(0xFF75A47F),
                              shape: RoundedRectangleBorder(
                                side: BorderSide(
                                    width: 1, color: Color(0xFF75A47F)),
                                borderRadius: BorderRadius.circular(30),
                              ),
                            ),
                            child: Center(
                              child: Text(
                                '完成',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 18.sp,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w700,
                                  height: 0.07,
                                  letterSpacing: -0.41,
                                ),
                              ),
                            )))
                  ])),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.all(10.w),
                  child: Container(
                      width: 366.w,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: SingleChildScrollView(
                          child: Padding(
                              padding: EdgeInsets.all(10.w),
                              child: content.startsWith("/data")
                                  ? Image.file(File(content))
                                  : CustomTextField(
                                      controller: textController,
                                      hintText: "",
                                      //prefixIcon: Icons.person_outline,
                                      background_color: Colors.white,
                                      inputType: TextInputType.name,
                                      fontColor: Colors.black)))))),
          SizedBox(height: 20.h),
          GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                context.read<ChatGPTPromptService>().deleteParagraph(index);
                Navigator.of(context).pop();
              },
              child: SizedBox(
                width: 104.w,
                height: 44.h,
                child: Text(
                  '删除本段',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Color(0xFFE04F5F),
                    fontSize: 18.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0.07,
                    letterSpacing: -0.41,
                  ),
                ),
              ))
        ]));
  }
}
