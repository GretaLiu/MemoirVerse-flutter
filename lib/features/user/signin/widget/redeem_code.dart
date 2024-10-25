import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/components/close.dart';
import 'package:memoirverse/components/custom_button.dart';
import 'package:memoirverse/components/custom_textfield.dart';
import 'package:memoirverse/services/UserService.dart';
import 'package:provider/provider.dart';

class RedeemCodeDialog extends StatelessWidget {
  RedeemCodeDialog({super.key});
  final codeController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 360.w,
        height: 258.h,
        decoration: ShapeDecoration(
          color: const Color(0xFFFFFFF4),
          shape: RoundedRectangleBorder(
            side: const BorderSide(width: 1, color: Color(0x7FC8C7AC)),
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
          Text(
            '兑换码',
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Color(0xFF3D6446),
              fontSize: 22.sp,
              fontFamily: 'Inter',
              fontWeight: FontWeight.w600,
              height: 0.05,
            ),
          ),
          SizedBox(height: 20.h),
          Container(
              width: 316.w,
              height: 48.h,
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.75),
                shape: RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0xFFD9D9D9)),
                  borderRadius: BorderRadius.circular(15),
                ),
              ),
              child: Center(
                  child: CustomTextField(
                controller: codeController,
                hintText: "请输入您的兑换码",
                //prefixIcon: Icons.person_outline,
                background_color: Colors.white.withOpacity(0.75),
                inputType: TextInputType.text,
              ))),
          SizedBox(height: 10.h),
          SizedBox(
            width: 328.w,
            height: 48.h,
            child: Text(
              context.watch<UserService>().redeemCode_result,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Color(0xFF3D6446),
                fontSize: 18.sp,
                fontFamily: 'Inter',
                fontWeight: FontWeight.w400,
                height: 1.3,
              ),
            ),
          ),
          Expanded(child: Container()),
          CustomButton(
              width: 142.w,
              height: 40.h,
              color: Color(0xFF75A47F),
              selected: true,
              needBorder: true,
              text: "兑换",
              fontColor: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w600,
              onPress: () {
                //showOverlay(context);
                // Navigator.push(
                //   context,
                //   MaterialPageRoute(builder: (context) => const EditPage()),
                // );
              }),
          SizedBox(height: 20.h),
        ]));
  }
}
