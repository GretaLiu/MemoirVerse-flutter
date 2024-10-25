// ignore_for_file: public_member_api_docs, sort_constructors_first, non_constant_identifier_names
// ignore_for_file: unused_import, unused_field, prefer_final_fields, no_leading_underscores_for_local_identifiers, avoid_print

import 'dart:convert';
import 'dart:io';

import 'package:chat_gpt_sdk/chat_gpt_sdk.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'package:http/http.dart';
import 'package:memoirverse/core/hive/chat_prompt_model.dart';
import 'package:memoirverse/features/AI_record/chat/model/interview_prompt.dart';
import 'package:memoirverse/features/write_story/model/story_prompt.dart';
import 'package:memoirverse/utils/text_to_speech.dart';

import '../../global/app_constants.dart';

class ChatGPTPromptService extends ChangeNotifier {
  bool _responding = false;
  final Dio _dio = Dio();

  final List<ChatPromptModel> _promptChat = [];
  List<ChatPromptModel> get chat => _promptChat;
  List _answers = [
    {"role:": "system", "content": InterviewPromptModel.no_topic_system_prompt}
  ];

  bool get responding => _responding;
  String _AI_ask =
      "从工程师到仓库管理员的转变，听起来是一个很大的职业跳跃。您能分享一下，这个转变是如何发生的吗？您是如何适应这个新角色的？";
  String get AI_ask => _AI_ask;

  String _question_summary = "";
  String get question_summary => _question_summary;
  set question_summary(summary) {
    _question_summary = summary;
    notifyListeners();
  }

  String _question = "";
  String get question => _question;
  set question(question) {
    _question = question;
    notifyListeners();
  }

  String _question_prompt = "";
  String get question_prompt => _question_prompt;
  set question_prompt(prompt) {
    _question_prompt = prompt;
    notifyListeners();
  }

  bool _need_speak = true;
  bool get need_speak => _need_speak;
  set need_speak(need_speak) {
    _need_speak = need_speak;
  }

  InterviewType interview_type = InterviewType.no_topic;
  StoryType story_type = StoryType.title;

