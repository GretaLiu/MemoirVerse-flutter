import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/features/AI_record/home/widget/AIRecord_head.dart';
import 'package:memoirverse/features/AI_record/note/notes.dart';
import 'package:memoirverse/features/portfolio/library/story_details/story_details.dart';
import 'package:memoirverse/features/user/home/widget/edit_user_info.dart';
import 'package:memoirverse/features/user/signin/widget/redeem_code.dart';
import 'package:memoirverse/features/write_story/home/widget/chat_summary_history.dart';
import 'package:memoirverse/features/write_story/home/widget/write_story_head.dart';
import 'package:memoirverse/services/UserService.dart';
import 'package:provider/provider.dart';

class UserPage extends StatelessWidget {
  const UserPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        body: Container(
            width: 390.w,
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(color: Color(0xFFFFFFF4)),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(height: 50.h),
                  Row(crossAxisAlignment: CrossAxisAlignment.center, children: [
                    SizedBox(width: 27.w),
                    Container(
                        width: 72.w,
                        height: 72.w,
                        decoration: const ShapeDecoration(
                          color: Color(0xFFFAFBFA),
                          shape: OvalBorder(
                            side:
                                BorderSide(width: 1, color: Color(0xCCF6EADD)),
                          ),
                        ),
                        child: Center(
                            child: Container(
                          width: 58.91.w,
                          height: 58.91.w,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/old_woman.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ))),
                    SizedBox(width: 15.w),
                    Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 78.w,
                            child: Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                    text:
                                        '${context.watch<UserService>().name}\n',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 22.sp,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 1.3,
                                      letterSpacing: -0.41,
                                    ),
                                  ),
                                  TextSpan(
                                    text:
                                        '${context.watch<UserService>().age}岁',
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 14.sp,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 1.3,
                                      letterSpacing: -0.41,
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          GestureDetector(
                              behavior: HitTestBehavior.opaque,
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return UnconstrainedBox(
                                        constrainedAxis: Axis.vertical,
                                        child: SizedBox(
                                            width: 370.w,
                                            child: Dialog(
                                                insetPadding: EdgeInsets.zero,
                                                shape: RoundedRectangleBorder(
                                                  side: BorderSide(
                                                      width: 1.w,
                                                      color: Color(0x7FC8C7AC)),
                                                  borderRadius:
                                                      BorderRadius.circular(15),
                                                ),
                                                elevation: 5.0,
                                                backgroundColor:
                                                    Color(0xFFFFFFF4),
                                                child:
                                                    EditUserInfoDialog() //TopicQuestionWidget(title: title)
                                                )));
                                  },
                                );
                              },
                              child: Container(
                                width: 26.w,
                                height: 26.w,
                                decoration: const BoxDecoration(
                                  image: DecorationImage(
                                    image: AssetImage(
                                        "assets/images/edit-text.png"),
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ))
                        ])
                  ]),
                  SizedBox(height: 10.h),
                  Container(
                      width: 360.w,
                      height: 120.h,
                      decoration: ShapeDecoration(
                        color: Colors.white.withOpacity(0.5),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0xCCD9D9D9)),
                          borderRadius: BorderRadius.circular(20),
                        ),
                      ),
                      child: Column(children: [
                        Padding(
                            padding:
                                EdgeInsets.fromLTRB(18.w, 15.h, 18.w, 15.h),
                            child: Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    'VIP 会员',
                                    style: TextStyle(
                                      color: Color(0xFFFF9500),
                                      fontSize: 22.sp,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w700,
                                      height: 0.05,
                                      letterSpacing: -0.41,
                                    ),
                                  ),
                                  Expanded(child: Container()),
                                  GestureDetector(
                                      behavior: HitTestBehavior.opaque,
                                      onTap: () {
                                        showDialog(
                                          context: context,
                                          builder: (BuildContext context) {
                                            return UnconstrainedBox(
                                                constrainedAxis: Axis.vertical,
                                                child: SizedBox(
                                                    width: 360.w,
                                                    child: Dialog(
                                                        insetPadding:
                                                            EdgeInsets.zero,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          side: BorderSide(
                                                              width: 1.w,
                                                              color: const Color(
                                                                  0x7FC8C7AC)),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(15),
                                                        ),
                                                        elevation: 5.0,
                                                        backgroundColor:
                                                            Color(0xFFFFFFF4),
                                                        child:
                                                            RedeemCodeDialog() //TopicQuestionWidget(title: title)
                                                        )));
                                          },
                                        );
                                      },
                                      child: Container(
                                          width: 92.w,
                                          height: 40.h,
                                          decoration: ShapeDecoration(
                                            color: Colors.white.withOpacity(
                                                0.4000000059604645),
                                            shape: RoundedRectangleBorder(
                                              side: BorderSide(
                                                  width: 2,
                                                  color: Color(0xFFF5DAD2)),
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                            ),
                                          ),
                                          child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                SizedBox(
                                                  width: 60.w,
                                                  height: 29.h,
                                                  child: Text(
                                                    '兑换码',
                                                    textAlign: TextAlign.center,
                                                    style: TextStyle(
                                                      color: Color(0xFF828282),
                                                      fontSize: 18.sp,
                                                      fontFamily: 'Inter',
                                                      fontWeight:
                                                          FontWeight.w700,
                                                      height: 1.3,
                                                      letterSpacing: -0.41,
                                                    ),
                                                  ),
                                                )
                                              ]))),
                                  SizedBox(width: 8.w),
                                  Container(
                                      width: 92.w,
                                      height: 40.h,
                                      decoration: ShapeDecoration(
                                        gradient: const LinearGradient(
                                          begin: Alignment(0.00, -1.00),
                                          end: Alignment(0, 1),
                                          colors: [
                                            Color(0xCCFF9500),
                                            Color(0xFFF5DAD2)
                                          ],
                                        ),
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(20),
                                        ),
                                      ),
                                      child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              '会员充值',
                                              textAlign: TextAlign.center,
                                              style: TextStyle(
                                                color: Colors.white,
                                                fontSize: 18.sp,
                                                fontFamily: 'Inter',
                                                fontWeight: FontWeight.w700,
                                                height: 0.07,
                                                letterSpacing: -0.41,
                                              ),
                                            ),
                                          ]))
                                ])),
                        SizedBox(
                          width: 328.w,
                          height: 48.h,
                          child: Text(
                            '您可以享用 AI 功能至2025-06-01\n您的作品将被永久保存！',
                            style: TextStyle(
                              color: Color(0xFF7F7C7C),
                              fontSize: 16.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 1.3,
                            ),
                          ),
                        )
                      ])),
                  SizedBox(height: 5.h),
                  Container(
                    width: 360.w,
                    height: 300.h,
                    decoration: ShapeDecoration(
                      color: Colors.white.withOpacity(0.5),
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                            width: 1, color: Color(0xCCD9D9D9)),
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                    child: Padding(
                        padding: EdgeInsets.all(16.w),
                        child: Text(
                          '最近几天，您聊天的主题是“童年印象”。整体来讲，您聊得最多的主题“儿时的家”，聊过2次。\n\n有最多故事记录的主题是“高校生活”，已经有1篇故事啦！\n\n\n',
                          style: TextStyle(
                            color: Color(0xFF523620),
                            fontSize: 18.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 1.3,
                          ),
                        )),
                  ),
                  Expanded(child: Container()),
                  SizedBox(height: 10.h),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                      width: 18.w,
                      height: 18.w,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/user_1.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Text(
                      '账户管理',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF3D6446),
                        fontSize: 18.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0.07,
                        letterSpacing: -0.41,
                      ),
                    ),
                  ]),
                  SizedBox(height: 20.h),
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                    Container(
                      width: 18.w,
                      height: 18.w,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/setting.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(width: 15.w),
                    Text(
                      '系统设置',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF3D6446),
                        fontSize: 18.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 0.07,
                        letterSpacing: -0.41,
                      ),
                    ),
                  ]),
                  SizedBox(height: 20.h),
                  Container(
                      width: 240.w,
                      height: 38.h,
                      decoration: ShapeDecoration(
                        color: Color(0x4CF5DAD2),
                        shape: RoundedRectangleBorder(
                          side: BorderSide(width: 1, color: Color(0xFFE04F5F)),
                          borderRadius: BorderRadius.circular(15),
                        ),
                      ),
                      child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              '退出登录',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFFE04F5F),
                                fontSize: 18.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w400,
                                height: 0.07,
                                letterSpacing: -0.41,
                              ),
                            ),
                          ])),
                  SizedBox(height: 20.h),
                ])));
  }
}
