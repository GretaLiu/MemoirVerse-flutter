import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/components/close.dart';
import 'package:memoirverse/components/custom_button.dart';
import 'package:memoirverse/global/global.dart';

import 'package:memoirverse/services/AIRecordService.dart';
import 'package:memoirverse/services/WriteStoryService.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class VoiceSetupWidget extends StatelessWidget {
  const VoiceSetupWidget({Key? key}) : super(key: key);

//   @override
//   _VoiceSetupWidgetState createState() => _VoiceSetupWidgetState();
// }

// class _VoiceSetupWidgetState extends State {
//   @override
//   void initState() {
//     print("initState");

//     super.initState();
//   }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 320.w,
        height: context.watch<AIRecordService>().enableVoice ? 400.h : 60.h,
        decoration: ShapeDecoration(
          color: Color(0xFFFCFDFA),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Column(children: [
          //CloseWidget(),
          Container(
              width: 320.w,
              height: 48.h,
              decoration: ShapeDecoration(
                color: Color(0xFFFFFFF4),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(20),
                ),
              ),
              child: Padding(
                  padding: EdgeInsets.fromLTRB(20.w, 0, 20.w, 0.h),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          '语音',
                          style: TextStyle(
                            color: Color(0xFF3E6546),
                            fontSize: 18.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w700,
                            height: 0,
                            letterSpacing: -0.41,
                          ),
                        ),
                        GestureDetector(
                            behavior: HitTestBehavior.opaque,
                            onTap: () {
                              context.read<AIRecordService>().enableVoice =
                                  !context.read<AIRecordService>().enableVoice;
                            },
                            child: Container(
                              width: 52.w,
                              height: 31.h,
                              padding: const EdgeInsets.only(
                                  top: 2, left: 2, right: 2, bottom: 2),
                              clipBehavior: Clip.antiAlias,
                              decoration: ShapeDecoration(
                                color:
                                    context.watch<AIRecordService>().enableVoice
                                        ? Color(0xFF34C759)
                                        : Color(0x28787880),
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(100),
                                ),
                              ),
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                mainAxisAlignment:
                                    context.watch<AIRecordService>().enableVoice
                                        ? MainAxisAlignment.end
                                        : MainAxisAlignment.start,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Container(
                                    width: 27.w,
                                    height: 27.w,
                                    decoration: ShapeDecoration(
                                      color: Colors.white,
                                      shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(100),
                                      ),
                                      shadows: const [
                                        BoxShadow(
                                          color: Color(0x0F000000),
                                          blurRadius: 1,
                                          offset: Offset(0, 3),
                                          spreadRadius: 0,
                                        ),
                                        BoxShadow(
                                          color: Color(0x26000000),
                                          blurRadius: 8,
                                          offset: Offset(0, 3),
                                          spreadRadius: 0,
                                        ),
                                        BoxShadow(
                                          color: Color(0x0A000000),
                                          blurRadius: 0,
                                          offset: Offset(0, 0),
                                          spreadRadius: 1,
                                        )
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ))
                      ]))),
          SizedBox(height: 3.h),
          context.watch<AIRecordService>().enableVoice
              ? Container(
                  width: 320.w,
                  height: 228.h,
                  decoration: ShapeDecoration(
                    color: Color(0xFFFFFFF4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Column(children: [
                    SizedBox(height: 10.h),
                    Text(
                      '说话人',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF3E6546),
                        fontSize: 18.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 1.3,
                        letterSpacing: -0.41,
                      ),
                    ),
                    SizedBox(height: 10.h),
                    SizedBox(
                        width: 273.w,
                        height: 184.h,
                        child: Column(
                            children: List.generate(
                                5, (index) => buildVoiceType(context, index))))
                  ]))
              : Container(),
          // SizedBox(height: 10.h),
          context.watch<AIRecordService>().enableVoice
              ? Container(
                  width: 320.w,
                  height: 100.h,
                  decoration: ShapeDecoration(
                    color: Color(0xFFFFFFF4),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                  child: Column(children: [
                    Text(
                      '语速',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Color(0xFF3E6546),
                        fontSize: 18.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w700,
                        height: 0,
                        letterSpacing: -0.41,
                      ),
                    ),
                    SfSlider(
                      min: 0.0,
                      max: 4.0,
                      value: context.watch<AIRecordService>().speaking_speed,
                      interval: 2,
                      activeColor: Color(0xFF75A47F),
                      inactiveColor: Color(0x3375A47F),
                      showTicks: true,
                      showLabels: false,
                      enableTooltip: false,
                      minorTicksPerInterval: 1,
                      onChanged: (dynamic value) {
                        context.read<AIRecordService>().speaking_speed = value;
                        if (value < 0.2) value = 0.2;
                        Global.speaking_speed = value;
                      },
                    ),
                    Padding(
                        padding: EdgeInsets.fromLTRB(10.w, 0, 10.w, 0.h),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                '慢',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF3E6546),
                                  fontSize: 16.sp,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                  letterSpacing: -0.41,
                                ),
                              ),
                              Text(
                                '默认',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF3E6546),
                                  fontSize: 16.sp,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                  letterSpacing: -0.41,
                                ),
                              ),
                              Text(
                                '快',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                  color: Color(0xFF3E6546),
                                  fontSize: 16.sp,
                                  fontFamily: 'Inter',
                                  fontWeight: FontWeight.w400,
                                  height: 0,
                                  letterSpacing: -0.41,
                                ),
                              ),
                            ]))
                  ]))
              : Container(),
          // Expanded(child: Container()),
          // SizedBox(height: 10.h),
          // CustomButton(
          //     width: 80.w,
          //     height: 40.h,
          //     color: Color(0xFF75A47F),
          //     selected: true,
          //     needBorder: true,
          //     text: "确认",
          //     fontColor: Colors.white,
          //     fontSize: 18.sp,
          //     fontWeight: FontWeight.w700,
          //     onPress: () {
          //       Global.voice_type_index = voice_type_index;
          //       Global.speaking_speed = speaking_speed;
          //     }),
          //SizedBox(height: 10.h)
        ]));
  }

  buildVoiceType(BuildContext context, int index) {
    List<String> timbre = ['甜美女声', '播音女声', '童音女声', '播音男声', '童音男声'];
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          context.read<AIRecordService>().voice_type_index = index;
          Global.voice_type_index = index;
          // setState(() {
          //   context.watch<AIRecordService>().voice_type_index = index;
          // });
        },
        child: Container(
          width: 273.w,
          height: 34.h,
          decoration: ShapeDecoration(
            color: context.watch<AIRecordService>().voice_type_index == index
                ? Color(0x3375A47F)
                : Color(0xFFFFFFF4),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          child: Padding(
              padding: EdgeInsets.only(left: 20.w, right: 20.w),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      timbre[index],
                      style: TextStyle(
                        color: Color(0xFF3E6546),
                        fontSize: 18.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                        letterSpacing: -0.41,
                      ),
                    ),
                    context.watch<AIRecordService>().voice_type_index == index
                        ? Container(
                            width: 20.w,
                            height: 20.h,
                            decoration: const BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage("assets/images/speak.png"),
                                fit: BoxFit.fill,
                              ),
                            ),
                          )
                        : Container(),
                  ])),
        ));
  }
}
