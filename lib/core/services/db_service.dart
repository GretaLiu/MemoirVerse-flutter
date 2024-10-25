import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';

import '../hive/chat_prompt_model.dart';
import '../hive/hive_chat_prompt_model.dart';

class LocalDBService extends ChangeNotifier {
  Box<HiveChatPromptModel> get chatHistory => _chatBox;

  final Box<HiveChatPromptModel> _chatBox = Hive.box('chatBox');

  /////////////////////////////////
  // Saves Chat History To Hive //
  ///////////////////////////////
  Future<bool> saveChatHistory(
      {required String title, required List<ChatPromptModel> chat}) async {
    HiveChatPromptModel hivePromptModel =
        HiveChatPromptModel(title: title, date: DateTime.now(), chat: chat);
    await _chatBox.add(hivePromptModel);
    return true;
  }

  /////////////////////////////
  // Deletes Item From Hive //
  ///////////////////////////
  Future<void> deletePrompt({required key}) async {
    await _chatBox.delete(key);

    notifyListeners();
  }
}
