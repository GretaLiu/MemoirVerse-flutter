import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/components/custom_textfield.dart';

class Password_Signin extends StatelessWidget {
  Password_Signin({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 310.w,
        color: Color(0xFFFFFFF4),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
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
                inputType: TextInputType.visiblePassword,
                background_color: Color(0x26919AB4),
              )),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: [
            SizedBox(
              width: 40.w,
              height: 39.h,
              child: Text(
                '注册',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF919AB4),
                  fontSize: 18.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0.07,
                  letterSpacing: -0.41,
                ),
              ),
            ),
            SizedBox(
              width: 76.w,
              height: 39.h,
              child: Text(
                '忘记密码',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Color(0xFF919AB4),
                  fontSize: 18.sp,
                  fontFamily: 'Inter',
                  fontWeight: FontWeight.w400,
                  height: 0.07,
                  letterSpacing: -0.41,
                ),
              ),
            )
          ]),
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
              child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(
                      width: 93.w,
                      height: 24.h,
                      child: Text(
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
                    )
                  ]))
        ]));
  }
}
