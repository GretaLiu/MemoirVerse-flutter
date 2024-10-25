import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/services/AIRecordService.dart';
import 'package:provider/provider.dart';

class NoteHistoryWidget extends StatelessWidget {
  const NoteHistoryWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemBuilder: (BuildContext context, int index) {
          return buildNote(context, index); //每个item的布局
        },
        itemCount: context.watch<AIRecordService>().note_history.length);
  }

  Widget buildNote(BuildContext context, int index) {
    return Padding(
        padding: EdgeInsets.fromLTRB(7.0.w, 3.0.h, 16.0.w, 13.0.h),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            width: 156.w,
            height: 28.h,
            child: Text(
              context.watch<AIRecordService>().note_history[index]['time'],
              style: TextStyle(
                color: Colors.black,
                fontSize: 16.sp,
                fontFamily: 'Inder',
                fontWeight: FontWeight.w400,
                height: 0,
                letterSpacing: -0.41,
              ),
            ),
          ),
          IntrinsicHeight(
              child: Row(children: [
            VerticalDivider(
              width: 38.w,
              thickness: 2.w,
              indent: 0.w,
              endIndent: 0,
              color: Color(0xFFF5DAD2),
            ),
            Expanded(
                child: context.watch<AIRecordService>().note_history[index]
                            ["image"] ==
                        null
                    ? Container(
                        decoration: ShapeDecoration(
                          color: Color(0xFFFCFFE0),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          shadows: [
                            BoxShadow(
                              color: Color(0xB2BACD92),
                              blurRadius: 10.r,
                              offset: Offset(2.w, 2.h),
                              spreadRadius: 0,
                            )
                          ],
                        ),
                        child: Padding(
                            padding: EdgeInsets.all(12.w),
                            child: Text(
                              context
                                  .watch<AIRecordService>()
                                  .note_history[index]['note'],
                              style: TextStyle(
                                color: Colors.black,
                                fontSize: 18.sp,
                                fontFamily: 'Inder',
                                fontWeight: FontWeight.w400,
                                height: 0,
                                letterSpacing: -0.41,
                              ),
                            )))
                    : Row(mainAxisSize: MainAxisSize.min, children: [
                        Container(
                          width: 120.w,
                          height: 120.h,
                          decoration: ShapeDecoration(
                            image: DecorationImage(
                              image: AssetImage(context
                                  .watch<AIRecordService>()
                                  .note_history[index]['image']),
                              fit: BoxFit.fill,
                            ),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            shadows: const [
                              BoxShadow(
                                color: Color(0xB2BACD92),
                                blurRadius: 10,
                                offset: Offset(2, 2),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        )
                      ]))
          ]))
        ]));
  }
}
