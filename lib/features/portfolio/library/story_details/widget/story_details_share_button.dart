import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/components/custom_button.dart';

class StoryDetailsShareButton extends StatelessWidget {
  const StoryDetailsShareButton({super.key});

  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
        color: Colors.white,
        offset: Offset(50.0.w, -110.0.h),
        shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0x66807D7D)),
            borderRadius: BorderRadius.circular(15)),
        itemBuilder: (BuildContext context) {
          return <PopupMenuEntry<String>>[
            PopupMenuItem(
                value: "text",
                child: Padding(
                    padding: EdgeInsets.fromLTRB(13.w, 15.h, 13.w, 10.h),
                    child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            width: 20.w,
                            height: 20.w,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/wechat.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          ),
                          SizedBox(width: 10.w),
                          Text(
                            '分享到微信',
                            style: TextStyle(
                              decoration: TextDecoration.none,
                              color: Color(0xFF3E6546),
                              fontSize: 18.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 1.3,
                              letterSpacing: -0.41,
                            ),
                          ),
                        ]))),
            const PopupMenuDivider(),
            PopupMenuItem(
                value: "text",
                child: Padding(
                    padding: EdgeInsets.fromLTRB(13.w, 10.h, 13.w, 15.h),
                    child: Row(children: [
                      Container(
                        width: 18.w,
                        height: 18.w,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/images/download.png"),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                      SizedBox(width: 10.w),
                      Text(
                        '保存为图片',
                        style: TextStyle(
                          decoration: TextDecoration.none,
                          color: Color(0xFF3E6546),
                          fontSize: 18.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 1.3,
                          letterSpacing: -0.41,
                        ),
                      ),
                    ])))
          ];
        },
        icon: Container(
            width: 142,
            height: 40,
            decoration: ShapeDecoration(
              color: Color(0xFF75A47F),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFF75A47F)),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                '分享',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 18.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w700,
                  height: 0.09,
                  letterSpacing: 0.20,
                ),
              ),
            ])));
  }
}
