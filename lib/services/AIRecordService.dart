// ignore_for_file: non_constant_identifier_names

import 'package:flutter/material.dart';

class AIRecordService extends ChangeNotifier {
  bool _isRecord = true;
  bool get isRecord => _isRecord;
  // ignore: prefer_final_fields
  String _selected_topic_title = "随手记";
  String get selected_topic_title => _selected_topic_title;
  set selected_topic_title(title) {
    _selected_topic_title = title;
    notifyListeners();
  }

  final List<Map> _note_history = [
    {"time": "7月8日 上午 11:30", "note": "家庭温馨，哥哥关爱，姥姥家趣事。"},
    {
      "time": "6月6日 上午 11:30",
      "note": "内蒙插队经历、牛奶关怀、草原生态变化、蒙古情结、老阿爸的宽容与智慧、蒙古餐的适应与喜爱、那达慕大会的壮观。"
    },
    {"time": "6月6日 上午 11:30", "image": "assets/images/note_example.jpg"}
  ];
  List<Map> get note_history => _note_history;
  set isRecord(isRecord) {
    _isRecord = isRecord;
    notifyListeners();
  }

  final List<Map> _topic_list = [
    {"title": "童年印象", "image": "assets/images/childhood.png"},
    {"title": "青春回忆", "image": "assets/images/youth.png"},
    {"title": "职业初期", "image": "assets/images/profession.png"},
    {"title": "家庭生活", "image": "assets/images/family.png"},
    {"title": "事业成就", "image": "assets/images/career.png"},
    {"title": "退休思考", "image": "assets/images/retire.png"},
    {"title": "一场旅行", "image": "assets/images/travel.png"},
    {"title": "上山下乡", "image": "assets/images/countryside.png"},
    {"title": "公益之心", "image": "assets/images/public_welfare.png"},
    {"title": "留学外派", "image": "assets/images/abroad.png"},
    {"title": "留学外派", "image": "assets/images/abroad.png"},
  ];
  List<Map> get topic_list => _topic_list;
  void addTopic(topic) {
    _topic_list.add(topic);
    notifyListeners();
  }

  List<String> _topic_selected = [
    "童年回忆",
    "青春回忆",
    "职业初期",
    "家庭生活",
    "事业成就",
    "退休思考"
  ];
  List<String> getNoSelected() {
    List<String> noSelected = [];
    for (var i = 0; i < _topic_list.length; i++) {
      for (var j = 0; j < _topic_selected.length; j++) {
        if (_topic_selected[j] == _topic_list[i]["title"]) {
          break;
        }
      }
      noSelected.add(_topic_list[i]["title"]);
    }
    return noSelected;
  }

  void selectOneTopic(String title) {
    _topic_selected.add(title);
    notifyListeners();
  }

  List<String> get topic_selected => _topic_selected;
  int _voice_type_index = 0;
  int get voice_type_index => _voice_type_index;
  set voice_type_index(index) {
    _voice_type_index = index;
    notifyListeners();
  }

  double _speaking_speed = 0;
  double get speaking_speed => _speaking_speed;
  set speaking_speed(speed) {
    _speaking_speed = speed;
    notifyListeners();
  }
}
