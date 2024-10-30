import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/components/close.dart';
import 'package:memoirverse/components/search.dart';
import 'package:memoirverse/features/AI_record/topic/widget/topic_cover.dart';
import 'package:memoirverse/features/AI_record/topic/widget/topic_info.dart';
import 'package:memoirverse/services/AIRecordService.dart';
import 'package:provider/provider.dart';

class TopicMarketWidget extends StatelessWidget {
  TopicMarketWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 368.w,
        height: 628.h,
        decoration: ShapeDecoration(
          color: Color(0xFFFFFFF4),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0x7FC8C7AC)),
            borderRadius: BorderRadius.circular(15),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(children: [
          CloseWidget(),
          Text(
            '主题市场',
            style: TextStyle(
              color: Color(0xFF3D6446),
              fontSize: 24.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w300,
              height: 0,
              letterSpacing: -0.41,
            ),
          ),
          Padding(
            padding: EdgeInsets.fromLTRB(26.w, 10.h, 26.w, 10.h),
            child: SearchWidget(),
          ),
          Expanded(
              child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8.0.w, // spacing between rows
                  crossAxisSpacing: 14.0.h, // spacing between columns
                  padding: EdgeInsets.all(8.0.w),
                  children: buildTopicMarket(context))),
          SizedBox(height: 20.h)
        ]));
  }

  List<Widget> buildTopicMarket(BuildContext context) {
    List<Widget> market = [];
    List<String> noSelectedTopics =
        context.watch<AIRecordService>().getNoSelected();
    for (int i = 0; i < noSelectedTopics.length; i++) {
      String title = noSelectedTopics[i];
      String image =
          context.read<AIRecordService>().getTopicImageFromTitle(title);
      String describe =
          context.read<AIRecordService>().getTopicDescribeFromTitle(title);
      Widget topicCover = TopicCoverWidget(
          image: image,
          title: title,
          onLongPress: () {},
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
                                  width: 1.w, color: Color(0x7FC8C7AC)),
                              borderRadius: BorderRadius.circular(15),
                            ),
                            elevation: 5.0,
                            backgroundColor: Color(0xFFFFFFF4),
                            child: TopicInfoWidget(
                                image: image, title: title, describe: describe)

                            //TopicQuestionWidget(
                            //    title: title)
                            )));
              },
            );
          });
      market.add(topicCover);
    }

    return market;
  }
}
