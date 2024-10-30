import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:memoirverse/components/custom_button.dart';
import 'package:memoirverse/components/custom_textfield.dart';
import 'package:memoirverse/services/UserService.dart';

import 'package:provider/provider.dart';

class UserInfo extends StatelessWidget {
  UserInfo({super.key});
  final nameController = TextEditingController();
  final passwordController = TextEditingController();
  final phoneController = TextEditingController();
  final smsCodeController = TextEditingController();
  List<DateTime> birthday = [DateTime.now()];
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
          SizedBox(
            width: 100.w,
            height: 30.h,
            child: Text(
              '基本信息',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF3D6446),
                fontSize: 22.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 1.3,
              ),
            ),
          ),
          Column(
              // crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(height: 25.h),
                Padding(
                    padding: EdgeInsets.only(left: 50.w),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '姓名',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0.07,
                            letterSpacing: -0.41,
                          ),
                        ))),
                SizedBox(height: 15.h),
                Container(
                    width: 318.w,
                    height: 52.h,
                    decoration: ShapeDecoration(
                      color: Color(0x26919AB4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Center(
                        child: CustomTextField(
                      controller: nameController,
                      hintText: "请输入姓名",
                      //prefixIcon: Icons.person_outline,
                      background_color: Color(0xFFEFF0EA),
                      inputType: TextInputType.name,
                    ))),
                SizedBox(height: 25.h),
                Padding(
                    padding: EdgeInsets.only(left: 50.w),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '性别',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0.07,
                            letterSpacing: -0.41,
                          ),
                        ))),
                SizedBox(height: 15.h),
                Container(
                    width: 318.w,
                    child: Row(children: [
                      GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            context.read<UserService>().gender = "male";
                          },
                          child: Container(
                              width: 22.w,
                              height: 22.w,
                              decoration: ShapeDecoration(
                                shape: OvalBorder(
                                  side: BorderSide(
                                      width: 1,
                                      color:
                                          context.read<UserService>().gender ==
                                                  "male"
                                              ? Color(0xFF75A47F)
                                              : Color(0xB2919AB4)),
                                ),
                              ),
                              child:
                                  context.read<UserService>().gender == "male"
                                      ? Center(
                                          child: Container(
                                          width: 12.w,
                                          height: 12.w,
                                          decoration: const ShapeDecoration(
                                            color: Color(0xFF75A47F),
                                            shape: OvalBorder(),
                                          ),
                                        ))
                                      : Container())),
                      SizedBox(width: 10.w),
                      Text(
                        '男',
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
                      SizedBox(width: 100.w),
                      GestureDetector(
                          behavior: HitTestBehavior.opaque,
                          onTap: () {
                            context.read<UserService>().gender = "female";
                          },
                          child: Container(
                              width: 22.w,
                              height: 22.w,
                              decoration: ShapeDecoration(
                                shape: OvalBorder(
                                    side: BorderSide(
                                        width: 1,
                                        color: context
                                                    .read<UserService>()
                                                    .gender ==
                                                "female"
                                            ? Color(0xFF75A47F)
                                            : Color(0xB2919AB4))),
                              ),
                              child:
                                  context.read<UserService>().gender == "female"
                                      ? Center(
                                          child: Container(
                                          width: 12.w,
                                          height: 12.w,
                                          decoration: const ShapeDecoration(
                                            color: Color(0xFF75A47F),
                                            shape: OvalBorder(),
                                          ),
                                        ))
                                      : Container())),

                      SizedBox(width: 10.w),
                      Text(
                        '女',
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
                      //SizedBox(width: 100.w)
                    ])),
                SizedBox(height: 25.h),
                Padding(
                    padding: EdgeInsets.only(left: 50.w),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '生日',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 0.07,
                            letterSpacing: -0.41,
                          ),
                        ))),
                SizedBox(height: 15.h),
                GestureDetector(
                    behavior: HitTestBehavior.opaque,
                    onTap: () async {
                      DateTime? _selected_date = await showDatePicker(
                          context: context,
                          firstDate: DateTime(1920),
                          lastDate: DateTime(2020),
                          locale: Locale('zh'),
                          initialDate: DateTime.parse(
                              context.read<UserService>().birthday));
                      if (_selected_date != null) {
                        context.read<UserService>().birthday =
                            DateFormat('yyyy-MM-dd').format(_selected_date);
                      }
                    },
                    child: Container(
                        width: 318.w,
                        height: 52.h,
                        decoration: ShapeDecoration(
                          color: Color(0x26919AB4),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10),
                          ),
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Padding(
                                  padding: EdgeInsets.only(left: 10.w),
                                  child: Text(
                                    context.watch<UserService>().birthday,
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 18.sp,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 0.07,
                                      letterSpacing: -0.41,
                                    ),
                                  ))
                            ]))),
                SizedBox(height: 15.h),
                Padding(
                    padding: EdgeInsets.only(left: 50.w),
                    child: Align(
                        alignment: Alignment.centerLeft,
                        child: Text(
                          '最感兴趣的话题',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 1.3,
                            letterSpacing: -0.41,
                          ),
                        ))),
                SizedBox(height: 15.h),
                Wrap(
                    children:
                        List.generate(7, (index) => getTopic(context, index))),
                SizedBox(height: 25.h),
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  CustomButton(
                      width: 160.w,
                      height: 52.h,
                      color: Colors.white,
                      selected: true,
                      needBorder: true,
                      text: "跳过",
                      fontColor: Color(0xFF75A47F),
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      onPress: () {}),
                  SizedBox(width: 15.w),
                  CustomButton(
                      width: 160.w,
                      height: 52.h,
                      color: Color(0xFF75A47F),
                      selected: true,
                      needBorder: true,
                      text: "提交",
                      fontColor: Colors.white,
                      fontSize: 18.sp,
                      fontWeight: FontWeight.w600,
                      onPress: () {}),
                ]),
                SizedBox(height: 15.h),
              ])
        ]));
  }

  Widget getTopic(BuildContext context, int index) {
    return GestureDetector(
        onTap: () {
          context.read<UserService>().topicSelected(index);
        },
        child: Padding(
            padding: EdgeInsets.all(3.w),
            child: Container(
                width: 112.w,
                height: 40.h,
                decoration: ShapeDecoration(
                  color: Colors.white.withOpacity(0.5),
                  shape: RoundedRectangleBorder(
                    side: BorderSide(width: 1, color: Color(0xFF75A47F)),
                    borderRadius: BorderRadius.circular(30),
                  ),
                ),
                child: SizedBox(
                    width: 93.w,
                    height: 24.h,
                    child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            context.read<UserService>().topic[index]["title"],
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: context.watch<UserService>().topic[index]
                                      ["selected"]
                                  ? Color(0xFF75A47F)
                                  : Color(0xB2919AB4),
                              fontSize: 18.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w600,
                              height: 1.3,
                              letterSpacing: -0.41,
                            ),
                          ),
                        ])))));
  }
}
