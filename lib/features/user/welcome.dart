import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/features/landing/landing_page.dart';
import 'package:memoirverse/features/user/signin/widget/signin.dart';

class WelcomePage extends StatelessWidget {
  const WelcomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(color: Color(0xFFFFFFF4)),
            child: Column(children: [
              Container(
                  width: 390.w,
                  height: 390.h,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/welcome.png"),
                      fit: BoxFit.fill,
                    ),
                  ),
                  child: Column(children: [
                    SizedBox(height: 78.h),
                    SizedBox(
                      width: 157.w,
                      height: 39.h,
                      child: Text(
                        '时光之语',
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          color: Color(0xFF3E6546),
                          fontSize: 28.sp,
                          fontFamily: 'Inter',
                          fontWeight: FontWeight.w700,
                          height: 0.03,
                          letterSpacing: -0.41,
                        ),
                      ),
                    )
                  ])),
              SizedBox(height: 18.h),
              SizedBox(
                width: 320.w,
                height: 88.h,
                child: Text(
                  '成长与感悟、难忘的人、奋勇的经历...\n当这些记忆被记录和整合，我们就重新获得了生命的掌控权。',
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 18.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w200,
                    //height: 1.3,
                  ),
                ),
              ),
              SizedBox(height: 38.h),
              SizedBox(
                width: 334.w,
                height: 43.h,
                child: Text(
                  '和我聊聊，轻松记录您的故事～',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 20.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w600,
                    height: 0.06,
                    letterSpacing: -0.41,
                  ),
                ),
              ),
              SizedBox(height: 38.h),
              GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const LandingPage()),
                    );
                    // showModalBottomSheet(
                    //   context: context,
                    //   builder: (BuildContext context) {
                    //     return Container(
                    //         height: 706.h,
                    //         decoration: const ShapeDecoration(
                    //           color: Color(0xFFFFFFF4),
                    //           shape: RoundedRectangleBorder(
                    //             borderRadius: BorderRadius.only(
                    //               topLeft: Radius.circular(40),
                    //               topRight: Radius.circular(40),
                    //             ),
                    //           ),
                    //         ),
                    //         child: SignIn());
                    //   },
                    // );
                  },
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
                              '开始',
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
                            SizedBox(height: 2.h)
                          ])))
            ])));
  }
}
