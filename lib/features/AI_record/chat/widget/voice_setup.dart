import 'package:flutter/material.dart';
import 'package:flutter_popup/flutter_popup.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/components/custom_button.dart';
import 'package:memoirverse/global/global.dart';
import 'package:memoirverse/services/AIRecordService.dart';
import 'package:memoirverse/services/WriteStoryService.dart';
import 'package:provider/provider.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class VoiceSetupWidget extends StatefulWidget {
  const VoiceSetupWidget({Key? key}) : super(key: key);

  @override
  _VoiceSetupWidgetState createState() => _VoiceSetupWidgetState();
}

class _VoiceSetupWidgetState extends State {
  int voice_type_index = 0;
  double speaking_speed = 2;
  @override
  void initState() {
    print("initState");
    voice_type_index = Global.voice_type_index;
    speaking_speed = Global.speaking_speed;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        width: 280.w,
        height: 444.h,
        decoration: ShapeDecoration(
          color: Color(0xFFFCFDFA),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        ),
        child: Column(children: [
          Container(
              width: 248.w,
              height: 248.h,
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
                    width: 180.w,
                    height: 184.h,
                    child: Column(
                        children: List.generate(
                            5, (index) => buildTimbre(context, index))))
              ])),
          SizedBox(height: 10.h),
          Container(
              width: 248.w,
              height: 102.h,
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
                  value: speaking_speed,
                  interval: 2,
                  activeColor: Color(0xFF75A47F),
                  inactiveColor: Color(0x3375A47F),
                  showTicks: true,
                  showLabels: false,
                  enableTooltip: false,
                  minorTicksPerInterval: 1,
                  onChanged: (dynamic value) {
                    setState(() {
                      speaking_speed = value;
                    });
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
              ])),
          Expanded(child: Container()),
          SizedBox(height: 10.h),
          CustomButton(
              width: 80.w,
              height: 40.h,
              color: Color(0xFF75A47F),
              selected: true,
              needBorder: true,
              text: "确认",
              fontColor: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              onPress: () {
                Global.voice_type_index = voice_type_index;
                Global.speaking_speed = speaking_speed;
              }),
          SizedBox(height: 10.h)
        ]));
  }

  buildTimbre(BuildContext context, int index) {
    List<String> timbre = ['甜美女声', '播音女声', '童音女声', '播音男声', '童音男声'];
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          context.read<AIRecordService>().speaking_speed = index;
          setState(() {
            voice_type_index = index;
          });
        },
        child: Container(
          width: 212.w,
          height: 34.h,
          decoration: ShapeDecoration(
            color: voice_type_index == index
                ? Color(0x3375A47F)
                : Color(0xFFFFFFF4),
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(5)),
          ),
          child: Row(mainAxisAlignment: MainAxisAlignment.center, children: [
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
            voice_type_index == index
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
                : Container()
          ]),
        ));
  }
}
