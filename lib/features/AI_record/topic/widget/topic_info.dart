import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/components/back.dart';
import 'package:memoirverse/services/AIRecordService.dart';
import 'package:provider/provider.dart';

class TopicInfoWidget extends StatelessWidget {
  TopicInfoWidget({super.key, required this.image, required this.title});
  String image;
  String title;
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 368.w,
        height: 628.h,
        decoration: ShapeDecoration(
          color: const Color(0xFFFFFFF4),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0x7FC8C7AC)),
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
          Container(
              width: 368.w,
              height: 200.h,
              decoration: ShapeDecoration(
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.fitWidth,
                ),
                shape: const RoundedRectangleBorder(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(15),
                    topRight: Radius.circular(15),
                  ),
                ),
              ),
              child: Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                      padding: EdgeInsets.all(10), child: BackWidget()))),
          SizedBox(height: 18.h),
          Text(
            title,
            style: TextStyle(
              color: Color(0xFF3D6446),
              fontSize: 30.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w700,
              height: 0,
              letterSpacing: -0.41,
            ),
          ),
          SizedBox(height: 18.h),
          SizedBox(
            width: 276.w,
            child: Text(
              '这里是场景的描述，回忆内容的描述什么描述都可以，到时候再加吧。没所谓的。是文字工作了',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18.sp,
                fontFamily: 'Inder',
                fontWeight: FontWeight.w400,
                height: 1.3,
                letterSpacing: 0.03,
              ),
            ),
          ),
          Expanded(child: Container()),
          GestureDetector(
              behavior: HitTestBehavior.opaque,
              onTap: () {
                context.read<AIRecordService>().selectOneTopic(title);
              },
              child: Container(
                  width: 160.w,
                  height: 48.h,
                  decoration: ShapeDecoration(
                    color: Color(0xFF75A47F),
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFF75A47F)),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  ),
                  child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          '添加',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 18.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0.07,
                            letterSpacing: -0.41,
                          ),
                        ),
                      ]))),
          SizedBox(height: 35.h)
        ]));
  }
}
