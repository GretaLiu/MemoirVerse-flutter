import 'package:flutter/material.dart';
import 'package:memoirverse/features/AI_record/home/AIRecord.dart';
import 'package:memoirverse/features/portfolio/home/portfolio.dart';
import 'package:memoirverse/features/user/home/user.dart';

import 'package:memoirverse/features/write_story/home/write_story.dart';

class HomeService extends ChangeNotifier {
  int _selectedIndex = 0;

  final List<Map> _pages = [
    {
      "image": "assets/images/AI_record.png",
      "image_active": "assets/images/AI_record_active.png",
      "title": "AI记录",
      "page": AIRecordPage()
    },
    {
      "image": "assets/images/writing.png",
      "image_active": "assets/images/writing_active.png",
      "title": "写故事",
      "page": WriteStoryPage()
    },
    {
      "image": "assets/images/portfolio.png",
      "image_active": "assets/images/portfolio_active.png",
      "title": "作品集",
      "page": PortfolioPage()
    },
    {
      "image": "assets/images/user.png",
      "image_active": "assets/images/user_active.png",
      "title": "我的",
      "page": const UserPage()
    }
  ];
  int get selectedIndex => _selectedIndex;
  Widget get page => _pages[_selectedIndex]["page"];
  List<Map> get pages => _pages;
  set selectedIndex(index) {
    _selectedIndex = index;
    notifyListeners();
  }
}
