import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class StoryEditDialog extends StatelessWidget {
  const StoryEditDialog({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 368.w,
        height: 600.h,
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
          Padding(
              padding: EdgeInsets.all(10.w),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                        width: 80.w,
                        height: 40.h,
                        decoration: ShapeDecoration(
                          color: Colors.white,
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1, color: Color(0xFF75A47F)),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '取消',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xFF75A47F),
                              fontSize: 18.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 0.07,
                              letterSpacing: -0.41,
                            ),
                          ),
                        )),
                    Container(
                        width: 80.w,
                        height: 40.h,
                        decoration: ShapeDecoration(
                          color: Color(0xFF75A47F),
                          shape: RoundedRectangleBorder(
                            side:
                                BorderSide(width: 1, color: Color(0xFF75A47F)),
                            borderRadius: BorderRadius.circular(30),
                          ),
                        ),
                        child: Center(
                          child: Text(
                            '完成',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 18.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w700,
                              height: 0.07,
                              letterSpacing: -0.41,
                            ),
                          ),
                        ))
                  ])),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.all(10.w),
                  child: Container(
                      width: 366.w,
                      decoration: ShapeDecoration(
                        color: Colors.white,
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      child: SingleChildScrollView(
                          child: Padding(
                        padding: EdgeInsets.all(10.w),
                        child: Text(
                          '在那个被雾气笼罩的童年时光里，郝音素是我不可分割的小伙伴。她胆小，学骑自行车这样的小事在她看来都是一场巨大的冒险。而我，早已在风中驰骋，却甘愿放慢脚步，成为她坚实的后盾。每当下雨，泥巴路变得泥泞不堪，我们便弃车步行，那是一段遥远却美好的上学路。我们的笑声在浓雾中回荡，眉毛上的霜花仿佛圣诞老人的胡须，让我们的世界充满了童话般的温暖。  \n\n',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 1.3,
                            letterSpacing: -0.41,
                          ),
                        ),
                      ))))),
          SizedBox(height: 10.h),
          SizedBox(
            width: 104.w,
            height: 44.h,
            child: Text(
              '删除本段',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFFE04F5F),
                fontSize: 18.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 0.07,
                letterSpacing: -0.41,
              ),
            ),
          )
        ]));
  }
}
