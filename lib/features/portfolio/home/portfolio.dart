import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'package:memoirverse/features/AI_record/note/notes.dart';
import 'package:memoirverse/features/portfolio/library/library.dart';
import 'package:memoirverse/features/portfolio/home/widget/portfolio_body.dart';
import 'package:memoirverse/features/portfolio/home/widget/portfolio_Head.dart';
import 'package:memoirverse/services/PortfolioService.dart';
import 'package:provider/provider.dart';

class PortfolioPage extends StatelessWidget {
  const PortfolioPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Container(
            clipBehavior: Clip.antiAlias,
            decoration: BoxDecoration(color: Color(0xFFFFFFF4)),
            child: Column(children: [
              SizedBox(height: 50.h),
              PortfolioHeadWidget(),
              Expanded(
                  child: context.watch<PortfolioService>().selected_index == 0
                      ? const LibraryWidget()
                      : const PortfolioBodyWidget())
            ])));
  }
}
