import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/components/custom_textfield.dart';
import 'package:memoirverse/services/UserService.dart';
import 'package:memoirverse/utils/Config.dart';
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
            '基本信息',
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
                controller: nameController,
                hintText: "请输入姓名",
                //prefixIcon: Icons.person_outline,
                background_color: Color(0x26919AB4),
                inputType: TextInputType.phone,
              )),
          Text(
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
          ),
          Row(mainAxisAlignment: MainAxisAlignment.spaceBetween, children: []),
          Text(
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
              child: CalendarDatePicker2(
                config: CalendarDatePicker2Config(),
                value: birthday,
                onValueChanged: (dates) => birthday = dates,
              )),
          Text(
            '最感兴趣的话题',
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
          Wrap(
              children: List.generate(20, (index) => getTopic(context, index))),
          Row(children: [
            Expanded(
                child: Container(
                    width: 160.w,
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
                          SizedBox(
                            width: 93.w,
                            height: 24.h,
                            child: Text(
                              '跳过',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Color(0xFF75A47F),
                                fontSize: 20.sp,
                                fontFamily: 'Inter',
                                fontWeight: FontWeight.w600,
                                height: 0.06,
                                letterSpacing: -0.41,
                              ),
                            ),
                          )
                        ]))),
            Expanded(
                child: Container(
                    width: 160,
                    height: 52,
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
                              '提交',
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
                        ])))
          ])
        ]));
  }

  Widget getTopic(BuildContext context, int index) {
    return GestureDetector(
        onTap: () {
          context.read<UserService>().topicSelected(index);
        },
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
                width: 93,
                height: 24,
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
                          height: 0.07,
                          letterSpacing: -0.41,
                        ),
                      ),
                    ]))));
  }
}
