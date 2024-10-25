import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/features/write_story/edit/story_edit.dart';
import 'package:memoirverse/features/write_story/draft/widget/draft_body.dart';
import 'package:memoirverse/features/write_story/draft/widget/draft_head.dart';
import 'package:memoirverse/components/forward_button.dart';

class DraftPage extends StatelessWidget {
  const DraftPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            width: 390.w,
            height: 844.h,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(color: Color(0xFFEEF2E2)),
            child: Column(children: [
              SizedBox(height: 31.h),
              const DraftHeadWidget(),
              const Expanded(child: DraftBodyWidget()),
              ForwardButton(onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const StoryEditPage()),
                );
              }),
              SizedBox(height: 27.h),
            ])));
  }
}
