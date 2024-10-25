import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/core/services/chatgpt_prompt_service.dart';
import 'package:memoirverse/services/WriteStoryService.dart';
import 'package:provider/provider.dart';

class DraftBodyWidget extends StatelessWidget {
  const DraftBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 10),
      SizedBox(
          width: 372.w,
          child: Wrap(
              alignment: WrapAlignment.start, children: buildTab(context))),
      Expanded(
          child: Container(
              width: 372.w,
              decoration: ShapeDecoration(
                color: Colors.white.withOpacity(0.5),
                shape: const RoundedRectangleBorder(
                  side: BorderSide(width: 1, color: Color(0x667F7C7C)),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    topRight: Radius.circular(10),
                  ),
                ),
              ),
              child: Column(children: [
                Padding(
                    padding: EdgeInsets.all(18.w),
                    child: DottedBorder(
                        borderType: BorderType.RRect,
                        radius: const Radius.circular(12),
                        padding: const EdgeInsets.all(6),
                        color: const Color(0x997F7C7C),
                        child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Padding(
                                  padding: EdgeInsets.all(18.w),
                                  child: Text(
                                    context.watch<ChatGPTPromptService>().draft[
                                        context
                                            .watch<ChatGPTPromptService>()
                                            .draft_index]["title"],
                                    style: TextStyle(
                                      color: Colors.black,
                                      fontSize: 20.sp,
                                      fontFamily: 'Inter',
                                      fontWeight: FontWeight.w400,
                                      height: 0.06,
                                      letterSpacing: -0.41,
                                    ),
                                  )),
                              GestureDetector(
                                  behavior: HitTestBehavior.opaque,
                                  onTap: () {
                                    context
                                        .read<ChatGPTPromptService>()
                                        .sendGenerateTitlePrompt();
                                  },
                                  child: Container(
                                    width: 22.w,
                                    height: 22.h,
                                    decoration: const BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage(
                                            "assets/images/refresh.png"),
                                        fit: BoxFit.fill,
                                      ),
                                    ),
                                  )),
                              //SizedBox(height: 20.w)
                            ]))),
                Expanded(
                    child: SingleChildScrollView(
                        padding: EdgeInsets.only(left: 22.0.w, right: 18.w),
                        child: Center(
                          child: Text(
                            context.watch<ChatGPTPromptService>().draft[context
                                .watch<ChatGPTPromptService>()
                                .draft_index]["title"],
                            style: TextStyle(
                              color: Colors.black,
                              fontSize: 20.sp,
                              fontFamily: 'Inter',
                              fontWeight: FontWeight.w400,
                              height: 1.3,
                              letterSpacing: 0.20,
                            ),
                          ),
                        ))),
                Align(
                    alignment: Alignment.bottomRight,
                    child: Padding(
                        padding: EdgeInsets.all(20),
                        child: Container(
                          width: 22.w,
                          height: 22.h,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/copy.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        )))
              ]))),
      SizedBox(height: 10.h),
    ]);
  }

  buildTab(BuildContext context) {
    return List.generate(context.watch<ChatGPTPromptService>().draft.length,
        (index) {
      return GestureDetector(
          behavior: HitTestBehavior.opaque,
          onTap: () {
            context.read<ChatGPTPromptService>().draft_index = index;
          },
          child: Container(
              width: context.read<ChatGPTPromptService>().draft_index == index
                  ? 160.w
                  : 100.w,
              height: 34.h,
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.5),
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(10),
                  topRight: Radius.circular(10),
                ),
                border: const Border(
                  left: BorderSide(width: 1, color: Color(0x667F7C7C)),
                  top: BorderSide(width: 1, color: Color(0x667F7C7C)),
                  right: BorderSide(width: 1, color: Color(0x667F7C7C)),
                  bottom: BorderSide(color: Color(0x667F7C7C)),
                ),
              ),
              child: Row(children: [
                Expanded(
                    child: Center(
                        child: Text(
                  "草稿${getChineseNum(index)}",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: context.read<ChatGPTPromptService>().draft_index ==
                            index
                        ? Color(0xFF7F7C7C)
                        : Color.fromARGB(255, 197, 196, 196),
                    fontSize: 16.sp,
                    fontFamily: 'Inter',
                    fontWeight: FontWeight.w400,
                    height: 0.11,
                    letterSpacing: 0.20,
                  ),
                ))),
                context.watch<ChatGPTPromptService>().draft_index == index
                    ? GestureDetector(
                        behavior: HitTestBehavior.opaque,
                        onTap: () {
                          context.read<ChatGPTPromptService>().deleteDraft();
                        },
                        child: Container(
                          width: 12.w,
                          height: 12.h,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/close.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ))
                    : Container(),
                SizedBox(width: 10.w)
              ])));
    });
  }

  String getChineseNum(int index) {
    List<String> chineseNum = [
      "一",
      "二",
      "三",
      "四",
      "五",
      "六",
      "七",
      "八",
      "九",
      "十"
    ];
    return chineseNum[index];
  }
}
