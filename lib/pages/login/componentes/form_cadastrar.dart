// ignore_for_file: avoid_print

import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tasks_mobile/model/response_function.dart';
import 'package:tasks_mobile/utils/constants.dart';
import 'package:tasks_mobile/store/utils.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:tasks_mobile/utils/notifications.dart';

final utilStore = GetIt.I.get<Utils>();
final FocusNode _focusName = FocusNode();
final FocusNode _focusEmail = FocusNode();
final FocusNode _focusPassword = FocusNode();
final FocusNode _focusPasswordConfirmation = FocusNode();

final TextEditingController _controllerName = TextEditingController(text: "");
final TextEditingController _controllerEmail = TextEditingController(text: "");
final TextEditingController _controllerPassword =
    TextEditingController(text: "");
final TextEditingController _controllerPasswordConfirmation =
    TextEditingController(text: "");

class FormCadastrar extends StatelessWidget {
  const FormCadastrar({super.key});

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (_) {
      if (utilStore.formLogin) {
        return Container();
      }
      return SizedBox(
        child: Form(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Container(
                padding: EdgeInsets.only(bottom: 15.sp),
                child: Text(
                  'CADASTRAR',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Constants.white,
                    fontSize: 18.sp,
                  ),
                ),
              ),
              Observer(builder: (_) {
                return Container(
                  height: 50.sp,
                  padding: EdgeInsets.only(left: 10.0.sp),
                  decoration: BoxDecoration(
                    color: Constants.white.withOpacity(0.2.sp),
                    borderRadius: BorderRadius.circular(15.0.sp),
                  ),
                  child: TextFormField(
                    focusNode: _focusName,
                    style: const TextStyle(color: Constants.white),
                    decoration: const InputDecoration(
                      labelText: 'Nome (*)',
                      labelStyle: TextStyle(color: Constants.white),
                      border: InputBorder.none,
                    ),
                    controller: _controllerName,
                  ),
                );
              }),
              SizedBox(height: .02.sh),
              Container(
                height: 50.sp,
                padding: EdgeInsets.only(left: 10.0.sp),
                decoration: BoxDecoration(
                  color: Constants.white.withOpacity(0.2.sp),
                  borderRadius: BorderRadius.circular(15.0.sp),
                ),
                child: TextFormField(
                  focusNode: _focusEmail,
                  style: const TextStyle(color: Constants.white),
                  decoration: const InputDecoration(
                    labelText: 'E-mail (*)',
                    labelStyle: TextStyle(color: Constants.white),
                    border: InputBorder.none,
                  ),
                  controller: _controllerEmail,
                  onChanged: (value) async {
                    bool? validEmail =
                        EmailValidator.validate(value.replaceAll(' ', ''));
                    if (!validEmail) {
                      utilStore.setMessageEmailValida(
                          'Não parece ser um e-mail valido');
                    } else {
                      utilStore.setMessageEmailValida('');
                    }
                  },
                ),
              ),
              Observer(builder: (_) {
                return Text(
                  utilStore.messageEmailValida,
                  style: const TextStyle(color: Colors.red),
                );
              }),
              Container(
                height: 50.sp,
                padding: EdgeInsets.only(left: 10.0.sp),
                decoration: BoxDecoration(
                  color: Constants.white.withOpacity(0.2.sp),
                  borderRadius: BorderRadius.circular(15.0.sp),
                ),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Observer(builder: (_) {
                      return TextFormField(
                        focusNode: _focusPassword,
                        obscureText: !utilStore.seePassword,
                        controller: _controllerPassword,
                        style: const TextStyle(color: Constants.white),
                        decoration: const InputDecoration(
                          labelText: 'Senha',
                          labelStyle: TextStyle(color: Constants.white),
                          border: InputBorder.none,
                        ),
                      );
                    }),
                    IconButton(
                      onPressed: () {
                        utilStore.setSeePassword(!utilStore.seePassword);
                      },
                      icon: Observer(builder: (_) {
                        return Icon(
                          utilStore.seePassword
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Constants.white,
                        );
                      }),
                    ),
                  ],
                ),
              ),
              SizedBox(height: .02.sh),
              Container(
                height: 50.sp,
                padding: EdgeInsets.only(left: 10.0.sp),
                decoration: BoxDecoration(
                  color: Constants.white.withOpacity(0.2.sp),
                  borderRadius: BorderRadius.circular(15.0.sp),
                ),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: [
                    Observer(builder: (_) {
                      return TextFormField(
                        focusNode: _focusPasswordConfirmation,
                        obscureText: !utilStore.seePasswordConfimartion,
                        controller: _controllerPasswordConfirmation,
                        style: const TextStyle(color: Constants.white),
                        decoration: const InputDecoration(
                          labelText: 'Confirmar senha',
                          labelStyle: TextStyle(color: Constants.white),
                          border: InputBorder.none,
                        ),
                      );
                    }),
                    IconButton(
                      onPressed: () {
                        utilStore.setSeePasswordConfimartion(
                            !utilStore.seePasswordConfimartion);
                      },
                      icon: Observer(builder: (_) {
                        return Icon(
                          utilStore.seePasswordConfimartion
                              ? Icons.visibility
                              : Icons.visibility_off,
                          color: Constants.white,
                        );
                      }),
                    ),
                  ],
                ),
              ),
              SizedBox(height: .03.sh),
              SizedBox(
                width: 1.sw / 1.7,
                height: 50.sp,
                child: Center(
                  child: TextButton(
                    onPressed: () async {
                      EasyLoading.show(status: "Carregando...");

                      if (_controllerPassword.text !=
                          _controllerPasswordConfirmation.text) {
                        EasyLoading.dismiss();
                        Notifications.error(
                          title: "Atenção",
                          message:
                              'Verifique o campo Senha e Confirmar senha. Para prosseguir',
                        );
                        return;
                      }

                      ResponseFunction? res = await utilStore.register(
                        name: _controllerName.text,
                        email: _controllerEmail.text,
                        password: _controllerPassword.text,
                        passwordConfirmation:
                            _controllerPasswordConfirmation.text,
                      );
                      print(res!.success);
                      if (res.success == true) {
                        EasyLoading.dismiss();
                        QR.to("home");
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
                        gradient: const LinearGradient(colors: [
                          Constants.color3,
                          Constants.color3,
                        ]),
                        borderRadius: BorderRadius.all(
                          Radius.circular(10.sp),
                        ),
                      ),
                      child: Container(
                        constraints: const BoxConstraints(
                          minWidth: 200,
                          minHeight: 30,
                        ),
                        alignment: Alignment.center,
                        child: const Text(
                          'ENVIAR',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Constants.white,
                            fontSize: 21,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              TextButton(
                onPressed: () {
                  utilStore.setformLogin(true);
                },
                child: RichText(
                  text: TextSpan(
                    text: 'Já é cadastrado? ',
                    style: TextStyle(
                      color: Constants.white,
                      fontSize: 16.sp,
                      fontFamily: 'Libre',
                    ),
                    children: [
                      TextSpan(
                        text: 'Entrar',
                        style: TextStyle(
                          color: Constants.white,
                          fontFamily: 'Roboto',
                          fontWeight: FontWeight.bold,
                          fontSize: 16.sp,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      );
    });
  }
}
