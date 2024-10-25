import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/components/custom_textfield.dart';

class SignUp extends StatelessWidget {
  SignUp({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final smsCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 310.w,
        decoration: const ShapeDecoration(
          color: Color(0xFFFFFFF4),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(40),
              topRight: Radius.circular(40),
            ),
          ),
        ),
        child: Column(children: [
          SizedBox(height: 35.h),
          Text(
            '注册',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF75A47F),
              fontSize: 22.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              height: 0.05,
              letterSpacing: -0.41,
            ),
          ),
          Text(
            '用户名',
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
          Container(
              width: 288,
              height: 52,
              decoration: ShapeDecoration(
                color: Color(0x26919AB4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: CustomTextField(
                controller: usernameController,
                hintText: "请输入用户名",
                //prefixIcon: Icons.person_outline,
                background_color: Color(0x26919AB4),
                inputType: TextInputType.name,
              )),
          Text(
            '密码',
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
          Container(
              width: 288,
              height: 52,
              decoration: ShapeDecoration(
                color: Color(0x26919AB4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: CustomTextField(
                controller: passwordController,
                hintText: "请输入密码",
                //prefixIcon: Icons.person_outline,
                background_color: Color(0x26919AB4),
                inputType: TextInputType.name,
              )),
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
          Row(children: [
            Container(
                width: 180.w,
                height: 52.h,
                decoration: ShapeDecoration(
                  color: Color(0x26919AB4),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: CustomTextField(
                  controller: phoneController,
                  hintText: "请输入手机号",
                  //prefixIcon: Icons.person_outline,
                  background_color: Color(0x26919AB4),
                  inputType: TextInputType.phone,
                )),
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
          Container(
              width: 288,
              height: 52,
              decoration: ShapeDecoration(
                color: Color(0x26919AB4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: CustomTextField(
                controller: smsCodeController,
                hintText: "输入验证码",
                //prefixIcon: Icons.person_outline,
                background_color: Color(0x26919AB4),
                inputType: TextInputType.phone,
              )),
          Container(
              width: 160,
              height: 48,
              decoration: ShapeDecoration(
                color: Color(0xFF75A47F),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFF75A47F)),
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              child: Column(children: [
                SizedBox(
                  width: 93.w,
                  height: 24.h,
                  child: Text(
                    '注册',
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
                )
              ]))
        ]));
  }
}
