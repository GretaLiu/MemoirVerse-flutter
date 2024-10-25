import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:memoirverse/features/write_story/edit/widget/story_edit_add_button.dart';
import 'package:memoirverse/features/write_story/edit/widget/story_edit_dialog.dart';
import 'package:memoirverse/features/write_story/edit/widget/stroy_edit_add.dart';

class StoryEditBodyWidget extends StatelessWidget {
  StoryEditBodyWidget({super.key});
  GlobalKey _globalKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 10),
      Container(
          width: 360.w,
          height: 32.h,
          decoration: ShapeDecoration(
            color: Colors.white.withOpacity(0.5),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0x66807D7D)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Padding(
              padding: EdgeInsets.all(12.w),
              child: Text(
                '童年好友：郝音素',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 16.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0.09,
                  letterSpacing: -0.41,
                ),
              ))),
      SizedBox(height: 9.h),
      Container(
        width: 360.w,
        decoration: ShapeDecoration(
          color: Colors.white.withOpacity(0.5),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0x66807D7D)),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Padding(
            padding: EdgeInsets.all(10.w),
            child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  showDialog(
                    context: context,
                    builder: (BuildContext context) {
                      return UnconstrainedBox(
                          constrainedAxis: Axis.vertical,
                          child: SizedBox(
                              width: 370.w,
                              child: Dialog(
                                  insetPadding: EdgeInsets.zero,
                                  shape: RoundedRectangleBorder(
                                    side: BorderSide(
                                        width: 1.w, color: Color(0x7FC8C7AC)),
                                    borderRadius: BorderRadius.circular(15),
                                  ),
                                  elevation: 5.0,
                                  backgroundColor: Color(0xFFFFFFF4),
                                  child:
                                      StoryEditDialog() //TopicQuestionWidget(title: title)
                                  )));
                    },
                  );
                },
                child: Text(
                  '在那个被雾气笼罩的童年时光里，郝音素是我不可分割的小伙伴。她胆小，学骑自行车这样的小事在她看来都是一场巨大的冒险。而我，早已在风中驰骋，却甘愿放慢脚步，成为她坚实的后盾。每当下雨，泥巴路变得泥泞不堪，我们便弃车步行，那是一段遥远却美好的上学路。我们的笑声在浓雾中回荡，眉毛上的霜花仿佛圣诞老人的胡须，让我们的世界充满了童话般的温暖。',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 1.3,
                    letterSpacing: -0.41,
                  ),
                ))),
      ),
      SizedBox(height: 9.h),
      StoryEditAddButtonWidget(),
      SizedBox(height: 9.h),
      Container(
          width: 360.w,
          decoration: ShapeDecoration(
            color: Colors.white.withOpacity(0.5),
            shape: RoundedRectangleBorder(
              side: const BorderSide(width: 1, color: Color(0x66807D7D)),
              borderRadius: BorderRadius.circular(10),
            ),
          ),
          child: Padding(
              padding: EdgeInsets.all(10.w),
              child: Text(
                '记得有一次，音素因病无法骑车，我翘课送她回家。那一次，她眼中闪烁着坚定的光芒，下定决心要学会骑车。终于，在初中时她成功了，虽然只是能骑而不能停，每次上下车都需要依靠台阶或是我的帮助。我总是骑得稍快，然后在前面等她，她那慌张中带着胜利的呼喊，至今回响在我耳边。',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 1.3,
                  letterSpacing: -0.41,
                ),
              ))),
      SizedBox(height: 9.h),
      Container(
          width: 32.w,
          height: 32.h,
          decoration: ShapeDecoration(
            color: Colors.white.withOpacity(0.5),
            shape: const OvalBorder(
              side: BorderSide(width: 1, color: Color(0x66807D7D)),
            ),
          ),
          child: Padding(
              padding: EdgeInsets.all(8.w),
              child: Container(
                width: 14.w,
                height: 14.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/plus.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ))),
      SizedBox(height: 9.h),
    ]);
  }

  void showOverlay(BuildContext context) {
    OverlayEntry overlayEntry;
    overlayEntry = OverlayEntry(
      builder: (context) => Positioned(
          top: 668.h, left: 203.w, child: const StoryEditAddWidget()),
    );

    Overlay.of(context).insert(overlayEntry);

    // Remove overlay entry after a delay
    Future.delayed(const Duration(seconds: 5), () {
      overlayEntry.remove();
    });
  }
}
