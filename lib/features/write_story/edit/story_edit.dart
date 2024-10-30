import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/core/hive/hive_story_model.dart';
import 'package:memoirverse/core/services/chatgpt_prompt_service.dart';
import 'package:memoirverse/core/services/db_service.dart';
import 'package:memoirverse/features/portfolio/library/story_details/story_details.dart';
import 'package:memoirverse/features/write_story/decorate/decorate.dart';
import 'package:memoirverse/features/write_story/edit/widget/story_edit_head.dart';
import 'package:memoirverse/features/write_story/edit/widget/story_edit_title.dart';
import 'package:memoirverse/features/write_story/edit/widget/stroy_edit_body.dart';
import 'package:memoirverse/components/forward_button.dart';
import 'package:provider/provider.dart';

class StoryEditPage extends StatelessWidget {
  const StoryEditPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: 390.w,
            //height: 844.h,
            clipBehavior: Clip.antiAlias,
            decoration: const BoxDecoration(color: Color(0xFFEEF2E2)),
            child: Column(children: [
              SizedBox(height: 31.h),
              const StoryEditHeadWidget(),
              SizedBox(height: 10.h),
              const StoryEditTitleWidget(),
              StoryEditBodyWidget(),
              ForwardButton(onPress: () {
                HiveStoryModel? hiveStory =
                    context.read<ChatGPTPromptService>().story;
                context.read<LocalDBService>().saveStory(hiveStory!);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => StoryDetailsPage(
                          isDetails: false)), //const DecoratePage()),
                );
              }),
              SizedBox(height: 27.h),
            ])));
  }
}
