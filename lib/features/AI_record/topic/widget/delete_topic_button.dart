import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class DeleteTopicButton extends StatelessWidget {
  DeleteTopicButton({super.key});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {},
        child: Container(
            width: 128.w,
            height: 34.h,
            decoration: ShapeDecoration(
              color: Color(0xCCE04F5F),
              shape: RoundedRectangleBorder(
                side: BorderSide(width: 1, color: Color(0xFFE04F5F)),
                borderRadius: BorderRadius.circular(15),
              ),
            ),
            child: Center(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                  Container(
                    width: 22.w,
                    height: 22.h,
                    decoration: const BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage("assets/images/delete.png"),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(width: 10.w),
                  Text(
                    '删除',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 20.sp,
                      fontFamily: 'Inter',
                      fontWeight: FontWeight.w400,
                      height: 0,
                      letterSpacing: -0.41,
                    ),
                  ),
                ]))));
  }
}
