import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/components/back.dart';
import 'package:memoirverse/core/hive/hive_story_model.dart';
import 'package:memoirverse/core/services/chatgpt_prompt_service.dart';
import 'package:memoirverse/core/services/db_service.dart';
import 'package:provider/provider.dart';

class StoryEditHeadWidget extends StatelessWidget {
  const StoryEditHeadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(11.0.w, 3.0.h, 11.0.w, 0.h),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          BackWidget(),
          Expanded(
            child: Text(
              '编辑',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF3D6446),
                fontSize: 20.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w700,
                height: 0.04,
                letterSpacing: -0.41,
              ),
            ),
          ),
          GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                HiveStoryModel? hiveStory =
                    context.read<ChatGPTPromptService>().story;
                context.read<LocalDBService>().saveStory(hiveStory!);
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('保存故事成功'),
                  ),
                );
              },
              child: Container(
                width: 22.w,
                height: 22.h,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage("assets/images/disk.png"),
                    fit: BoxFit.fill,
                  ),
                ),
              ))
        ]));
  }
}
