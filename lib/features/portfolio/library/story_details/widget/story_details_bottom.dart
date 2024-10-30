import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/components/custom_button.dart';
import 'package:memoirverse/core/hive/hive_story_model.dart';
import 'package:memoirverse/core/services/chatgpt_prompt_service.dart';
import 'package:memoirverse/core/services/db_service.dart';
import 'package:memoirverse/features/landing/landing_page.dart';
import 'package:memoirverse/features/portfolio/library/story_details/widget/story_details_share_button.dart';
import 'package:memoirverse/features/write_story/edit/story_edit.dart';
import 'package:memoirverse/features/write_story/edit/widget/story_edit_add_button.dart';
import 'package:memoirverse/services/HomeService.dart';
import 'package:memoirverse/services/WriteStoryService.dart';
import 'package:provider/provider.dart';

class StoryDetailsBottomWidget extends StatelessWidget {
  StoryDetailsBottomWidget(
      {super.key, required this.storyKey, required this.isDetails});
  GlobalKey storyKey;
  bool isDetails;
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomButton(
          width: 142.w,
          height: 40.h,
          color: Colors.white,
          selected: true,
          needBorder: true,
          text: isDetails ? "编辑" : "完成",
          fontColor: Color(0xFF75A47F),
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          onPress: () {
            if (isDetails) {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const StoryEditPage()),
              );
            } else {
              HiveStoryModel? hiveStory =
                  context.read<ChatGPTPromptService>().story;
              hiveStory!.backgroundIndex =
                  context.watch<WriteStoryService>().decorate_background_index;
              context.read<LocalDBService>().saveStory(hiveStory!);
              context.read<HomeService>().selectedIndex = 2;
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const LandingPage()),
              );
            }
          }),
      SizedBox(width: 15.w),

      StoryDetailsShareButton(
        storyKey: storyKey,
      ),
      // CustomButton(
      //     width: 142.w,
      //     height: 40.h,
      //     color: Color(0xFF75A47F),
      //     selected: true,
      //     needBorder: true,
      //     text: "分享",
      //     fontColor: Colors.white,
      //     fontSize: 18.sp,
      //     fontWeight: FontWeight.w600,
      //     onPress: () {
      //       showOverlay(context);
      //       // Navigator.push(
      //       //   context,
      //       //   MaterialPageRoute(builder: (context) => const EditPage()),
      //       // );
      //     }),
    ]);
  }
}
