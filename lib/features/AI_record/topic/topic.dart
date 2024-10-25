import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
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
    return Padding(
        padding: EdgeInsets.all(10.w),
        child: Column(children: [
          Expanded(
              child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.0.w, // spacing between rows
                  crossAxisSpacing: 14.0.h, // spacing between columns
                  padding: EdgeInsets.all(8.0.w),
                  children: List.generate(
                    6,
                    (index) {
                      String image = context
                          .read<AIRecordService>()
                          .topic_list[index]["image"];
                      String title = context
                          .read<AIRecordService>()
                          .topic_list[index]["title"];

                      return TopicCoverWidget(
                          image: image,
                          title: title,
                          onPress: () {
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
                                            backgroundColor: Color(0xFFFFFFF4),
                                            child:
                                                //TopicInfoWidget(
                                                //  image: image, title: title)

                                                TopicQuestionWidget(
                                                    title: title))));
                              },
                            );
                          });
                    },
                  ))),
          const TopicBottomWidget(),
          SizedBox(height: 10.h),
        ]));
  }
}
