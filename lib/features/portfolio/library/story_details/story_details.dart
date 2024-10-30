import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/core/services/chatgpt_prompt_service.dart';
import 'package:memoirverse/features/portfolio/library/story_details/widget/story_details_body.dart';
import 'package:memoirverse/features/portfolio/library/story_details/widget/story_details_bottom.dart';
import 'package:memoirverse/features/portfolio/library/story_details/widget/story_details_head.dart';
import 'package:provider/provider.dart';

class StoryDetailsPage extends StatelessWidget {
  StoryDetailsPage({super.key, required this.isDetails});
  final GlobalKey _storyKey = GlobalKey();
  bool isDetails;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(children: [
      Container(
          width: 390.w,
          height: 844.h,
          clipBehavior: Clip.antiAlias,
          decoration: const BoxDecoration(color: Color(0xFFEEF2E2)),
          child: Column(children: [
            SizedBox(height: 28.h),
            StoryDetailsHeadWidget(
                title: isDetails
                    ? context.watch<ChatGPTPromptService>().story!.topic
                    : "装饰"),
            Expanded(
                child: StoryDetailsBodyWidget(
                    storyKey: _storyKey, isDetails: isDetails)),
            SizedBox(height: 10.h),
          ])),
      Positioned(
          bottom: 30,
          child: SizedBox(
              width: 390.w,
              child: Center(
                  child: StoryDetailsBottomWidget(
                      storyKey: _storyKey, isDetails: isDetails))))
    ]));
  }
}
