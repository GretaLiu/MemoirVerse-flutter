// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:memoirverse/core/services/chatgpt_prompt_service.dart';
// import 'package:memoirverse/services/WriteStoryService.dart';
// import 'package:provider/provider.dart';

// class DecorateBackgroundWidget extends StatelessWidget {
//   const DecorateBackgroundWidget({super.key});

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 390.w,
//       height: 80.h,
//       decoration: BoxDecoration(color: Color(0x7FBACD92)),
//       child: ListView.builder(
//         padding: EdgeInsets.all(5.w),
//         shrinkWrap: true,
//         scrollDirection: Axis.horizontal,
//         itemCount: context.read<WriteStoryService>().decorate_background.length,
//         itemBuilder: (BuildContext context, int index) {
//           return GestureDetector(
//               behavior: HitTestBehavior.opaque,
//               onTap: () {
//                 context.read<ChatGPTPromptService>().story!.backgroundIndex =
//                     index;
//               },
//               child: Padding(
//                   padding: EdgeInsets.all(3),
//                   child: Container(
//                     width: 72.w,
//                     height: 102.h,
//                     decoration: ShapeDecoration(
//                       image: DecorationImage(
//                         image: AssetImage(context
//                             .read<WriteStoryService>()
//                             .decorate_background[index]),
//                         fit: BoxFit.fill,
//                       ),
//                       shape: RoundedRectangleBorder(
//                         side: BorderSide(
//                           width: context
//                                       .watch<ChatGPTPromptService>()
//                                       .story!
//                                       .backgroundIndex ==
//                                   index
//                               ? 2
//                               : 0,
//                           strokeAlign: BorderSide.strokeAlignOutside,
//                           color: Color(0xB275A47F),
//                         ),
//                       ),
//                       shadows: const [
//                         BoxShadow(
//                           color: Color(0x3F7F7C7C),
//                           blurRadius: 2,
//                           offset: Offset(2, 2),
//                           spreadRadius: 0,
//                         )
//                       ],
//                     ),
//                   )));
//         },
//       ),
//     );
//   }
// }
