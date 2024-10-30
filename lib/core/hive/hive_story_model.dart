import 'package:hive_flutter/hive_flutter.dart';

part 'hive_story_model.g.dart';

@HiveType(typeId: 3)
class HiveStoryModel {
  @HiveField(0)
  String id;
  @HiveField(1)
  String title;
  @HiveField(2)
  List<String> paragraph;
  @HiveField(3)
  String topic;
  @HiveField(4)
  int backgroundIndex = 0;
  @HiveField(5)
  DateTime? date;
  HiveStoryModel(
      {required this.id,
      required this.title,
      required this.topic,
      required this.paragraph,
      this.date,
      this.backgroundIndex = 0});
}
