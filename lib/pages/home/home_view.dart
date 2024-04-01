// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, deprecated_member_use, library_private_types_in_public_api, sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'dart:async';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_mobile/utils/constants.dart';
import 'package:tasks_mobile/store/utils.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final utilStore = GetIt.I.get<Utils>();

class HomeView extends StatefulWidget {
  const HomeView({Key? key});

  @override
  _HomeViewState createState() => _HomeViewState();
}

class _HomeViewState extends State<HomeView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();

    return Scaffold(
      backgroundColor: Constants.color3,
      body: SizedBox(
        height: 1.sh,
        width: 1.sw,
        child: SafeArea(
          child: Stack(
            children: [
              Container(
                height: double.infinity,
                width: double.infinity,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/img/bg12.png'),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Container(
                width: 1,
                height: 1,
                color: Colors.black,
              ),
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: RefreshIndicator(
                  onRefresh: () async {
                    await utilStore.getTasks();
                    return Future.delayed(const Duration(seconds: 1));
                  },
                  child: Column(
                    children: <Widget>[
                      //Header
                      Container(
                        height: 40.sp,
                        color: Constants.color,
                        padding: EdgeInsets.symmetric(horizontal: .02.sw),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            SizedBox(
                              width: 5.sp,
                              height: 50.sp,
                            ),
                            SizedBox(
                              height: 60.sp,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Container(
                                    width: 40.sp,
                                    padding: EdgeInsets.only(right: 10.sp),
                                    child: ClipRRect(
                                      child: IconButton(
                                        padding: EdgeInsets.only(bottom: 5),
                                        icon: FaIcon(
                                          FontAwesomeIcons.noteSticky,
                                          color: Colors.black,
                                          size: 16.sp,
                                        ),
                                        onPressed: () {},
                                      ),
                                    ),
                                  ),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        height: 20.sp,
                                        child: Row(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Text(
                                              "TASKS",
                                              style: TextStyle(
                                                height: 1,
                                                fontSize: 18.sp,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "Gerencie tarefas ",
                                        style: TextStyle(
                                          height: 1,
                                          fontSize: 8.sp,
                                          color: Colors.black,
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    width: 40.sp,
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 5.sp,
                              height: 50,
                            ),
                          ],
                        ),
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 100.sp,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: AssetImage('assets/img/bg17.png'),
                                fit: BoxFit.cover,
                                colorFilter: ColorFilter.mode(
                                  Colors.black.withOpacity(0.5),
                                  BlendMode.darken,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            width: 1,
                            height: 1,
                            color: Colors.transparent,
                          ),
                          Positioned(
                            width: 1.sw,
                            top: 35.sp,
                            child: SizedBox(
                              child: Padding(
                                padding: EdgeInsets.all(5.sp),
                                child: Text(
                                  "Aumente sua produtividade ao planejar e priorizar suas tarefas.",
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Constants.white,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Expanded(
                        child: SizedBox(
                          width: 1.sw,
                          height: 1.sh,
                          child: Form(
                            key: formKey,
                            child: Container(
                              decoration: BoxDecoration(
                                color: Colors.black.withOpacity(0.7),
                              ),
                              child: ListView(
                                padding:
                                    EdgeInsets.symmetric(horizontal: .01.sw),
                                children: [
                                  SizedBox(
                                    child: Column(
                                      children: [
                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              vertical: 10.sp,
                                              horizontal: 5.sp),
                                          child: Center(
                                            child: Text(
                                              utilStore.tasks.isNotEmpty
                                                  ? '${utilStore.tasks.length} itens encontradaos. Utilize o menu a baixo!'
                                                  : 'Nenhuma tarefa encontrada adicione tarefas pelo menu a baixo',
                                              style: TextStyle(
                                                  color: Colors.grey,
                                                  fontSize: 11.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
