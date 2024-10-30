import 'package:calendar_date_picker2/calendar_date_picker2.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:memoirverse/components/close.dart';
import 'package:memoirverse/components/custom_button.dart';
import 'package:memoirverse/components/custom_textfield.dart';
import 'package:memoirverse/services/UserService.dart';
import 'package:provider/provider.dart';

class EditUserInfoDialog extends StatelessWidget {
  EditUserInfoDialog({super.key});
  final nameController = TextEditingController();
  final smsCodeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 368.w,
        height: 420.h,
        decoration: ShapeDecoration(
          color: const Color(0xFFFFFFF4),
          shape: RoundedRectangleBorder(
            side: BorderSide(width: 1, color: Color(0x7FC8C7AC)),
            borderRadius: BorderRadius.circular(15),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F000000),
              blurRadius: 4,
              offset: Offset(0, 4),
              spreadRadius: 0,
            )
          ],
        ),
        child: Column(children: [
          CloseWidget(),
          SizedBox(
            width: 100.w,
            height: 30.h,
            child: Text(
              '个人信息',
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF3D6446),
                fontSize: 22.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w600,
                height: 0.05,
              ),
            ),
          ),
          Padding(
              padding: EdgeInsets.fromLTRB(25.w, 10.h, 25.w, 10.h),
              child: Column(children: [
                Align(
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
                    )),
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
                Align(
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
                    )),
                SizedBox(height: 15.h),
                Row(children: [
                  Container(
                      width: 22.w,
                      height: 22.w,
                      decoration: const ShapeDecoration(
                        shape: OvalBorder(
                          side: BorderSide(width: 1, color: Color(0xFF75A47F)),
                        ),
                      ),
                      child: Center(
                          child: Container(
                        width: 12.w,
                        height: 12.w,
                        decoration: const ShapeDecoration(
                          color: Color(0xFF75A47F),
                          shape: OvalBorder(),
                        ),
                      ))),
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
                  Expanded(child: Container()),
                  Container(
                    width: 22.w,
                    height: 22.w,
                    decoration: const ShapeDecoration(
                      shape: OvalBorder(
                        side: BorderSide(width: 1, color: Color(0xB2919AB4)),
                      ),
                    ),
                  ),
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
                  SizedBox(width: 100.w)
                ]),
                SizedBox(height: 25.h),
                Align(
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
                    )),
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
              ])),
          Expanded(child: Container()),
          Padding(
              padding: EdgeInsets.fromLTRB(10.w, 10.h, 10.w, 10.h),
              child:
                  Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                CustomButton(
                    width: 142.w,
                    height: 40.h,
                    color: Colors.white,
                    selected: true,
                    needBorder: true,
                    text: "取消",
                    fontColor: Color(0xFF75A47F),
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    onPress: () {
                      Navigator.pop(context);
                    }),
                SizedBox(width: 15.w),
                CustomButton(
                    width: 142.w,
                    height: 40.h,
                    color: Color(0xFF75A47F),
                    selected: true,
                    needBorder: true,
                    text: "保存",
                    fontColor: Colors.white,
                    fontSize: 18.sp,
                    fontWeight: FontWeight.w600,
                    onPress: () {
                      Navigator.pop(context);
                    }),
              ])),
          SizedBox(height: 25.h)
        ]));
  }
}
