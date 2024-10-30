import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/core/hive/hive_story_model.dart';
import 'package:memoirverse/core/services/chatgpt_prompt_service.dart';
import 'package:memoirverse/features/portfolio/library/story_details/widget/decorate_background.dart';

import 'package:memoirverse/services/WriteStoryService.dart';
import 'package:provider/provider.dart';

class StoryDetailsBodyWidget extends StatelessWidget {
  StoryDetailsBodyWidget(
      {super.key, required this.storyKey, required this.isDetails});
  GlobalKey storyKey;
  bool isDetails;
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      SizedBox(height: 10.h),
      isDetails ? Container() : const DecorateBackgroundWidget(),
      SizedBox(height: 10.h),
      Expanded(
          child: SingleChildScrollView(
              child: RepaintBoundary(
                  key: storyKey,
                  child: Padding(
                      padding: EdgeInsets.all(10.w),
                      child: Container(
                        width: 356.w,
                        decoration: ShapeDecoration(
                          image: DecorationImage(
                            image: AssetImage(context
                                    .watch<WriteStoryService>()
                                    .decorate_background[
                                context
                                    .read<ChatGPTPromptService>()
                                    .story!
                                    .backgroundIndex]),
                            fit: BoxFit.fill,
                          ),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          shadows: const [
                            BoxShadow(
                              color: Color(0x7F7F7C7C),
                              blurRadius: 4,
                              offset: Offset(0, 2),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Padding(
                            padding: EdgeInsets.fromLTRB(
                                19.0.w, 10.0.h, 11.0.w, 10.h),
                            child:
                                Column(children: buildStoryContent(context))),
                      )))))
    ]);
  }

  List<Widget> buildStoryContent(BuildContext context) {
    List<Widget> content = [];
    HiveStoryModel? story = context.read<ChatGPTPromptService>().story;
    if (story == null) return [];
    content.add(Text(
      story.title,
      style: TextStyle(
        color: Colors.black,
        fontSize: 18.sp,
        fontFamily: 'Inter',
        fontWeight: FontWeight.w700,
        height: 1.3,
        letterSpacing: -0.41,
      ),
    ));
    content.add(SizedBox(height: 10.h));
    for (int i = 0; i < story.paragraph.length; i++) {
      String text = story.paragraph[i];
      if (text.startsWith("/data")) {
        content.add(Image.file(File(text)));
      } else {
        content.add(Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 16.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 1.3,
            letterSpacing: -0.41,
          ),
        ));
      }
    }
    return content;
  }
}
