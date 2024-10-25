import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/features/portfolio/library/widget/story_cover.dart';

class LibraryWidget extends StatelessWidget {
  const LibraryWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        padding: EdgeInsets.all(2.h),
        itemBuilder: (BuildContext context, int index) {
          return buildStory(context, index); //每个item的布局
        },
        itemCount: 3);
  }

  Widget buildStory(BuildContext context, int index) {
    return Padding(
        padding:
            EdgeInsets.only(left: 14.0.w, top: 14.h, bottom: 14.h, right: 14.w),
        child: const StoryCoverWidget());
  }
}