  List<Map> _draft = [
    {
      "title": "童年好友：郝素琴1",
      "content":
          "1在那个被雾气笼罩的童年时光里，郝音素是我不可分割的小伙伴。她胆小，学骑自行车这样的小事在她看来都是一场巨大的冒险。而我，早已在风中驰骋，却甘愿放慢脚步，成为她坚实的后盾。每当下雨，泥巴路变得泥泞不堪，我们便弃车步行，那是一段遥远却美好的上学路。我们的笑声在浓雾中回荡，眉毛上的霜花仿佛圣诞老人的胡须，让我们的世界充满了童话般的温暖。  记得有一次，音素因病无法骑车，我翘课送她回家。那一次，她眼中闪烁着坚定的光芒，下定决心要学会骑车。终于，在初中时她成功了，虽然只是能骑而不能停，每次上下车都需要依靠台阶或是我的帮助。我总是骑"
    },
    {
      "title": "童年好友：郝素琴2",
      "content":
          "2在那个被雾气笼罩的童年时光里，郝音素是我不可分割的小伙伴。她胆小，学骑自行车这样的小事在她看来都是一场巨大的冒险。而我，早已在风中驰骋，却甘愿放慢脚步，成为她坚实的后盾。每当下雨，泥巴路变得泥泞不堪，我们便弃车步行，那是一段遥远却美好的上学路。我们的笑声在浓雾中回荡，眉毛上的霜花仿佛圣诞老人的胡须，让我们的世界充满了童话般的温暖。  记得有一次，音素因病无法骑车，我翘课送她回家。那一次，她眼中闪烁着坚定的光芒，下定决心要学会骑车。终于，在初中时她成功了，虽然只是能骑而不能停，每次上下车都需要依靠台阶或是我的帮助。我总是骑"
    }
  ];
  set draft(draft) {
    _draft[draft_index]["content"] = draft;
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

  sendInterviewPrompt({
    required String prompt,
    required Function(String) onQuestion,
  }) async {
    if (_responding == true || prompt.isEmpty) return;
    _changeLoadingState();
    try {
      String system_prompt = "";
      if (interview_type == InterviewType.no_topic) {
        system_prompt = InterviewPromptModel.no_topic_system_prompt;
      } else {
        system_prompt = InterviewPromptModel.topic_system_prompt;
        system_prompt =
            system_prompt.replaceFirst("{question_summary}", question_summary);
        system_prompt = system_prompt.replaceFirst("{question}", question);
        system_prompt = system_prompt.replaceFirst("{prompt}", question_prompt);
      }
      _answers[0]["content"] = system_prompt;
      _sendNewTextToChatGPT(text: prompt, sender: "user");
      //_answers array is history data to send back to Chat-GPT for conversation continuity
      _answers.add({"role": "user", "content": prompt});

      var response = await _dio.post(
        'https://api.openai.com/v1/chat/completions',
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
                "Bearer ${AppConstants.doubao_api_key}",
          },
        ),
        data: {
          "model": AppConstants.DOUBAO_MODEL,
          "messages": _answers,
        },
      );
      if (response.statusCode == 200) {
        String content =
            response.data['choices'][0]['message']['content'].toString().trim();
        //.replaceAll('\n', '');
        _sendNewTextToChatGPT(text: content, sender: "assistant");
        _answers.add({"role": "assistant", "content": content});
        _AI_ask = content;
        onQuestion(content);
        _changeLoadingState();
        notifyListeners();
      }
    } on DioException catch (err) {
      print(_answers);
      if (kDebugMode) {
        print("catch $err");
      }

      _changeLoadingState();
    }
  }

  sendStroyPrompt() async {
    if (_responding == true) return;
    _changeLoadingState();
    try {
      List messages = [];
      String system_prompt = "";
      String user_prompt = "";
      if (story_type == StoryType.title) {
        user_prompt = StoryPromptModel.title_user_prompt;
        String chat_history = _buildChatHistoryForArticle();
        user_prompt =
            user_prompt.replaceFirst("{conversation_history}", chat_history);
        messages.add({"role": "user", "content": "${user_prompt}"});
      } else if (story_type == StoryType.summary) {
        user_prompt = StoryPromptModel.summary_user_prompt;
        user_prompt =
            user_prompt.replaceFirst("{draft}", draft[draft_index]["content"]);
        messages.add({"role": "user", "content": "${user_prompt}"});
      } else {
        system_prompt = StoryPromptModel.article_system_prompt;
        user_prompt = StoryPromptModel.article_user_prompt;
        String chat_history = _buildChatHistoryForArticle();
        user_prompt =
            user_prompt.replaceFirst("{conversation_history}", chat_history);
        messages.add({"role": "system", "content": "${system_prompt}"});
        messages.add({"role": "user", "content": "${user_prompt}"});
      }

      var response = await _dio.post(
        'https://api.openai.com/v1/chat/completions',
        options: Options(
          headers: {
            HttpHeaders.contentTypeHeader: "application/json",
            HttpHeaders.authorizationHeader:
                "Bearer ${AppConstants.moonshot_api_key}",
          },
        ),
        data: {
          "model": AppConstants.MOONSHOT_MODEL,
          "messages": messages,
        },
      );
      if (response.statusCode == 200) {
        String content =
            response.data['choices'][0]['message']['content'].toString().trim();
        //.replaceAll('\n', '');
        _sendNewTextToChatGPT(text: content, sender: "assistant");
        _answers.add({"role": "assistant", "content": content});
        _AI_ask = content;

        _changeLoadingState();
        notifyListeners();
      }
    } on DioException catch (err) {
      print(_answers);
      if (kDebugMode) {
        print("catch $err");
      }

      _changeLoadingState();
    }
  }

  sendGenerateTitlePrompt() async {
    List<Map<String, dynamic>> messages = [];
    String user_prompt = StoryPromptModel.title_user_prompt;
    user_prompt =
        user_prompt.replaceFirst("{draft}", draft[draft_index]["draft"]);
    messages.add({"role": "user", "content": user_prompt});
    final openAI = OpenAI.instance.build(
        token: AppConstants.moonshot_api_key,
        baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)),
        enableLog: true);
    final request = ChatCompleteText(
        messages: messages,
        maxToken: 200,
        model: ChatModelFromValue(model: AppConstants.MOONSHOT_MODEL));
    final response = await openAI.onChatCompletion(request: request);
    for (var element in response!.choices) {
      print("data -> ${element.message?.content}");
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
        token: AppConstants.moonshot_api_key,
        baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)),
        enableLog: true);
    final request = ChatCompleteText(
        messages: messages,
        maxToken: 200,
        model: ChatModelFromValue(model: AppConstants.MOONSHOT_MODEL));
    final response = await openAI.onChatCompletion(request: request);
    for (var element in response!.choices) {
      print("data -> ${element.message?.content}");
    }
  }

  sendGenerateArticlePrompt() {
    List<Map<String, dynamic>> messages = [];
    String system_prompt = StoryPromptModel.article_system_prompt;
    String user_prompt = StoryPromptModel.article_user_prompt;
    String chat_history = _buildChatHistoryForArticle();
    user_prompt =
        user_prompt.replaceFirst("{conversation_history}", chat_history);
    messages.add({"role": "system", "content": system_prompt});
    messages.add({"role": "user", "content": user_prompt});
    final openAI = OpenAI.instance.build(
        token: AppConstants.moonshot_api_key,
        baseOption: HttpSetup(receiveTimeout: const Duration(seconds: 5)),
        enableLog: true);
    final request = ChatCompleteText(
        messages: messages,
        maxToken: 200,
        model: ChatModelFromValue(model: AppConstants.MOONSHOT_MODEL));

    openAI.onChatCompletionSSE(request: request).listen((it) {
      if (it.choices == null) return;
      debugPrint(it.choices!.last.message?.content);
    });
  }

  deleteDraft() {
    draft.removeAt(draft_index);
    draft_index -= draft_index;
    if (draft_index < 0) draft_index = 0;
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
}
