import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/components/custom_button.dart';
import 'package:memoirverse/features/portfolio/library/story_details/widget/story_details_share_button.dart';
import 'package:memoirverse/features/write_story/edit/story_edit.dart';
import 'package:memoirverse/features/write_story/edit/widget/story_edit_add_button.dart';

class StoryDetailsBottomWidget extends StatelessWidget {
  StoryDetailsBottomWidget({super.key});
  var _overlayController = OverlayPortalController();
  @override
  Widget build(BuildContext context) {
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      CustomButton(
          width: 142.w,
          height: 40.h,
          color: Colors.white,
          selected: true,
          needBorder: true,
          text: "编辑",
          fontColor: Color(0xFF75A47F),
          fontSize: 18.sp,
          fontWeight: FontWeight.w600,
          onPress: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => const StoryEditPage()),
            );
          }),
      SizedBox(width: 15.w),

      const StoryDetailsShareButton(),
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
