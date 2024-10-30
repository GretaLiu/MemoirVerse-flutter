import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/components/custom_textfield.dart';
import 'package:memoirverse/core/services/chatgpt_prompt_service.dart';
import 'package:memoirverse/features/write_story/edit/widget/story_edit_add_button.dart';
import 'package:memoirverse/features/write_story/edit/widget/story_edit_dialog.dart';
import 'package:provider/provider.dart';

class StoryEditParagraphWidget extends StatelessWidget {
  StoryEditParagraphWidget({super.key, required this.index});
  int index;

  @override
  Widget build(BuildContext context) {
    String content =
        context.watch<ChatGPTPromptService>().story!.paragraph[index];
    String type = "text";
    if (content.startsWith("/data")) {
      type = "file";
    } else if (content.startsWith("http")) {
      type = "image";
    } else {
      type = "text";
    }
    return Container(
        width: 360.w,
        decoration: ShapeDecoration(
          color: Colors.white.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0x66807D7D)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Column(children: [
          Padding(
              padding: EdgeInsets.all(10.w),
              child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return UnconstrainedBox(
                          constrainedAxis: Axis.vertical,
                          child: SizedBox(
                              width: 370.w,
                              child: Dialog(
                                  insetPadding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1.w, color: Color(0x7FC8C7AC)),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  elevation: 5.0,
                                  backgroundColor: Color(0xFFFFFFF4),
                                  child: StoryEditDialog(
                                      index:
                                          index) //TopicQuestionWidget(title: title)
                                  )));
                    },
                  );
                },
                child: type == "text"
                    ? Text(
                        content,
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 1.3,
                          letterSpacing: -0.41,
                        ),
                      )
                    : Image.file(File(content)),
              )),
        ]));
  }
}
