import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:memoirverse/features/write_story/decorate/widget/decorate_background.dart';
import 'package:memoirverse/services/WriteStoryService.dart';
import 'package:provider/provider.dart';

class StoryDetailsBodyWidget extends StatelessWidget {
  const StoryDetailsBodyWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      const SizedBox(height: 10),
      Expanded(
          child: SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.all(10.w),
                  child: Container(
                    width: 356.w,
                    decoration: ShapeDecoration(
                      image: DecorationImage(
                        image: AssetImage(context
                                .watch<WriteStoryService>()
                                .decorate_background[
                            context
                                .watch<WriteStoryService>()
                                .decorate_background_index]),
                        fit: BoxFit.fill,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(15),
                      ),
                      shadows: const [
                        BoxShadow(
                          color: Color(0x7F7F7C7C),
                          blurRadius: 4,
                          offset: Offset(0, 2),
                          spreadRadius: 0,
                        )
                      ],
                    ),
                    child: Padding(
                        padding:
                            EdgeInsets.fromLTRB(19.0.w, 10.0.h, 11.0.w, 10.h),
                        child: Text(
                          '在那个被雾气笼罩的童年时光里，郝音素是我不可分割的小伙伴。她胆小，学骑自行车这样的小事在她看来都是一场巨大的冒里，郝音素是我不可分割的小伙伴。她胆小，学骑自行车这样的小事在她看来都是一场巨大的冒险。而我，早已在风中驰骋，却甘愿放慢脚步，成为她坚实的后盾。每当下雨，泥巴路变得泥泞不堪，我们便弃车步行，那是一段遥远却美好的上学路。我们的笑声在浓雾中回荡，眉毛上的霜花仿佛圣诞老人的胡须，让我们的世界充满了童话般的温暖。险。而我，早已在风中驰骋，却甘愿放慢脚步，成为她坚实的后盾。每当下雨，泥巴路变得泥泞不堪，我们便弃车步行，\n那是一段遥远却美好的上学路。我们的笑声在浓雾中回荡，眉毛上的霜花仿佛圣诞老人的胡须，让我们的世界充满了童话般的温暖。   记得有一次，音素因病无法骑车，我翘课送她回家。那一次，她眼中闪烁着坚定的光芒，下定决心要学会骑车。终于，在初中时她成功了，虽然只是能骑而不能停，每次上下车都需要依靠台阶或是我的帮助。我总是骑得稍快，然后在前面等她，她那慌张中带着胜利的呼喊，至今回响在我耳边。   那段日子里，我成了她的守护者，一种自豪感油然而生。我陪着她，一个学期又一个学期，风雨无阻。她心中的温暖，我眼中的自豪，在那个被雾气笼罩的童年时光里，郝音素是我不可分割的小伙伴。她胆小，学骑自行车这样的小事在她看来都是一场巨大的冒里，郝音素是我不可分割的小伙伴。她胆小，学骑自行车这样的小事在她看来都是一场巨大的冒险。而我，早已在风中驰骋，却甘愿放慢脚步，成为她坚实的后盾。每当下雨，泥巴路变得泥泞不堪，我们便弃车步行，那是一段遥远却美好的上学路。我们的笑声在浓雾中回荡，眉毛上的霜花仿佛圣诞老人的胡须，让我们的世界充满了童话般的温暖。险。而我，早已在风中驰骋，却甘愿放慢脚步，成为她坚实的后盾。每当下雨，泥巴路变得泥泞不堪，我们便弃车步行，\n那是一段遥远却美好的上学路。我们的笑声在浓雾中回荡，眉毛上的霜花仿佛圣诞老人的胡须，让我们的世界充满了童话般的温暖。   记得有一次，音素因病无法骑车，我翘课送她回家。那一次，她眼中闪烁着坚定的光芒，下定决心要学会骑车。终于，在初中时她成功了，虽然只是能骑而不能停，每次上下车都需要依靠台阶或是我的帮助。我总是骑得稍快，然后在前面等她，她那慌张中带着胜利的呼喊，至今回响在我耳边。   那段日子里，我成了她的守护者，一种自豪感油然而生。我陪着她，一个学期又一个学期，风雨无阻。她心中的温暖，我眼中的自豪，成为了我们友谊最坚实的桥梁。   然而，随着岁月的流逝，我们各自踏上了不同',
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.sp,
                            fontFamily: 'Inter',
                            fontWeight: FontWeight.w400,
                            height: 1.3,
                            letterSpacing: -0.41,
                          ),
                        )),
                  ))))
    ]);
  }
}
