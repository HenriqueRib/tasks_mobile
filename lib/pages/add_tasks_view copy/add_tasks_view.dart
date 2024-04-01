// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, deprecated_member_use, library_private_types_in_public_api, sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors, avoid_print

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:intl/intl.dart';
import 'package:get_it/get_it.dart';
import 'package:flutter/material.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:tasks_mobile/model/response_function.dart';
import 'package:tasks_mobile/store/utils.dart';
import 'package:tasks_mobile/utils/constants.dart';
import 'package:tasks_mobile/utils/notifications.dart';

class AddTasksView extends StatefulWidget {
  const AddTasksView({Key? key});

  @override
  _AddTasksViewState createState() => _AddTasksViewState();
}

class _AddTasksViewState extends State<AddTasksView> {
  @override
  void initState() {
    super.initState();
    if (utilStore.edit) {
      formInitEdit();
    }
  }

  formInitEdit() {
    utilStore.setEdit(false);
    title = "EDITAR TAREFA";
    _controllerName.text = utilStore.tasks[utilStore.index].name ?? '';
    _controllerDescription.text =
        utilStore.tasks[utilStore.index].description ?? '';
    _controllerStatus.text = utilStore.tasks[utilStore.index].status ?? '';
    _controllerTag.text = utilStore.tasks[utilStore.index].tag ?? '';

    if (utilStore.tasks[utilStore.index].deadline != null) {
      String deadlineString = utilStore.tasks[utilStore.index].deadline ?? '';
      if (deadlineString.isNotEmpty) {
        initialDate = DateFormat('yyyy-MM-dd').parse(deadlineString);
      } else {
        initialDate = DateTime.now();
      }

      _controllerDeadline.text = initialDate != null
          ? DateFormat('yyyy-MM-dd').format(initialDate!)
          : '';
      print(deadlineString);
    }

    String priorityText = '';
    switch (utilStore.tasks[utilStore.index].priority!) {
      case 0:
        priorityText = 'Baixa';
        break;
      case 1:
        priorityText = 'Média';
        break;
      case 2:
        priorityText = 'Alta';
        break;
      default:
        priorityText = 'Baixa';
        break;
    }
    _controllerPriority.text = priorityText;
  }

  String? title = "ADICIONAR TAREFA";
  final utilStore = GetIt.I.get<Utils>();
  final FocusNode _focusName = FocusNode();
  final FocusNode _focusDescription = FocusNode();
  final FocusNode _focusStatus = FocusNode();
  final FocusNode _focusTag = FocusNode();

  final TextEditingController _controllerName = TextEditingController(text: "");
  final TextEditingController _controllerDescription =
      TextEditingController(text: "");
  final TextEditingController _controllerStatus =
      TextEditingController(text: "");
  final TextEditingController _controllerTag = TextEditingController(text: "");
  DateTime? initialDate;
  final TextEditingController _controllerDeadline = TextEditingController();
  final TextEditingController _controllerPriority =
      TextEditingController(text: "");

