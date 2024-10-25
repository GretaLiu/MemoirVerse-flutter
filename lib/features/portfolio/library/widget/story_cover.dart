import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/features/portfolio/library/story_details/story_details.dart';
import 'package:memoirverse/features/write_story/edit/story_edit.dart';

class StoryCoverWidget extends StatelessWidget {
  const StoryCoverWidget({super.key});
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 362.w,
        height: 152.h,
        decoration: ShapeDecoration(
          color: Color(0x7FE3EFC9),
          shape: RoundedRectangleBorder(
            side: const BorderSide(
              width: 1,
              strokeAlign: BorderSide.strokeAlignOutside,
              color: Color(0xFF75A47F),
            ),
            borderRadius: BorderRadius.circular(10),
          ),
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
          SizedBox(
            height: 10.h,
          ),
          Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
            Expanded(
              child: Center(
                  child: Text(
                '青春留影：草原上的家',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF3D6446),
                  fontSize: 20.sp,
                  fontFamily: 'Inder',
                  fontWeight: FontWeight.w400,
                  height: 1.3,
                  letterSpacing: -0.41,
                ),
              )),
            ),
            GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StoryDetailsPage()),
                  );
                },
                child: Row(children: [
                  Text(
                    '查看 ',
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.4000000059604645),
                      fontSize: 16.sp,
                      fontFamily: 'Inder',
                      fontWeight: FontWeight.w400,
                      height: 0.09,
                      letterSpacing: -0.41,
                    ),
                  ),
                  Container(
                    width: 12.w,
                    height: 12.32.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/previous.png"),
                        fit: BoxFit.fill,
                      ),
                      //border: Border.all(width: 1),
                    ),
                  ),
                  SizedBox(width: 5.w)
                ]))
          ]),
          SizedBox(height: 15.h),
          SizedBox(
            width: 313.w,
            height: 90.38.h,
            child: GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const StoryDetailsPage()),
                  );
                },
                child: Text(
                  '在那个被雾气笼罩的童年时光里，郝音素是我\n不可分割的小伙伴。她胆小，学骑自行车这样\n的小事在她看来都是一场巨大的冒险。而我，\n早已在风中驰骋，却 ...',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 1.3,
                    letterSpacing: -0.41,
                  ),
                )),
          )
        ]));
  }
}
