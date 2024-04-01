// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, deprecated_member_use, library_private_types_in_public_api, sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:tasks_mobile/routes/app_routes.dart';
import 'package:tasks_mobile/utils/constants.dart';

class ShowTasksView extends StatefulWidget {
  const ShowTasksView({Key? key});

  @override
  _ShowTasksViewState createState() => _ShowTasksViewState();
}

class _ShowTasksViewState extends State<ShowTasksView> {
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
                color: Colors.transparent,
              ),
              SizedBox(
                height: double.infinity,
                width: double.infinity,
                child: RefreshIndicator(
                  onRefresh: () async {
                    await EasyLoading.dismiss();
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
                                children: [
                                  SizedBox(
                                    child: ClipRRect(
                                      child: IconButton(
                                        padding: EdgeInsets.only(bottom: 5),
                                        icon: FaIcon(
                                          FontAwesomeIcons
                                              .solidArrowAltCircleLeft,
                                          color: Constants.white,
                                          size: 16.sp,
                                        ),
                                        onPressed: () {
                                          QR.back();
                                        },
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
                                            ClipRRect(
                                              child: IconButton(
                                                padding:
                                                    EdgeInsets.only(bottom: 5),
                                                icon: Icon(
                                                  Icons.note_outlined,
                                                  color: Constants.white,
                                                  size: 22.sp,
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                            Text(
                                              "TAREFA",
                                              style: TextStyle(
                                                height: 1,
                                                fontSize: 18.sp,
                                                color: Constants.white,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Observer(builder: (_) {
                                        return Text(
                                          "        ${utilStore.task!.name}",
                                          style: TextStyle(
                                            height: 1,
                                            fontSize: 8.sp,
                                            color: Constants.white,
                                          ),
                                        );
                                      }),
                                    ],
                                  ),
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
                              child: Observer(builder: (_) {
                                return ListView(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: .01.sw),
                                  children: [
                                    Padding(
                                      padding: EdgeInsets.all(9.sp),
                                      child: Text(
                                        utilStore.task!.name.toString(),
                                        style: TextStyle(
                                          height: 1,
                                          fontSize: 18.sp,
                                          color: Constants.white,
                                        ),
                                      ),
                                    ),
                                    Divider(
                                      color: Colors.grey,
                                      height: 2,
                                      thickness: 1,
                                    ),
                                    SizedBox(
                                      height: 5.sp,
                                    ),
                                    SizedBox(
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 8.0),
                                            child: Text(
                                              'Descrição: ${utilStore.task!.description ?? 'sem informação'}',
                                              style: TextStyle(
                                                height: 1,
                                                fontSize: 16.sp,
                                                color: Constants.white,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 8.0),
                                            child: Text(
                                              'Data final: ${utilStore.task!.deadline ?? 'sem informação'}',
                                              style: TextStyle(
                                                height: 1,
                                                fontSize: 16.sp,
                                                color: Constants.white,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 8.0),
                                            child: Text(
                                              'Status: ${utilStore.task!.status ?? 'sem informação'}',
                                              style: TextStyle(
                                                height: 1,
                                                fontSize: 16.sp,
                                                color: Constants.white,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 8.0),
                                            child: Text(
                                              'Prioridade: ${(() {
                                                switch (utilStore
                                                    .tasks[utilStore.index]
                                                    .priority) {
                                                  case 0:
                                                    return 'Baixa';
                                                  case 1:
                                                    return 'Média';
                                                  case 2:
                                                    return 'Alta';
                                                  default:
                                                    return 'sem informação';
                                                }
                                              })()}',
                                              style: TextStyle(
                                                height: 1,
                                                fontSize: 16.sp,
                                                color: Constants.white,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 8.0),
                                            child: Text(
                                              'Tag: ${utilStore.task!.tag ?? 'sem informação'}',
                                              style: TextStyle(
                                                height: 1,
                                                fontSize: 16.sp,
                                                color: Constants.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                );
                              }),
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
