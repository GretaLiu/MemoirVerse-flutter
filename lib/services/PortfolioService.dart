import 'package:flutter/material.dart';

class PortfolioService extends ChangeNotifier {
  int _selected_index = 0;
  int get selected_index => _selected_index;
  set selected_index(index) {
    _selected_index = index;
    notifyListeners();
  }
}
