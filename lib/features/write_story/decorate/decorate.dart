// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:memoirverse/features/write_story/decorate/widget/decorate_body.dart';
// import 'package:memoirverse/features/write_story/decorate/widget/decorate_bottom.dart';
// import 'package:memoirverse/features/write_story/decorate/widget/decorate_head.dart';
// import 'package:memoirverse/features/write_story/edit/widget/story_edit_head.dart';
// import 'package:memoirverse/features/write_story/edit/widget/stroy_edit_body.dart';

// class DecoratePage extends StatelessWidget {
//   const DecoratePage({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Stack(children: [
//       Container(
//           width: 390.w,
//           height: 844.h,
//           clipBehavior: Clip.antiAlias,
//           decoration: BoxDecoration(color: Color(0xFFEEF2E2)),
//           child: Column(children: [
//             SizedBox(height: 28.h),
//             const DecorateHeadWidget(),
//             const Expanded(child: DecorateBodyWidget()),
//             SizedBox(height: 10.h),
//             //const DecorateBottomWidget(),
//             //SizedBox(height: 36.h)
//           ])),
//       Positioned(
//           bottom: 30,
//           child: Container(
//               width: 390.w, child: Center(child: DecorateBottomWidget())))
//     ]));
//   }
// }
