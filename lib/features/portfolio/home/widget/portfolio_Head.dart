import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/components/custom_button.dart';
import 'package:memoirverse/services/PortfolioService.dart';
import 'package:provider/provider.dart';

class PortfolioHeadWidget extends StatelessWidget {
  const PortfolioHeadWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 248.w,
        height: 44.h,
        decoration: ShapeDecoration(
          color: Color(0x66BACD92),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          shadows: const [
            BoxShadow(
              color: Color(0x3F7F7C7C),
              blurRadius: 4,
              offset: Offset(0, 2),
              spreadRadius: 0,
            )
          ],
        ),
        child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
          CustomButton(
              width: 96.w,
              height: 44.h,
              color: Color(0x99BACD92),
              selected: context.watch<PortfolioService>().selected_index == 0,
              needBorder: false,
              text: "文库",
              fontColor: Color(0xFF3D6446),
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              onPress: () {
                context.read<PortfolioService>().selected_index = 0;
              }),
          SizedBox(width: 10.w),
          CustomButton(
              width: 100.w,
              height: 44.h,
              color: Color(0x99BACD92),
              selected: context.watch<PortfolioService>().selected_index == 1,
              needBorder: false,
              text: "作品集",
              fontColor: Color(0xFF3D6446),
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              onPress: () {
                context.read<PortfolioService>().selected_index = 1;
              }),
        ]));
  }
}
