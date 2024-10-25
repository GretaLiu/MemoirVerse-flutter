import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/features/AI_record/topic/widget/delete_topic_button.dart';
import 'package:memoirverse/features/AI_record/topic/widget/topic_info.dart';
import 'package:memoirverse/features/AI_record/topic/widget/topic_question.dart';

class TopicCoverWidget extends StatelessWidget {
  TopicCoverWidget({
    super.key,
    required this.image,
    required this.title,
    required this.onPress,
  });
  String image;
  String title;
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          onPress();
        },
        child: Container(
            width: 172.w,
            height: 150.h,
            decoration: ShapeDecoration(
              image: DecorationImage(
                image: AssetImage(image),
                fit: BoxFit.fill,
              ),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15),
              ),
              shadows: [
                BoxShadow(
                  color: Color(0x3F000000),
                  blurRadius: 4.r,
                  offset: Offset(0, 4),
                  spreadRadius: 0,
                )
              ],
            ),
            child: Column(children: [
              Container(
                  width: 172.w,
                  height: 53.h,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/images/intersect.png"),
                      fit: BoxFit.fill,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Color(0x3F7F7C7C),
                        blurRadius: 4.r,
                        offset: Offset(0, 4.h),
                        spreadRadius: 0,
                      )
                    ],
                  ),
                  child: Center(
                      child: Padding(
                          padding: EdgeInsets.only(bottom: 10.0.h),
                          child: Text(
                            title,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 26.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0,
                              letterSpacing: -0.41,
                            ),
                          )))),
              Expanded(child: Container()),
              //DeleteTopicButton(),
              SizedBox(height: 11.h)
            ])));
  }
}
