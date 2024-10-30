// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:memoirverse/features/AI_record/chat/chat.dart';
// import 'package:memoirverse/features/landing/landing_page.dart';
// import 'package:memoirverse/features/write_story/draft/draft.dart';
// import 'package:memoirverse/features/write_story/edit/widget/story_edit_add_button.dart';
// import 'package:memoirverse/features/write_story/home/write_story.dart';
// import 'package:memoirverse/services/HomeService.dart';
// import 'package:provider/provider.dart';

// class DecorateBottomWidget extends StatelessWidget {
//   const DecorateBottomWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
//       GestureDetector(
//           behavior: HitTestBehavior.opaque,
//           onTap: () {
//             context.read<HomeService>().selectedIndex = 2;
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const LandingPage()),
//             );
//             // go to write story page
//           },
//           child: Container(
//               width: 142.w,
//               height: 40.h,
//               decoration: ShapeDecoration(
//                 color: Colors.white,
//                 shape: RoundedRectangleBorder(
//                   side: BorderSide(width: 1, color: Color(0xFF75A47F)),
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//               ),
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       '完成',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Color(0xFF75A47F),
//                         fontSize: 18.sp,
//                         fontFamily: 'Inter',
//                         fontWeight: FontWeight.w600,
//                         height: 0.07,
//                         letterSpacing: -0.41,
//                       ),
//                     ),
//                   ]))),
//       SizedBox(width: 15.w),
//       GestureDetector(
//           onTap: () {
//             Navigator.push(
//               context,
//               MaterialPageRoute(builder: (context) => const DraftPage()),
//             );
//           },
//           child: Container(
//               width: 142.w,
//               height: 40.h,
//               decoration: ShapeDecoration(
//                 color: Color(0xFF75A47F),
//                 shape: RoundedRectangleBorder(
//                   side: BorderSide(width: 1, color: Color(0xFF75A47F)),
//                   borderRadius: BorderRadius.circular(30),
//                 ),
//               ),
//               child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Text(
//                       '分享',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.white,
//                         fontSize: 18.sp,
//                         fontFamily: 'Inter',
//                         fontWeight: FontWeight.w700,
//                         height: 0.09,
//                         letterSpacing: 0.20,
//                       ),
//                     ),
//                   ]))),
//     ]);
//   }
// }
