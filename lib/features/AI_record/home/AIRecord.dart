import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/features/AI_record/home/widget/AIRecord_head.dart';
import 'package:memoirverse/features/AI_record/note/notes.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/features/AI_record/topic/topic.dart';
import 'package:memoirverse/services/AIRecordService.dart';
import 'package:provider/provider.dart';

class AIRecordPage extends StatelessWidget {
  const AIRecordPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(color: Color(0xFFFFFFF4)),
            child: Column(children: [
              SizedBox(height: 50.h),
              const AIRecordHeadWidget(),
              Expanded(
                  child: context.watch<AIRecordService>().isRecord
                      ? const NotesWidget()
                      : const TopicWidget())
            ])));
  }
}
