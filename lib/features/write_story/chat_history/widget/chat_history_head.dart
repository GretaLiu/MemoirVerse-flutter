import 'package:date_format/date_format.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/components/back.dart';
import 'package:memoirverse/core/services/chatgpt_prompt_service.dart';
import 'package:memoirverse/features/write_story/chat_history/widget/delete_chatHistory_dialog.dart';
import 'package:memoirverse/services/AIRecordService.dart';
import 'package:provider/provider.dart';

class ChatHistoryHeadWidget extends StatelessWidget {
  const ChatHistoryHeadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: EdgeInsets.fromLTRB(11.0.w, 3.0.h, 11.0.w, 0.h),
        child: Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
          BackWidget(),
          Expanded(
            child: Text(
              context.watch<ChatGPTPromptService>().topic,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF3D6446),
                fontSize: 20.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0.04,
                letterSpacing: -0.41,
              ),
            ),
          ),
          GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    return UnconstrainedBox(
                        constrainedAxis: Axis.vertical,
                        child: SizedBox(
                            width: 348.w,
                            height: 212.h,
                            child: // DeleteChathistoryDialog()
                                Dialog(
                                    insetPadding: EdgeInsets.zero,
                                    shape: RoundedRectangleBorder(
                                      side: BorderSide(
                                          width: 1.w, color: Color(0x7FC8C7AC)),
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    elevation: 5.0,
                                    backgroundColor: Color(0xFFFFFFF4),
                                    child: DeleteChathistoryDialog())));
                  },
                );
              },
              child: Container(
                  width: 34.w,
                  height: 34.h,
                  decoration: const ShapeDecoration(
                    color: Color(0x7FE04F5F),
                    shape: OvalBorder(),
                  ),
                  child: Padding(
                      padding: EdgeInsets.all(8.w),
                      child: Container(
                        width: 22.w,
                        height: 22.h,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/delete.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      )))),
        ]));
  }
}
