// ignore_for_file: prefer_const_literals_to_create_immutables

import 'dart:async';

import 'package:expandable_page_view/expandable_page_view.dart';
import 'package:tasks_mobile/pages/login/tab/login_tab1.dart';
import 'package:tasks_mobile/store/utils.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final utilStore = GetIt.I.get<Utils>();

class LoginView extends StatefulWidget {
  const LoginView({Key? key}) : super(key: key);

  @override
  State<LoginView> createState() => _LoginViewState();
}

class _LoginViewState extends State<LoginView>
    with SingleTickerProviderStateMixin {
  PageController? pageController = PageController();
  Timer? timer;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    timer?.cancel();
    pageController?.dispose();
    super.dispose();
  }

  void startTimer() {
    timer = Timer.periodic(const Duration(seconds: 10), (timer) {
      final newIndex = (utilStore.indexPageLogin + 1) % 4;
      utilStore.setIndexPageLogin(newIndex);
      pageController?.animateToPage(
        newIndex,
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ExpandablePageView(
        controller: pageController,
        onPageChanged: (index) async {
          await utilStore.setIndexPageLogin(index);
          await Future.delayed(
            const Duration(seconds: 2),
          );
        },
        children: [
          const LoginTab1(),
        ],
      ),
    );
  }
}
