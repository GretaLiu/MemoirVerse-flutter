import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class ForwardButton extends StatelessWidget {
  const ForwardButton({
    super.key,
    required this.onPress,
  });
  final VoidCallback onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          onPress();
        },
        child: Container(
            width: 160.w,
            height: 40.h,
            decoration: ShapeDecoration(
              color: Color(0xFF75A47F),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFF75A47F)),
                borderRadius: BorderRadius.circular(30),
              ),
            ),
            child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    width: 20.w,
                  ),
                  Expanded(
                      child: Text(
                    '下一步',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w700,
                      height: 0.09,
                      letterSpacing: 0.20,
                    ),
                  )),
                  Container(
                    width: 14.w,
                    height: 14.h,
                    decoration: const BoxDecoration(
                      image: const DecorationImage(
                        image: AssetImage("assets/images/forward_white.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 20.w,
                  ),
                ])));
  }
}
