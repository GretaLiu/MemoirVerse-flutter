import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/components/custom_textfield.dart';

class SMS_Signin extends StatelessWidget {
  SMS_Signin({super.key});
  final phoneController = TextEditingController();
  final smsCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 310.w,
        color: Color(0xFFFFFFF4),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          Text(
            '手机号码',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w500,
              //height: 0.07,
              //letterSpacing: -0.41,
            ),
          ),
          SizedBox(height: 17.h),
          Row(children: [
            Container(
                width: 180.w,
                height: 52.h,
                decoration: ShapeDecoration(
                  color: Color(0xFFEFF0EA),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: Center(
                    child: CustomTextField(
                  controller: phoneController,
                  hintText: "请输入手机号",
                  //prefixIcon: Icons.person_outline,
                  background_color: Color(0xFFEFF0EA),
                  inputType: TextInputType.phone,
                ))),
            SizedBox(width: 10.w),
            Container(
                width: 108.w,
                height: 52.h,
                decoration: ShapeDecoration(
                  color: Colors.white,
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFF75A47F)),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '获取验证码',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF75A47F),
                          fontSize: 18.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w600,
                          height: 0.07,
                          letterSpacing: -0.41,
                        ),
                      ),
                    ]))
          ]),
          SizedBox(height: 29.h),
          Text(
            '验证码',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black,
              fontSize: 18.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w400,
              height: 0.07,
              letterSpacing: -0.41,
            ),
          ),
          SizedBox(height: 17.h),
          Container(
              width: 288.w,
              height: 52.h,
              decoration: ShapeDecoration(
                color: Color(0x26919AB4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Center(
                  child: CustomTextField(
                controller: smsCodeController,
                hintText: "输入验证码",
                //prefixIcon: Icons.person_outline,
                background_color: Color(0x26919AB4),
                inputType: TextInputType.phone,
              ))),
          SizedBox(height: 50.h),
          Center(
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
                          '登陆',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w600,
                            height: 0.06,
                            letterSpacing: -0.41,
                          ),
                        ),
                      ]))),
          SizedBox(height: 50.h),
        ]));
  }
}
