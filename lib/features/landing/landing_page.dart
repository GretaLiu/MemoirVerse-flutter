import 'package:flutter/material.dart';
import 'package:memoirverse/components/bottom_bar.dart';
import 'package:memoirverse/services/HomeService.dart';
import 'package:provider/provider.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: context.watch<HomeService>().page,
        bottomNavigationBar: BottomBar());
  }
}
