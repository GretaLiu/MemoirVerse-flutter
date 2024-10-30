import 'package:hive_flutter/adapters.dart';
import 'package:hive_flutter/hive_flutter.dart';

import 'chat_prompt_model.dart';
part 'hive_chat_prompt_model.g.dart';

@HiveType(typeId: 1)
class HiveChatPromptModel {
  @HiveField(0)
  String id;
  @HiveField(1)
  String systemPrompt;
  @HiveField(2)
  String title;
  @HiveField(3)
  String summary;
  @HiveField(4)
  String topic;
  @HiveField(5)
  DateTime? date;
  @HiveField(6)
  List<ChatPromptModel>? chat;
  HiveChatPromptModel(
      {required this.id,
      required this.systemPrompt,
      required this.title,
      required this.summary,
      required this.topic,
      this.date,
      this.chat});
}
