// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, deprecated_member_use, library_private_types_in_public_api, sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors, use_build_context_synchronously, avoid_print

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:tasks_mobile/model/response_function.dart';
import 'package:tasks_mobile/utils/constants.dart';
import 'package:tasks_mobile/utils/notifications.dart';

import '../../routes/app_routes.dart';

class AllTasksView extends StatefulWidget {
  const AllTasksView({Key? key});

  @override
  _AllTasksViewState createState() => _AllTasksViewState();
}

class _AllTasksViewState extends State<AllTasksView> {
  @override
  void initState() {
    super.initState();
  }

  _showApagarTask() {
    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          contentPadding: EdgeInsets.all(0),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20.0),
          ),
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(
                Radius.circular(20.0),
              ),
              color: Constants.color,
            ),
            padding: EdgeInsets.only(
              top: 0,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                Container(
                  padding:
                      EdgeInsets.symmetric(vertical: 15.sp, horizontal: 15.sp),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Tem certeza que deseja apagar essa tarefa? Esta ação será irreversível',
                        style: TextStyle(
                          color: Colors.black,
                          fontSize: 18.sp,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 10.0),
                Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(20.0),
                      bottomRight: Radius.circular(20.0),
                    ),
                    color: Constants.color3,
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Ink(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.red,
                              Colors.red,
                            ]),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Container(
                            constraints: const BoxConstraints(
                              minWidth: 100,
                              minHeight: 40,
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              'Voltar',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Constants.white,
                                fontSize: 21,
                              ),
                            ),
                          ),
                        ),
                      ),
                      TextButton(
                        onPressed: () async {
                          print('Deletar');
                          EasyLoading.show(status: 'Carregando...');
                          ResponseFunction? res = await utilStore.deleteTask();
                          print(res!.success);
                          if (res.success == true) {
                            EasyLoading.dismiss();
                            Notifications.success(
                              title: "Parabéns",
                              message: "Sua tarefa foi deletada com sucesso!",
                            );
                            QR.to('allTasks');
                          }
                          if (res.success == false) {
                            String message =
                                "Ocorreu um erro. Tente novamente mais tarde!";
                            EasyLoading.dismiss();
                            Notifications.error(
                              title: "Atenção",
                              message: message,
                            );
                          }
                          EasyLoading.dismiss();
                          print('Deletar 2');
                          Navigator.pop(context);
                        },
                        child: Ink(
                          decoration: const BoxDecoration(
                            gradient: LinearGradient(colors: [
                              Colors.green,
                              Colors.green,
                            ]),
                            borderRadius: BorderRadius.all(
                              Radius.circular(10),
                            ),
                          ),
                          child: Container(
                            constraints: const BoxConstraints(
                              minWidth: 100,
                              minHeight: 40,
                            ),
                            alignment: Alignment.center,
                            child: const Text(
                              'Deletar',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Constants.white,
                                fontSize: 21,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        );
      },
    );
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
                                                  color: Constants.black,
                                                  size: 22.sp,
                                                ),
                                                onPressed: () {},
                                              ),
                                            ),
                                            Text(
                                              "TAREFAS",
                                              style: TextStyle(
                                                height: 1,
                                                fontSize: 18.sp,
                                                color: Constants.black,
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      Text(
                                        "        Visualize todas as tarefas",
                                        style: TextStyle(
                                          height: 1,
                                          fontSize: 8.sp,
                                          color: Constants.black,
                                        ),
                                      ),
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
                              child: ListView(
                                padding:
                                    EdgeInsets.symmetric(horizontal: .01.sw),
                                children: [
                                  SizedBox(
                                    height: 10.sp,
                                  ),
                                  Observer(builder: (_) {
                                    return ListView.builder(
                                      padding: EdgeInsets.only(bottom: 50.sp),
                                      shrinkWrap: true,
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      itemCount: utilStore.tasks.length,
                                      itemBuilder: (context, index) {
                                        final data = utilStore.tasks[index];
                                        Color color;
                                        Color colorBold;
                                        color = Color.fromARGB(158, 39, 50, 39);
                                        colorBold = Constants.white;

                                        return GestureDetector(
                                          onTap: () {
                                            utilStore.setidTask(index);
                                            QR.to('showTask');
                                          },
                                          child: Padding(
                                            padding:
                                                EdgeInsets.only(bottom: 8.sp),
                                            child: Slidable(
                                              key: Key(index.toString()),
                                              startActionPane: ActionPane(
                                                motion: const ScrollMotion(),
                                                children: [
                                                  SlidableAction(
                                                    onPressed: (_) {
                                                      utilStore.setidTask(
                                                          utilStore.tasks[index]
                                                              .id!);
                                                      QR.to('showTask');
                                                    },
                                                    backgroundColor: colorBold,
                                                    foregroundColor:
                                                        Colors.black,
                                                    icon: Icons
                                                        .remove_red_eye_outlined,
                                                  ),
                                                  SlidableAction(
                                                    onPressed: (_) {
                                                      utilStore.setEdit(true);
                                                      print('index / task.id');
                                                      print(index);
                                                      print(utilStore
                                                          .tasks[index].id!);
                                                      utilStore.setIndex(index);
                                                      utilStore.setidTaskEdit(
                                                          utilStore.tasks[index]
                                                              .id!);
                                                      QR.to('addTask');
                                                    },
                                                    backgroundColor: colorBold,
                                                    foregroundColor:
                                                        Colors.black,
                                                    icon: Icons.edit,
                                                  ),
                                                  SlidableAction(
                                                    onPressed: (_) {
                                                      utilStore.setidTaskDelete(
                                                          utilStore.tasks[index]
                                                              .id!);
                                                      _showApagarTask();
                                                    },
                                                    backgroundColor: Colors.red,
                                                    foregroundColor:
                                                        Constants.white,
                                                    icon: Icons.delete,
                                                  ),
                                                ],
                                              ),
                                              child: SizedBox(
                                                child: Row(
                                                  children: [
                                                    Container(
                                                      width: 5.sp,
                                                      height: 70.sp,
                                                      color: colorBold,
                                                    ),
                                                    Container(
                                                      width: 1.sw - 20.sp,
                                                      height: 70.sp,
                                                      color: color,
                                                      padding:
                                                          EdgeInsets.all(7.sp),
                                                      child: Column(
                                                        children: [
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                data.name ?? '',
                                                                style:
                                                                    TextStyle(
                                                                  color:
                                                                      colorBold,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                ),
                                                              ),
                                                              Text(
                                                                data.status ??
                                                                    '',
                                                                style:
                                                                    TextStyle(
                                                                  color:
                                                                      colorBold,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      9.sp,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceBetween,
                                                            children: [
                                                              Text(
                                                                data.description ??
                                                                    '',
                                                                style:
                                                                    TextStyle(
                                                                  color: Colors
                                                                      .grey,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontSize:
                                                                      10.sp,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 5.sp,
                                                          ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            children: [
                                                              Container(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        right: 5
                                                                            .sp),
                                                                child: Row(
                                                                  children: [
                                                                    Icon(
                                                                      Icons
                                                                          .calendar_month,
                                                                      color:
                                                                          colorBold,
                                                                      size:
                                                                          18.sp,
                                                                    ),
                                                                    Text(
                                                                      data.deadline ??
                                                                          '',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .white,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontSize:
                                                                            10.sp,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      '- Tag: ${data.tag ?? 'sem informação'}',
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .grey,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontSize:
                                                                            10.sp,
                                                                      ),
                                                                    ),
                                                                    Text(
                                                                      ' - Prioridade: ${(() {
                                                                        switch (
                                                                            data.priority) {
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
                                                                      style:
                                                                          TextStyle(
                                                                        color: Colors
                                                                            .grey,
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        fontSize:
                                                                            10.sp,
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      },
                                    );
                                  }),
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
