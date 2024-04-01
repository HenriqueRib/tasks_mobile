// ignore_for_file: unnecessary_type_check

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get_it/get_it.dart';
import 'package:tasks_mobile/main.dart';
import 'package:tasks_mobile/pages/about/about_view.dart';
import 'package:tasks_mobile/pages/add_tasks_view%20copy/add_tasks_view.dart';
import 'package:tasks_mobile/pages/all_tasks_view/all_tasks_view.dart';
import 'package:tasks_mobile/pages/home/home_view.dart';
import 'package:tasks_mobile/pages/login/login_view.dart';
import 'package:tasks_mobile/pages/perfil/perfil_view.dart';
import 'package:tasks_mobile/pages/show_tasks_view/show_tasks_view.dart';
import 'package:tasks_mobile/pages/splash/splash_view.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:tasks_mobile/store/utils.dart';

import '../model/response_function.dart';

final utilStore = GetIt.I.get<Utils>();

class AppRoutes {
  void setup() {
    QR.settings.initPage = const SplashView();

    QR.settings.notFoundPage = QRoute(
      path: 'path',
      builder: () => const LoginView(),
    );
  }

  final routes = <QRoute>[
    QRoute(
      path: '/',
      name: 'login',
      builder: () => const LoginView(),
      middleware: [
        QMiddlewareBuilder(
          redirectGuardFunc: (p0) async {
            if (sharedPreferences!.getString('token').toString() == 'null') {
              return null;
            }
            EasyLoading.show(status: 'Carregando');
            ResponseFunction? res = await utilStore.getMe();
            if (res is ResponseFunction) {
              if (res.success == true) {
                await utilStore.getTasks();
                await EasyLoading.dismiss();
                return '/home';
              }
              await EasyLoading.dismiss();
              return null;
            }
            await EasyLoading.dismiss();
            return null;
          },
        ),
      ],
    ),
    QRoute(
      path: '/home',
      name: 'home',
      builder: () => const HomeView(),
    ),
    QRoute(
      path: '/perfil',
      name: 'perfil',
      builder: () => const PerfilView(),
    ),
    QRoute(
      path: '/allTasks',
      name: 'allTasks',
      builder: () => const AllTasksView(),
    ),
    QRoute(
      path: '/showTask',
      name: 'showTask',
      builder: () => const ShowTasksView(),
    ),
    QRoute(
      path: '/addTask',
      name: 'addTask',
      builder: () => const AddTasksView(),
    ),
    QRoute(
      path: '/about',
      name: 'about',
      builder: () => const AboutView(),
    ),
  ];
}
