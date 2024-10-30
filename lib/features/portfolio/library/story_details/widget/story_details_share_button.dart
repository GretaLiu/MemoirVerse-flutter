import 'dart:io';
import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:memoirverse/components/custom_button.dart';
import 'package:open_file/open_file.dart';
import 'package:uri_to_file/uri_to_file.dart';

class StoryDetailsShareButton extends StatelessWidget {
  StoryDetailsShareButton({super.key, required this.storyKey});
  GlobalKey storyKey;
  @override
  Widget build(BuildContext context) {
    return PopupMenuButton(
      color: Colors.white,
      offset: Offset(50.0.w, -110.0.h),
      shape: RoundedRectangleBorder(
          side: BorderSide(width: 1, color: Color(0x66807D7D)),
          borderRadius: BorderRadius.circular(15)),
      itemBuilder: (BuildContext context) {
        return <PopupMenuEntry<String>>[
          PopupMenuItem(
              value: "share",
              child: Padding(
                  padding: EdgeInsets.fromLTRB(13.w, 15.h, 13.w, 10.h),
                  child: Row(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Container(
                          width: 20.w,
                          height: 20.w,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                              image: AssetImage("assets/images/wechat.png"),
                              fit: BoxFit.fill,
                            ),
                          ),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          '分享到微信',
                          style: TextStyle(
                            decoration: TextDecoration.none,
                            color: Color(0xFF3E6546),
                            fontSize: 18.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 1.3,
                            letterSpacing: -0.41,
                          ),
                        ),
                      ]))),
          const PopupMenuDivider(),
          PopupMenuItem(
              value: "image",
              child: Padding(
                  padding: EdgeInsets.fromLTRB(13.w, 10.h, 13.w, 15.h),
                  child: Row(children: [
                    Container(
                      width: 18.w,
                      height: 18.w,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/download.png"),
                          fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    SizedBox(width: 10.w),
                    Text(
                      '保存为图片',
                      style: TextStyle(
                        decoration: TextDecoration.none,
                        color: Color(0xFF3E6546),
                        fontSize: 18.sp,
                        fontFamily: 'Inter',
                        fontWeight: FontWeight.w400,
                        height: 1.3,
                        letterSpacing: -0.41,
                      ),
                    ),
                  ])))
        ];
      },
      icon: IgnorePointer(
          child: CustomButton(
              width: 142.w,
              height: 40.h,
              color: Color(0xFF75A47F),
              selected: true,
              needBorder: true,
              text: "分享",
              fontColor: Colors.white,
              fontSize: 18.sp,
              fontWeight: FontWeight.w700,
              onPress: () {})),
      onSelected: (dynamic value) {
        if (value == "share") {
        } else if (value == "image") {
          _captureAndSave(context);
        }
      },
    );
  }

  Future<void> _captureAndSave(BuildContext context) async {
    try {
      // 1) capture logic
      RenderRepaintBoundary boundary =
          storyKey.currentContext!.findRenderObject() as RenderRepaintBoundary;
      ui.Image image = await boundary.toImage(pixelRatio: 10.0);
      ByteData? byteData =
          await image.toByteData(format: ui.ImageByteFormat.png);

      if (byteData != null) {
        Uint8List pngBytes = byteData.buffer.asUint8List();
        final result = await ImageGallerySaver.saveImage(pngBytes);
        print(result);
        if (result["isSuccess"]) {
          // // show success message
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(
              content: Text('保存故事图片成功'),
            ),
          );
          // Open the image file
          File file = await toFile(result["filePath"]);
          await OpenFile.open(file.path);
        }
      }
    } catch (e) {
      throw Exception(e);
    }
  }
}
