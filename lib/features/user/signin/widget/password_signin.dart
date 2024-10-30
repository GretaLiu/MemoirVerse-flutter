import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/components/custom_button.dart';
import 'package:memoirverse/components/custom_textfield.dart';
import 'package:memoirverse/services/UserService.dart';
import 'package:provider/provider.dart';

class PasswordSignin extends StatelessWidget {
  PasswordSignin({super.key});
  final usernameController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 310.w,
        height: 506.h,
        color: Color(0xFFFFFFF4),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(height: 10.h),
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
          SizedBox(height: 17.h),
          Container(
              width: 288.w,
              height: 52.h,
              decoration: ShapeDecoration(
                color: Color(0xFFEFF0EA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Center(
                  child: CustomTextField(
                controller: usernameController,
                hintText: "请输入用户名",
                //prefixIcon: Icons.person_outline,
                background_color: Color(0xFFEFF0EA),
                inputType: TextInputType.name,
              ))),
          SizedBox(height: 29.h),
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
          SizedBox(height: 17.h),
          Container(
              width: 288.w,
              height: 52.h,
              decoration: ShapeDecoration(
                color: Color(0xFFEFF0EA),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              child: Center(
                  child: CustomTextField(
                controller: passwordController,
                hintText: "请输入密码",
                //prefixIcon: Icons.person_outline,
                inputType: TextInputType.visiblePassword,
                background_color: Color(0xFFEFF0EA),
              ))),
          SizedBox(height: 50.h),
          Padding(
              padding: EdgeInsets.fromLTRB(0, 0, 0, 0),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () {
                        context.read<UserService>().signin_type = 2;
                      },
                      child: Text(
                        '注册',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF919AB4),
                          fontSize: 18.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w400,
                          height: 1.3,
                          letterSpacing: -0.41,
                        ),
                      ),
                    ),
                    Text(
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
                  ])),
          SizedBox(height: 50.h),
          Center(
              child: CustomButton(
                  width: 160.w,
                  height: 48.h,
                  color: Color(0xFF75A47F),
                  selected: true,
                  needBorder: true,
                  text: "登录",
                  fontColor: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w600,
                  onPress: () {}))
        ]));
  }
}
