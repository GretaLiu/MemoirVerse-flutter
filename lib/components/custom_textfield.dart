import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextField extends StatelessWidget {
  final TextEditingController controller;
  //final String name;
  //final IconData prefixIcon;
  final bool obscureText;
  final TextCapitalization textCapitalization;
  final TextInputType inputType;
  final Color background_color;
  final String hintText;
  final double fontSize;

  bool autofocus = false;

  FocusNode? focusNode;
  Color fontColor;

  CustomTextField({
    Key? key,
    required this.controller,
    //required this.name,
    required this.hintText,
    //required this.prefixIcon,
    required this.background_color,
    this.obscureText = false,
    this.textCapitalization = TextCapitalization.none,
    this.autofocus = false,
    this.focusNode = null,
    this.fontColor = const Color(0xFF919AB4),
    this.fontSize = 20,
    required this.inputType,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      //margin: const EdgeInsets.only(bottom: 15),
      child: TextField(
        enabled: true,
        controller: controller,
        textCapitalization: textCapitalization,
        //maxLength: 32,
        focusNode: focusNode,
        maxLines: 32,
        minLines: 1,
        obscureText: obscureText,
        keyboardType: inputType,
        cursorColor: Color(0xFF919AB4),
        cursorHeight: 20,
        cursorWidth: 3,
        cursorRadius: Radius.circular(10),
        textAlign: TextAlign.start,
        autofocus: autofocus,
        style: TextStyle(
          color: fontColor,
          fontSize: fontSize.sp,
          fontFamily: 'Inter',
          fontWeight: FontWeight.w400,
          height: 1.3,
          letterSpacing: -0.41,
        ),
        decoration: InputDecoration(
          //prefixIcon: Icon(prefixIcon),
          isDense: true,
          //
          //labelText: name,
          hintText: hintText,
          counterText: "",
          labelStyle: const TextStyle(color: Colors.grey),
          filled: true,
          fillColor: background_color,
          //隐藏下划线
          border: InputBorder.none,
          hintStyle: TextStyle(
            color: Color(0xFF919AB4),
            fontSize: 20.sp,
            fontFamily: 'Inter',
            fontWeight: FontWeight.w400,
            height: 1.3,
            letterSpacing: -0.41,
          ),
          //contentPadding:
          //    const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
          // border: const OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.green),
          //   borderRadius: BorderRadius.all(Radius.circular(10)),
          // ),
          // focusedBorder: const OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.green),
          //   borderRadius: BorderRadius.all(Radius.circular(10)),
          // ),
          // enabledBorder: const OutlineInputBorder(
          //   borderSide: BorderSide(color: Colors.green),
          //   borderRadius: BorderRadius.all(Radius.circular(10)),
          // ),
        ),
      ),
    );
  }
}
