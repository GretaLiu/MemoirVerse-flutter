import 'package:flutter/material.dart';

class WriteStoryService extends ChangeNotifier {
  bool _isAIGenerated = true;
  bool get isAIGenerated => _isAIGenerated;
  set isAIGenerated(isAIGenerated) {
    _isAIGenerated = isAIGenerated;
    notifyListeners();
  }

  final List<Map> _chat_summary_history = [
    {
      "time": "2024年6月6日 上午11:30",
      "summary":
          "家庭温馨，哥哥照顾，爸爸偶尔归来，妈妈勤劳好学；哥哥在姥姥家地位高，引起用户嫉妒；姥姥家生活无聊，但发现乐趣，与当地孩子建立友"
    },
    {
      "time": "2024年6月5日 上午11:30",
      "summary": "童年与闺蜜郝音素共度，学骑车、雨天步行、冬天雾中辨认，偷瓜趣事。"
    },
    {
      "time": "6月6日 上午 11:30",
      "summary": "湖南女子早年学医，教会学校学习英文医学书籍，影响医学教育；北京协和医院工作，退休后继续教学，关注医学发展。"
    },
  ];
  List<Map> get chat_summary_history => _chat_summary_history;

  final List<String> _decorate_background = [
    "assets/images/decorate_1.jpg",
    "assets/images/decorate_2.jpg",
    "assets/images/decorate_3.jpg",
    "assets/images/decorate_4.jpg",
    "assets/images/decorate_5.jpg",
  ];
  List<String> get decorate_background => _decorate_background;
  int _decorate_background_index = 0;
  int get decorate_background_index => _decorate_background_index;
  set decorate_background_index(index) {
    _decorate_background_index = index;
    notifyListeners();
  }
}
