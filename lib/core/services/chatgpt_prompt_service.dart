// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
// ignore_for_file: unused_import, unused_field, prefer_final_fields, no_leading_underscores_for_local_identifiers, avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart';
import 'package:memoirverse/core/hive/chat_prompt_model.dart';
import 'package:memoirverse/core/hive/hive_chat_prompt_model.dart';
import 'package:memoirverse/core/hive/hive_story_model.dart';
import 'package:memoirverse/core/services/db_service.dart';
import 'package:memoirverse/features/AI_record/chat/model/interview_prompt.dart';
import 'package:memoirverse/features/write_story/model/story_prompt.dart';
import 'package:memoirverse/utils/text_to_speech.dart';

import '../../global/app_constants.dart';

class ChatGPTPromptService extends ChangeNotifier {
  bool _responding = false;
  final Dio _dio = Dio();

  List<ChatPromptModel> _promptChat = [];
  List<ChatPromptModel> get chat => _promptChat;
  List<Map<String, dynamic>> _answers = [];
  String _chat_id = DateTime.now().millisecondsSinceEpoch.toString();
  String get chat_id => _chat_id;
  bool get responding => _responding;
  String _summary = "";
  String get summary => _summary;
  set summary(summary) {
    _summary = summary;
    notifyListeners();
  }

  String _topic = "";
  String get topic => _topic;
  set topic(topic) {
    _topic = topic;
    notifyListeners();
  }

  Map? _question;
  Map? get question => _question;
  set question(question) {
    _question = question;
    notifyListeners();
  }

  String _last_assistant = "";
  String get last_assistant => _last_assistant;
  set last_assistant(assistant) {
    _last_assistant = assistant;
    notifyListeners();
  }

  bool _need_speak = true;
  bool get need_speak => _need_speak;
  set need_speak(need_speak) {
    _need_speak = need_speak;
  }

  HiveStoryModel? _story;
  HiveStoryModel? get story => _story;
  set story(story) {
    _story = story;
    notifyListeners();
  }
  // InterviewType interview_type = InterviewType.no_topic;
  // StoryType story_type = StoryType.title;

  List<Map> _draft = [];
  set draft(draft) {
    _draft = draft;
    notifyListeners();
  }

  List<Map> get draft => _draft;
  int _draft_index = 0;
  int get draft_index => _draft_index;
  set draft_index(index) {
    _draft_index = index;
    notifyListeners();
  }

  _changeLoadingState() {
    _responding = !_responding;
    notifyListeners();
  }

  startNewChat({required String topic, required Map? question}) {
    _chat_id = DateTime.now().millisecondsSinceEpoch.toString();
    _topic = topic;
    _question = question;
    String system_prompt = "";
    if (question == null) {
      system_prompt = InterviewPromptModel.no_topic_system_prompt;
    } else {
      system_prompt = InterviewPromptModel.topic_system_prompt;
      system_prompt = system_prompt.replaceFirst(
          "{question_summary}", question!["summary"]);
      system_prompt =
          system_prompt.replaceFirst("{question}", question!["detail"]);
      system_prompt =
          system_prompt.replaceFirst("{prompt}", question!["prompt"]);
    }
    _answers.clear();
    _promptChat.clear();
    _answers.add({"role": "system", "content": system_prompt});
    if (question == null) {
      _answers
          .add({"role": "assistant", "content": AppConstants.noTopic_hello});
      _sendNewTextToChatGPT(
          text: AppConstants.noTopic_hello, sender: "assistant");
      _last_assistant = AppConstants.noTopic_hello;
    } else {
      _answers.add({"role": "assistant", "content": "${question!["detail"]}"});
      _sendNewTextToChatGPT(text: question!["detail"], sender: "assistant");
      _last_assistant = question!["detail"];
    }
  }

  openChatHistory(String chat_id) {
    _chat_id = chat_id;
    final LocalDBService _dbService = LocalDBService();
    HiveChatPromptModel? chat = _dbService.chatHistory.get(chat_id);
    if (chat == null) return;
    _promptChat = chat.chat!;
    _topic = chat.topic;
    //if (chat_history == null) return;
    _answers.clear();
    _answers.add({"role": "system", "content": chat.systemPrompt});
    for (int i = 0; i < _promptChat.length; i++) {
      String role = _promptChat[i].sender!;
      String text = _promptChat[i].text!;
      _answers.add({"role": role, "content": text});
      if (role == "assistant") {
        _last_assistant = text!;
      }
    }
  }

