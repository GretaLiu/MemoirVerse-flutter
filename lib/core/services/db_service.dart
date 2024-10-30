import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:memoirverse/core/hive/hive_story_model.dart';

import '../hive/chat_prompt_model.dart';
import '../hive/hive_chat_prompt_model.dart';

class LocalDBService extends ChangeNotifier {
  Box<HiveChatPromptModel> get chatHistory => _chatBox;
  Box<HiveStoryModel> get storyHistory => _storyBox;

  final Box<HiveChatPromptModel> _chatBox = Hive.box('chatBox');
  final Box<HiveStoryModel> _storyBox = Hive.box('storyBox');

  /////////////////////////////////
  // Saves Chat History To Hive //
  ///////////////////////////////
  Future<bool> saveChatHistory(
      {required String id,
      required String systemPrompt,
      required String title,
      required String summary,
      required String topic,
      required List<ChatPromptModel> chat}) async {
    HiveChatPromptModel hivePromptModel = HiveChatPromptModel(
        id: id,
        systemPrompt: systemPrompt,
        title: title,
        summary: summary,
        topic: topic,
        date: DateTime.now(),
        chat: chat);
    await _chatBox.put(id, hivePromptModel);
    return true;
  }

  /////////////////////////////
  // Deletes Item From Hive //
  ///////////////////////////
  Future<void> deleteChatHistory({required key}) async {
    await _chatBox.delete(key);

    notifyListeners();
  }

  ///////////////////////////////////////
  // Saves Story To Hive //
  /////////////////////////////////////
  Future<void> saveStory(HiveStoryModel hiveStory) async {
    // HiveStoryModel hiveStoryModel = HiveStoryModel(
    //   id: id,
    //   title: "",
    //   date: DateTime.now(),
    //   paragraph: paragraph,
    // );
    String id = hiveStory.id;
    await _storyBox.put(id, hiveStory);
    notifyListeners();
  }
}
