import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/features/write_story/decorate/decorate.dart';
import 'package:memoirverse/features/write_story/edit/widget/story_edit_head.dart';
import 'package:memoirverse/features/write_story/edit/widget/stroy_edit_body.dart';
import 'package:memoirverse/components/forward_button.dart';

class StoryEditPage extends StatelessWidget {
  const StoryEditPage({super.key});

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
              const StoryEditHeadWidget(),
              SizedBox(height: 10.h),
              Expanded(
                  child: SingleChildScrollView(child: StoryEditBodyWidget())),
              ForwardButton(onPress: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const DecoratePage()),
                );
              }),
              SizedBox(height: 27.h),
            ])));
  }
}
