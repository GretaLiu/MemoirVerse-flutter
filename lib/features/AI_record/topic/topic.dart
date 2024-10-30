import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/components/custom_button.dart';
import 'package:memoirverse/features/AI_record/topic/widget/topic_bottom.dart';
import 'package:memoirverse/features/AI_record/topic/widget/topic_cover.dart';
import 'package:memoirverse/features/AI_record/topic/widget/topic_info.dart';
import 'package:memoirverse/features/AI_record/topic/widget/topic_market.dart';
import 'package:memoirverse/features/AI_record/topic/widget/topic_question.dart';
import 'package:memoirverse/services/AIRecordService.dart';
import 'package:provider/provider.dart';

class TopicWidget extends StatelessWidget {
  const TopicWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(children: [
      Padding(
          padding: EdgeInsets.all(10.w),
          child: Column(children: [
            Expanded(
                child: GridView.count(
                    crossAxisCount: 2,
                    mainAxisSpacing: 8.0.w, // spacing between rows
                    crossAxisSpacing: 14.0.h, // spacing between columns
                    padding: EdgeInsets.all(8.0.w),
                    children: List.generate(
                      context
                          .watch<AIRecordService>()
                          .selected_topic_list
                          .length,
                      (index) {
                        String title = context
                            .read<AIRecordService>()
                            .selected_topic_list[index];
                        String image = context
                            .read<AIRecordService>()
                            .getTopicImageFromTitle(title);

                        return TopicCoverWidget(
                            image: image,
                            title: title,
                            onLongPress: () {
                              context.read<AIRecordService>().isDeleteTopic =
                                  true;
                            },
                            onPress: () {
                              context
                                  .read<AIRecordService>()
                                  .setSelectedTopicFormTitle(title);
                              context
                                  .read<AIRecordService>()
                                  .generateRandomQuestions();
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
                                                    width: 1.w,
                                                    color: Color(0x7FC8C7AC)),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              elevation: 5.0,
                                              backgroundColor:
                                                  Color(0xFFFFFFF4),
                                              child: TopicQuestionWidget(
                                                  title: title))));
                                },
                              );
                            });
                      },
                    ))),
            context.watch<AIRecordService>().isDeleteTopic
                ? Container()
                : const TopicBottomWidget(),
            SizedBox(height: 10.h),
          ])),
      context.watch<AIRecordService>().isDeleteTopic
          ? Positioned(
              bottom: 30,
              child: Container(
                  width: 390.w,
                  child: Center(
                    child: CustomButton(
                        width: 80.w,
                        height: 48.h,
                        color: Color(0xFF75A47F),
                        selected: true,
                        needBorder: true,
                        text: "完成",
                        fontColor: Colors.white,
                        fontSize: 18.sp,
                        fontWeight: FontWeight.w600,
                        onPress: () {
                          context.read<AIRecordService>().isDeleteTopic = false;
                        }),
                  )))
          : Container()
    ]);
  }
}
