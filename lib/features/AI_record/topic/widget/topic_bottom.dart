import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/features/AI_record/topic/widget/topic_market.dart';

class TopicBottomWidget extends StatelessWidget {
  const TopicBottomWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        onTap: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return Dialog(
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1.w, color: Color(0x7FC8C7AC)),
                    borderRadius: BorderRadius.circular(15),
                  ),
                  elevation: 5.0,
                  backgroundColor: Color(0xFFFFFFF4),
                  child: TopicMarketWidget());
            },
          );
        },
        child: Container(
            width: 268.w,
            height: 44.h,
            decoration: ShapeDecoration(
              color: Color(0x66D9D9D9),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(20.r),
              ),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 24.w,
                    height: 24.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/add.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(width: 17.w),
                  Text(
                    '探索新主题',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xFF3D6446),
                      fontSize: 18.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0.07,
                      letterSpacing: -0.41,
                    ),
                  )
                ])));
  }
}
