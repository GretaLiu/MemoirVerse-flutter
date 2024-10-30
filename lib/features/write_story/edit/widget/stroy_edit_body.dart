import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/core/hive/hive_story_model.dart';
import 'package:memoirverse/core/services/chatgpt_prompt_service.dart';

import 'package:memoirverse/features/write_story/edit/widget/story_edit_add_button.dart';
import 'package:memoirverse/features/write_story/edit/widget/story_edit_dialog.dart';
import 'package:memoirverse/features/write_story/edit/widget/story_edit_paragraph.dart';
import 'package:memoirverse/features/write_story/edit/widget/stroy_edit_add.dart';
import 'package:provider/provider.dart';

class StoryEditBodyWidget extends StatelessWidget {
  const StoryEditBodyWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount:
            context.watch<ChatGPTPromptService>().story!.paragraph.length,
        itemBuilder: (BuildContext context, int index) {
          return buildParagraph(context, index);
        },
      ),
    );
  }

  buildParagraph(BuildContext context, int index) {
    HiveStoryModel? hiveStory = context.watch<ChatGPTPromptService>().story;
    if (hiveStory == null) return Container();
    return Container(
        child: Column(children: [
      StoryEditParagraphWidget(index: index),
      //SizedBox(height: 6.h),
      StoryEditAddButton(index: index),
      //SizedBox(height: 6.h),
    ]));
  }
}
