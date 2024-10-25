import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/features/AI_record/chat/chat.dart';
import 'package:memoirverse/features/AI_record/note/widget/note_bottom.dart';
import 'package:memoirverse/features/AI_record/note/widget/note_history.dart';
import 'package:memoirverse/features/AI_record/topic/topic.dart';
import 'package:memoirverse/services/AIRecordService.dart';
import 'package:provider/provider.dart';

class NotesWidget extends StatelessWidget {
  const NotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
        children: [Expanded(child: NoteHistoryWidget()), NoteBottomWidget()]);
  }
}
