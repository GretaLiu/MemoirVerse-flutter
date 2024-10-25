import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/features/portfolio/library/story_details/widget/story_details_body.dart';
import 'package:memoirverse/features/portfolio/library/story_details/widget/story_details_bottom.dart';
import 'package:memoirverse/features/portfolio/library/story_details/widget/story_details_head.dart';
import 'package:memoirverse/services/WriteStoryService.dart';
import 'package:provider/provider.dart';

class StoryDetailsPage extends StatelessWidget {
  const StoryDetailsPage({super.key});
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
            const StoryDetailsHeadWidget(),
            const Expanded(child: StoryDetailsBodyWidget()),
            SizedBox(height: 10.h),
          ])),
      Positioned(
          bottom: 30,
          child: SizedBox(
              width: 390.w, child: Center(child: StoryDetailsBottomWidget())))
    ]));
  }
}
