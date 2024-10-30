import 'package:flutter/material.dart';
import 'package:memoirverse/features/AI_record/note/widget/note_bottom.dart';
import 'package:memoirverse/features/AI_record/note/widget/note_history.dart';

class NotesWidget extends StatelessWidget {
  const NotesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
        children: [Expanded(child: NoteHistoryWidget()), NoteBottomWidget()]);
  }
}