  String _selectedPriority = 'Baixo';

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
                                              title.toString(),
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
                                        "        Adicione novas tarefas",
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
                            child: ListView(
                              padding: EdgeInsets.symmetric(horizontal: .00.sw),
                              children: [
                                SizedBox(
                                  child: Column(
                                    children: [
                                      Container(
                                        decoration: BoxDecoration(
                                          color: Colors.black.withOpacity(0.7),
                                        ),
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 20.sp, vertical: 20.sp),
                                        child: Column(
                                          children: [
                                            Container(
                                              height: 50.sp,
                                              padding: EdgeInsets.only(
                                                  left: 10.0.sp),
                                              decoration: BoxDecoration(
                                                color: Constants.white
                                                    .withOpacity(0.2.sp),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15.0.sp),
                                              ),
                                              child: TextFormField(
                                                focusNode: _focusName,
                                                style: const TextStyle(
                                                    color: Constants.white),
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: 'Nome (*)',
                                                  labelStyle: TextStyle(
                                                      color: Constants.white),
                                                  border: InputBorder.none,
                                                ),
                                                controller: _controllerName,
                                                onChanged: (value) async {},
                                              ),
                                            ),
                                            SizedBox(height: .02.sh),
                                            Container(
                                              height: 50.sp,
                                              padding: EdgeInsets.only(
                                                  left: 10.0.sp),
                                              decoration: BoxDecoration(
                                                color: Constants.white
                                                    .withOpacity(0.2.sp),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15.0.sp),
                                              ),
                                              child: TextFormField(
                                                focusNode: _focusDescription,
                                                style: const TextStyle(
                                                    color: Constants.white),
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: 'Descrição',
                                                  labelStyle: TextStyle(
                                                      color: Constants.white),
                                                  border: InputBorder.none,
                                                ),
                                                controller:
                                                    _controllerDescription,
                                                onChanged: (value) async {},
                                              ),
                                            ),
                                            SizedBox(height: .02.sh),
                                            Container(
                                              height: 50.sp,
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              decoration: BoxDecoration(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: DropdownButtonFormField(
                                                decoration: InputDecoration(
                                                  labelText: 'Prioridade',
                                                  labelStyle: TextStyle(
                                                    color: Constants.white,
                                                  ),
                                                  border: InputBorder.none,
                                                ),
                                                value: _selectedPriority,
                                                dropdownColor: Colors.grey
                                                    .withOpacity(0.2),
                                                items: [
                                                  'Baixo',
                                                  'Médio',
                                                  'Alto'
                                                ].map((String priority) {
                                                  return DropdownMenuItem(
                                                    value: priority,
                                                    child: Text(
                                                      priority,
                                                      style: TextStyle(
                                                        color: Constants.white,
                                                      ),
                                                    ),
                                                  );
                                                }).toList(),
                                                onChanged: (String? value) {
                                                  setState(() {
                                                    _selectedPriority = value!;
                                                  });
                                                },
                                              ),
                                            ),
                                            SizedBox(height: .02.sh),
                                            Container(
                                              height: 50,
                                              padding:
                                                  EdgeInsets.only(left: 10),
                                              decoration: BoxDecoration(
                                                color: Colors.grey
                                                    .withOpacity(0.5),
                                                borderRadius:
                                                    BorderRadius.circular(15),
                                              ),
                                              child: FormBuilderDateTimePicker(
                                                controller: _controllerDeadline,
                                                name: 'deadline',
                                                inputType: InputType.date,
                                                initialValue: initialDate,
                                                format:
                                                    DateFormat('yyyy-MM-dd'),
                                                decoration: InputDecoration(
                                                  labelText: 'Data final',
                                                  labelStyle: TextStyle(
                                                      color: Constants.white),
                                                  border: InputBorder.none,
                                                ),
                                                style: TextStyle(
                                                    color: Constants.white),
                                                enabled: true,
                                                autovalidateMode:
                                                    AutovalidateMode
                                                        .onUserInteraction,
                                                valueTransformer: (val) {
                                                  if (val == null ||
                                                      val is String) {
                                                    return '';
                                                  }
                                                  return DateFormat(
                                                          'dd/MM/yyyy')
                                                      .format(val);
                                                },
                                              ),
                                            ),
                                            SizedBox(height: .02.sh),
                                            Container(
                                              height: 50.sp,
                                              padding: EdgeInsets.only(
                                                  left: 10.0.sp),
                                              decoration: BoxDecoration(
                                                color: Constants.white
                                                    .withOpacity(0.2.sp),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15.0.sp),
                                              ),
                                              child: TextFormField(
                                                focusNode: _focusStatus,
                                                style: const TextStyle(
                                                    color: Constants.white),
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: 'Status',
                                                  labelStyle: TextStyle(
                                                      color: Constants.white),
                                                  border: InputBorder.none,
                                                ),
                                                controller: _controllerStatus,
                                                onChanged: (value) async {},
                                              ),
                                            ),
                                            SizedBox(height: .02.sh),
                                            Container(
                                              height: 50.sp,
                                              padding: EdgeInsets.only(
                                                  left: 10.0.sp),
                                              decoration: BoxDecoration(
                                                color: Constants.white
                                                    .withOpacity(0.2.sp),
                                                borderRadius:
                                                    BorderRadius.circular(
                                                        15.0.sp),
                                              ),
                                              child: TextFormField(
                                                focusNode: _focusTag,
                                                style: const TextStyle(
                                                    color: Constants.white),
                                                decoration:
                                                    const InputDecoration(
                                                  labelText: 'Tag',
                                                  labelStyle: TextStyle(
                                                      color: Constants.white),
                                                  border: InputBorder.none,
                                                ),
                                                controller: _controllerTag,
                                                onChanged: (value) async {},
                                              ),
                                            ),
                                            SizedBox(height: .03.sh),
                                            SizedBox(
                                              width: 1.sw / 1.7,
                                              height: 50.sp,
                                              child: Center(
                                                child: TextButton(
                                                  onPressed: () async {
                                                    EasyLoading.show(
                                                        status:
                                                            "Carregando...");
                                                    if (title ==
                                                        'EDITAR TAREFA') {
                                                      ResponseFunction? res =
                                                          await utilStore
                                                              .update(
                                                        name: _controllerName
                                                            .text,
                                                        description:
                                                            _controllerDescription
                                                                .text,
                                                        deadline:
                                                            _controllerDeadline
                                                                .text,
                                                        status:
                                                            _controllerStatus
                                                                .text,
                                                        priority:
                                                            _controllerPriority
                                                                .text,
                                                        tag:
                                                            _controllerTag.text,
                                                      );
                                                      print(res!.success);
                                                      if (res.success == true) {
                                                        QR.to('showTask');
                                                        EasyLoading.dismiss();
                                                        Notifications.success(
                                                          title: "Parabéns",
                                                          message:
                                                              "Sua tarefa foi atualizada com sucesso!",
                                                        );
                                                      }
                                                      if (res.success ==
                                                          false) {
                                                        String message =
                                                            "Ocorreu um erro. Tente novamente mais tarde!";
                                                        EasyLoading.dismiss();
                                                        Notifications.error(
                                                          title: "Atenção",
                                                          message: message,
                                                        );
                                                      }
                                                      return;
                                                    }

                                                    if (_controllerName.text ==
                                                        '') {
                                                      EasyLoading.dismiss();
                                                      Notifications.error(
                                                        title: "Atenção",
                                                        message:
                                                            'Verifique o Nome. Para poder prosseguir',
                                                      );
                                                      return;
                                                    }
                                                    ResponseFunction? res =
                                                        await utilStore.create(
                                                      name:
                                                          _controllerName.text,
                                                      description:
                                                          _controllerDescription
                                                              .text,
                                                      deadline:
                                                          _controllerDeadline
                                                              .text,
                                                      status: _controllerStatus
                                                          .text,
                                                      priority:
                                                          _controllerPriority
                                                              .text,
                                                      tag: _controllerTag.text,
                                                    );
                                                    print(res!.success);
                                                    if (res.success == true) {
                                                      EasyLoading.dismiss();
                                                      Notifications.success(
                                                        title: "Parabéns",
                                                        message:
                                                            "Sua tarefa foi cadastrada com sucesso!",
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
                                                  },
                                                  child: Ink(
                                                    decoration: BoxDecoration(
                                                      gradient:
                                                          const LinearGradient(
                                                              colors: [
                                                            Constants.color3,
                                                            Constants.color3,
                                                          ]),
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(10.sp),
                                                      ),
                                                    ),
                                                    child: Container(
                                                      constraints:
                                                          const BoxConstraints(
                                                        minWidth: 200,
                                                        minHeight: 30,
                                                      ),
                                                      alignment:
                                                          Alignment.center,
                                                      child: const Text(
                                                        'Salvar',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style: TextStyle(
                                                          color:
                                                              Constants.white,
                                                          fontSize: 21,
                                                        ),
                                                      ),
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
                                SizedBox(
                                  height: 5.sp,
                                ),
                              ],
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
