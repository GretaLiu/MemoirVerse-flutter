import 'package:flutter/material.dart';

class UserService extends ChangeNotifier {
  static List<Map> _topic = [
    {"title": "个人回忆", "selected": true},
    {"title": "旅行日记", "selected": false},
    {"title": "日记随笔", "selected": false},
    {"title": "教育孩子", "selected": false},
    {"title": "华侨特刊", "selected": false},
    {"title": "企业家特刊", "selected": false},
    {"title": "恋爱日记", "selected": false}
  ];
  List<Map> get topic => _topic;
  topicSelected(index) {
    _topic[index]["selected"] = !_topic[index]["selected"];
    notifyListeners();
  }

  String _name = "刘岳光";
  String get name => _name;
  set name(name) {
    _name = name;
    notifyListeners();
  }

  String _gender = "male";
  String get gender => _gender;
  set gender(gender) {
    _gender = gender;
    notifyListeners();
  }

  int _age = 72;
  int get age => _age;
  set age(age) {
    _age = age;
    notifyListeners();
  }

  String _birthday = "1949-10-01";
  String get birthday => _birthday;
  set birthday(birthday) {
    _birthday = birthday;
    notifyListeners();
  }

  bool _need_signin = false;
  bool get need_signin => _need_signin;
  set need_signin(need_sign) {
    _need_signin = need_sign;
    notifyListeners();
  }

  int _signin_type = 0;
  int get signin_type => _signin_type;
  set signin_type(type) {
    _signin_type = type;
    notifyListeners();
  }

  String _redeemCode_result = "";
  String get redeemCode_result => _redeemCode_result;
  set redeemCode_result(result) {
    _redeemCode_result = result;
    notifyListeners();
  }
}
