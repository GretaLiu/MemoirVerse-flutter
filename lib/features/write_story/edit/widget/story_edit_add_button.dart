import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_picker/image_picker.dart';
import 'package:memoirverse/core/hive/hive_story_model.dart';
import 'package:memoirverse/core/services/chatgpt_prompt_service.dart';
import 'package:provider/provider.dart';

class StoryEditAddButton extends StatelessWidget {
  StoryEditAddButton({super.key, required this.index});
  int index;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        color: Colors.white,
        offset: Offset(100.0.w, 0.0),
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0x66807D7D)),
            borderRadius: BorderRadius.circular(15)),
        itemBuilder: (BuildContext context) {
          return <PopupMenuEntry<String>>[
            PopupMenuItem(
                value: "image",
                child: Center(
                    child: Text(
                  '图片',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0.08,
                    letterSpacing: -0.41,
                  ),
                ))),
            const PopupMenuDivider(),
            PopupMenuItem(
                value: "text",
                child: Center(
                    child: Text(
                  '文字',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0.08,
                    letterSpacing: -0.41,
                  ),
                )))
          ];
        },
        onSelected: (dynamic value) async {
          if (value == "image") {
            final ImagePicker picker = ImagePicker();
// Pick an image.
            final XFile? image =
                await picker.pickImage(source: ImageSource.gallery);
            if (image == null) return;
            HiveStoryModel? hiveStory =
                context.read<ChatGPTPromptService>().story;
            String image_path = image.path;
            context
                .read<ChatGPTPromptService>()
                .insertParagraph(index, image_path);
          } else if (value == "text") {
            context
                .read<ChatGPTPromptService>()
                .insertParagraph(index, "请写故事段落");
          }
        },
        icon: Container(
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
                ))));
  }
}
