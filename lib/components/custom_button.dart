import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomButton extends StatelessWidget {
  CustomButton({
    super.key,
    required this.width,
    required this.height,
    required this.color,
    this.borderColor = const Color(0xFF75A47F),
    required this.selected,
    required this.needBorder,
    required this.text,
    required this.fontColor,
    required this.fontSize,
    required this.fontWeight,
    required this.onPress,
  });
  final VoidCallback onPress;

  final double width;

  final double height;

  final Color color;

  final bool selected;
  final bool needBorder;

  final String text;
  final Color fontColor;
  final Color borderColor;

  final double fontSize;

  final FontWeight fontWeight;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
        behavior: HitTestBehavior.opaque,
        onTap: () {
          onPress();
        },
        child: Container(
            width: width,
            height: height,
            decoration: needBorder
                ? ShapeDecoration(
                    color: color,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0xFF75A47F)),
                      borderRadius: BorderRadius.circular(30),
                    ),
                  )
                : selected
                    ? ShapeDecoration(
                        color: color,
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
                      )
                    : null,
            child:
                Column(mainAxisAlignment: MainAxisAlignment.center, children: [
              Text(
                text,
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: fontColor,
                  fontSize: fontSize,
                  fontFamily: 'Inter',
                  fontWeight: fontWeight,
                  height: 1.3,
                  letterSpacing: -0.41,
                ),
              )
            ])));
  }
}
