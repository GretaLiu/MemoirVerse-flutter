// ignore_for_file: depend_on_referenced_packages

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart' show dotenv;
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hive_flutter/adapters.dart';
import 'package:memoirverse/core/hive/chat_prompt_model.dart';
import 'package:memoirverse/core/hive/hive_chat_prompt_model.dart';
import 'package:memoirverse/core/hive/hive_story_model.dart';
import 'package:memoirverse/core/services/chatgpt_prompt_service.dart';
import 'package:memoirverse/core/services/db_service.dart';
import 'package:memoirverse/features/user/welcome.dart';
import 'package:memoirverse/global/app_constants.dart';
import 'package:memoirverse/services/AIRecordService.dart';
import 'package:memoirverse/services/HomeService.dart';
import 'package:memoirverse/services/PortfolioService.dart';
import 'package:memoirverse/services/UserService.dart';
import 'package:memoirverse/services/WriteStoryService.dart';
import 'package:provider/provider.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:get_storage/get_storage.dart';

Future<void> main() async {
  SystemChrome.setSystemUIOverlayStyle(const SystemUiOverlayStyle(
    statusBarColor: Colors.transparent,
  ));
  await dotenv.load(fileName: ".env");
  await GetStorage.init();
  await Hive.initFlutter();
  await openBox();

  runApp(
    MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => HomeService()),
          ChangeNotifierProvider(create: (context) => AIRecordService()),
          ChangeNotifierProvider(create: (context) => UserService()),
          ChangeNotifierProvider(create: (context) => WriteStoryService()),
          ChangeNotifierProvider(create: (context) => PortfolioService()),
          ChangeNotifierProvider(create: (context) => ChatGPTPromptService()),
          ChangeNotifierProvider(create: (context) => LocalDBService()),
        ],
        builder: (context, child) {
          return const MyApp();
        }
        //child: const MyApp(),
        ),
  );
  initApp(BuildContext context) {
    final box = GetStorage();
    // ignore: non_constant_identifier_names
    List<String>? selected_topic_list =
        box.read(AppConstants.selected_topic_list_key);
    if (selected_topic_list != null) {
      context.read<AIRecordService>().selected_topic_list = selected_topic_list;
    }
  }
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
        designSize: const Size(390, 844),
        minTextAdapt: true,
        splitScreenMode: true,
        builder: (context, child) {
          return MaterialApp(
            title: 'Flutter Demo',
            theme: ThemeData(
              colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
              useMaterial3: true,
            ),
            home:
                const WelcomePage(), //const LandingPage() //const WelcomePage(),
            localizationsDelegates: const [
              GlobalMaterialLocalizations.delegate,
              GlobalWidgetsLocalizations.delegate,
            ],
            supportedLocales: const [
              Locale('zh', 'CH'),
              Locale('en', 'US'),
            ],
          );
        });
  }
}

Future<void> openBox() async {
  Hive.registerAdapter(HiveChatPromptModelAdapter());
  Hive.registerAdapter(ChatPromptModelAdapter());
  Hive.registerAdapter(HiveStoryModelAdapter());
  await Hive.openBox<HiveChatPromptModel>('chatBox');
  await Hive.openBox<HiveStoryModel>('storyBox');
}
