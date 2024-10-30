import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/core/hive/hive_story_model.dart';
import 'package:memoirverse/core/services/db_service.dart';
import 'package:memoirverse/features/portfolio/library/widget/story_cover.dart';
import 'package:provider/provider.dart';

class LibraryWidget extends StatelessWidget {
  const LibraryWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      padding: EdgeInsets.all(2.h),
      itemBuilder: (BuildContext context, int index) {
        return buildStory(context, index); //每个item的布局
      },
      itemCount: context.watch<LocalDBService>().storyHistory.length,
    );
  }

  Widget buildStory(BuildContext context, int index) {
    var storyHistory = context.watch<LocalDBService>().storyHistory;
    HiveStoryModel story = storyHistory.values.toList()[index];
    //var promptId = prompt.keys.toList()[index];
    // String content = story.paragraph[0];
    // String title = story.title;
    return Padding(
        padding:
            EdgeInsets.only(left: 14.0.w, top: 14.h, bottom: 14.h, right: 14.w),
        child: StoryCoverWidget(story: story));
  }
}
