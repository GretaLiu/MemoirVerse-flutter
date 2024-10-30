import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/features/user/signin/widget/password_signin.dart';
import 'package:memoirverse/features/user/signin/widget/sms_signin.dart';
import 'package:memoirverse/services/UserService.dart';
import 'package:provider/provider.dart';

class SignIn extends StatelessWidget {
  const SignIn({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 390.w,
        height: 706.h,
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
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  print("sms sign");
                  context.read<UserService>().signin_type = 0;
                },
                child: Text(
                  '短信登陆',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: context.watch<UserService>().signin_type == 0
                        ? Color(0xFF75A47F)
                        : Color(0xFF919AB4),
                    fontSize: 22.sp,
                    fontFamily: 'Inter',
                    fontWeight: context.watch<UserService>().signin_type == 0
                        ? FontWeight.w600
                        : FontWeight.w400,
                    height: 0.05,
                    letterSpacing: -0.41,
                  ),
                )),
            SizedBox(width: 20.w),
            Container(
              width: 2.w,
              height: 22.h,
              decoration: ShapeDecoration(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    width: 2.w,
                    strokeAlign: BorderSide.strokeAlignCenter,
                    color: Color(0xFF919AB4),
                  ),
                ),
              ),
            ),
            SizedBox(width: 20.w),
            GestureDetector(
                behavior: HitTestBehavior.opaque,
                onTap: () {
                  context.read<UserService>().signin_type = 1;
                },
                child: Text(
                  '密码登陆',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: context.watch<UserService>().signin_type == 1
                        ? Color(0xFF75A47F)
                        : Color(0xFF919AB4),
                    fontSize: 22.sp,
                    fontFamily: 'Inter',
                    fontWeight: context.watch<UserService>().signin_type == 1
                        ? FontWeight.w600
                        : FontWeight.w400,
                    height: 0.05,
                    letterSpacing: -0.41,
                  ),
                ))
          ]),
          SizedBox(height: 20.h),
          context.watch<UserService>().signin_type == 0
              ? SMS_Signin()
              : PasswordSignin(),
          SizedBox(height: 50.h)
        ]));
  }
}
