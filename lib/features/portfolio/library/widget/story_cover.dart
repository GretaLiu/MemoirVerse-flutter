import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/core/hive/hive_story_model.dart';
import 'package:memoirverse/core/services/chatgpt_prompt_service.dart';
import 'package:memoirverse/features/portfolio/library/story_details/story_details.dart';
import 'package:provider/provider.dart';

class StoryCoverWidget extends StatelessWidget {
  StoryCoverWidget({super.key, required this.story});
  HiveStoryModel story;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 362.w,
        height: 152.h,
        decoration: ShapeDecoration(
          color: Color(0x7FE3EFC9),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Color(0xFF75A47F),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 10.h,
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
              child: Center(
                  child: Text(
                story.title,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF3D6446),
                  fontSize: 20.sp,
                  fontFamily: 'Inder',
                  fontWeight: FontWeight.w400,
                  height: 1.3,
                  letterSpacing: -0.41,
                ),
              )),
            ),
            GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  context.read<ChatGPTPromptService>().story = story;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            StoryDetailsPage(isDetails: true)),
                  );
                },
                child: Row(children: [
                  Text(
                    '查看 ',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.4000000059604645),
                      fontSize: 16.sp,
                      fontFamily: 'Inder',
                      fontWeight: FontWeight.w400,
                      height: 0.09,
                      letterSpacing: -0.41,
                    ),
                  ),
                  Container(
                    width: 12.w,
                    height: 12.32.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/previous.png"),
                        fit: BoxFit.fill,
                      ),
                      //border: Border.all(width: 1),
                    ),
                  ),
                  SizedBox(width: 5.w)
                ]))
          ]),
          SizedBox(height: 15.h),
          SizedBox(
            width: 313.w,
            height: 90.38.h,
            child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  context.read<ChatGPTPromptService>().story = story;
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            StoryDetailsPage(isDetails: true)),
                  );
                },
                child: Text(
                  story.paragraph[0],
                  overflow: TextOverflow.ellipsis,
                  maxLines: 4,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 1.3,
                    letterSpacing: -0.41,
                  ),
                )),
          )
        ]));
  }
}