  sendPrompt({required String prompt}) async {
    if (_responding == true || prompt.isEmpty) return;
    _changeLoadingState();
    try {
      _sendNewTextToChatGPT(text: prompt, sender: "user");
      //_answers array is history data to send back to Chat-GPT for conversation continuity
      List message = [
        {"role": "system", "content": "你是豆包，是由字节跳动开发的 AI 人工智能助手"},
        {"role": "user", "content": "常见的十字花科植物有哪些？"},
      ];
      //message.add({"role": "user", "content": prompt});
      var response = await _dio.post(
        AppConstants.doubao_api_url,
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
                "Bearer ${AppConstants.doubao_api_key}",
          },
        ),
        data: {
          "model": AppConstants.DOUBAO_MODEL,
          "messages": message,
        },
      );
      if (response.statusCode == 200) {
        String content = response.data['choices'][0]['message']['content']
            .toString()
            .trim()
            .replaceAll('\n', '');
        _sendNewTextToChatGPT(text: content, sender: "assistant");
        _answers.add({"role": "assistant", "content": content});
        _changeLoadingState();
        notifyListeners();
      }
    } on DioException catch (err) {
      //print(_answers);
      if (kDebugMode) {
        print("catch $err");
      }

      _changeLoadingState();
    }
  }

  sendInterviewPrompt({
    required String prompt,
    required Function(String) onQuestion,
  }) async {
    if (_responding == true || prompt.isEmpty) return;
    _changeLoadingState();

    _sendNewTextToChatGPT(text: prompt, sender: "user");
    //_answers array is history data to send back to Chat-GPT for conversation continuity
    _answers.add({"role": "user", "content": "$prompt"});

    final openAI = OpenAI.instance.build(
        apiUrl: AppConstants.doubao_api_url,
        token: AppConstants.doubao_api_key,
        baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)),
        enableLog: true);
    final request = ChatCompleteText(
        messages: _answers,
        maxToken: 200,
        model: ChatModelFromValue(model: AppConstants.DOUBAO_MODEL));
    final response = await openAI.onChatCompletion(request: request);
    for (var element in response!.choices) {
      String? content = element.message?.content;
      if (content == null) break;
      print("data -> ${element.message?.content}");
      _sendNewTextToChatGPT(text: content, sender: "assistant");
      _answers.add({"role": "assistant", "content": content});
      _last_assistant = content;
      onQuestion(content);
    }

    _changeLoadingState();
    notifyListeners();
  }

  sendGenerateDraftTitlePrompt() async {
    List<Map<String, dynamic>> messages = [];
    String user_prompt = StoryPromptModel.title_user_prompt;
    user_prompt =
        user_prompt.replaceFirst("{draft}", draft[draft_index]["content"]);
    messages.add({"role": "user", "content": user_prompt});
    final openAI = OpenAI.instance.build(
        apiUrl: AppConstants.moonshot_api_url,
        token: AppConstants.moonshot_api_key,
        baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 100)),
        enableLog: true);
    final request = ChatCompleteText(
        messages: messages,
        maxToken: 2000,
        model: ChatModelFromValue(model: AppConstants.MOONSHOT_MODEL));
    final response = await openAI.onChatCompletion(request: request);
    for (var element in response!.choices) {
      print("data -> ${element.message?.content}");
      Map<String, dynamic> title_json = jsonDecode(element.message!.content);
      draft[draft_index]["title"] = title_json["title"];
      notifyListeners();
    }
  }

  sendGenerateSummaryPrompt() async {
    List<Map<String, dynamic>> messages = [];
    String user_prompt = StoryPromptModel.summary_user_prompt;
    String chat_history = _buildChatHistoryForArticle();
    user_prompt =
        user_prompt.replaceFirst("{conversation_history}", chat_history);
    messages.add({"role": "user", "content": user_prompt});
    final openAI = OpenAI.instance.build(
        apiUrl: AppConstants.moonshot_api_url,
        token: AppConstants.moonshot_api_key,
        baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 100)),
        enableLog: true);
    final request = ChatCompleteText(
        messages: messages,
        maxToken: 2000,
        model: ChatModelFromValue(model: AppConstants.MOONSHOT_MODEL));
    final response = await openAI.onChatCompletion(request: request);
    for (var element in response!.choices) {
      print("data -> ${element.message?.content}");
      summary = element.message?.content;
      return summary;
    }
    return "";
  }

  sendGenerateDraftPrompt() {
    List<Map<String, dynamic>> messages = [];
    String system_prompt = StoryPromptModel.draft_system_prompt;
    String user_prompt = StoryPromptModel.draft_user_prompt;
    String chat_history = _buildChatHistoryForArticle();
    user_prompt =
        user_prompt.replaceFirst("{conversation_history}", chat_history);
    messages.add({"role": "system", "content": system_prompt});
    messages.add({"role": "user", "content": user_prompt});
    final openAI = OpenAI.instance.build(
        apiUrl: AppConstants.moonshot_api_url,
        token: AppConstants.moonshot_api_key,
        baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 300)),
        enableLog: true);
    final request = ChatCompleteText(
        messages: messages,
        maxToken: 2000,
        model: ChatModelFromValue(model: AppConstants.MOONSHOT_MODEL));
    draft.insert(draft_index, {"title": "", "content": ""});
    openAI.onChatCompletionSSE(request: request).listen((it) {
      if (it.choices == null) return;
      debugPrint(it.choices!.last.message?.content);
      draft[draft_index]["content"] += it.choices!.last.message?.content;
      notifyListeners();
    });
  }

  deleteDraft() {
    draft.removeAt(draft_index);
    draft_index -= draft_index;
    if (draft_index < 0) draft_index = 0;
    notifyListeners();
  }

  generateStory() {
    HiveStoryModel hiveStory = HiveStoryModel(
        id: _chat_id,
        title: draft[draft_index]["title"] ?? "",
        topic: topic,
        paragraph: draft[draft_index]["content"].split("\n\n"));
    story = hiveStory;
  }

  insertParagraph(int index, String content) {
    _story?.paragraph.insert(index + 1, content);
    notifyListeners();
  }

  updateParagraph(int index, String content) {
    _story?.paragraph[index] = content;
    notifyListeners();
  }

  deleteParagraph(int index) {
    _story?.paragraph.removeAt(index);
    notifyListeners();
  }

  clearChat() {
    _promptChat.clear();
    _answers.clear();
    notifyListeners();
  }

  //chat history to array
  _chatHistory() {
    List<ChatPromptModel> chat = [];
    var chatArray = chat.map((c) => {"role": c.sender, "message": c.text});
  }

  String _buildChatHistoryForArticle() {
    StringBuffer chat_history = StringBuffer();
    for (int i = 0; i < chat.length; i++) {
      if (chat[i].sender == "user") {
        chat_history.write("[用户]：");
        chat_history.write(chat[i].text);
        chat_history.write("\n\n");
      } else if (chat[i].sender == "assistant") {
        chat_history.write("[采访者]：");
        chat_history.write(chat[i].text);
      }
    }
    return chat_history.toString();
  }

  /////////////////////////////////
  // Saves Chat History To Hive //
  ///////////////////////////////
  void _sendNewTextToChatGPT({required String text, required String sender}) {
    ChatPromptModel prompt =
        ChatPromptModel(text: text, sender: sender, date: DateTime.now());
    _promptChat.add(prompt);
    notifyListeners();
  }

  saveChatHistory() async {
    String summary = await sendGenerateSummaryPrompt();
    final LocalDBService _dbService = LocalDBService();
    _dbService.saveChatHistory(
        id: chat_id,
        systemPrompt: _answers[0]["content"],
        title: "",
        summary: summary,
        topic: topic,
        chat: _promptChat);
  }

  deleteChatHistory() {
    final LocalDBService _dbService = LocalDBService();
    _dbService.deleteChatHistory(key: chat_id);
    clearChat();
  }
}
