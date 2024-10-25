import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/main.dart';
import 'package:memoirverse/services/HomeService.dart';
import 'package:provider/provider.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 393.w,
        height: 96.h,
        decoration: BoxDecoration(
          color: Colors.white.withOpacity(0.5),
          border: const Border(
            left: BorderSide(),
            top: BorderSide(width: 1, color: Color(0xFFEFEFE7)),
            right: BorderSide(),
            bottom: BorderSide(),
          ),
        ),
        child: Padding(
            padding: EdgeInsets.fromLTRB(5.0.w, 12.0.h, 5.0.w, 0.0.h),
            child: Row(
                children: List.generate(
                    4, (index) => getBottomBarItem(context, index)))));
  }

  Widget getBottomBarItem(BuildContext context, int index) {
    List<Map> pages = context.watch<HomeService>().pages;
    return Expanded(
        child: GestureDetector(
            behavior: HitTestBehavior.opaque,
            onTap: () {
              context.read<HomeService>().selectedIndex = index;
            },
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Container(
                    width: 32.w,
                    height: 32.h,
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: AssetImage(pages[index][
                            context.watch<HomeService>().selectedIndex == index
                                ? "image_active"
                                : "image"]),
                        fit: BoxFit.fill,
                      ),
                    ),
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: 67.w,
                    height: 25.h,
                    child: Text(
                      pages[index]["title"],
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color:
                            context.watch<HomeService>().selectedIndex == index
                                ? Color(0xFF75A47F)
                                : Color(0xFF919AB4),
                        fontSize: 18.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w500,
                        height: 0.07,
                        letterSpacing: -0.41,
                      ),
                    ),
                  )
                ])));
  }
}
