// ignore_for_file: avoid_print
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:tasks_mobile/pages/login/componentes/form_cadastrar.dart';
import 'package:tasks_mobile/pages/login/componentes/menssage_login.dart';
import 'package:tasks_mobile/pages/login/componentes/form_login.dart';
import 'package:tasks_mobile/pages/login/componentes/logo_login.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_mobile/store/utils.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final utilStore = GetIt.I.get<Utils>();

class LoginTab1 extends StatefulWidget {
  const LoginTab1({super.key});

  @override
  State<LoginTab1> createState() => _LoginTab1State();
}

class _LoginTab1State extends State<LoginTab1> {
  final FocusNode _focusEmail = FocusNode();
  final FocusNode _focusPassword = FocusNode();

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SizedBox(
            height: 1.sh,
            width: 1.sw,
            child: Stack(
              children: [
                Container(
                  height: double.infinity,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: const AssetImage('assets/img/bg.png'),
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
                GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    _focusEmail.unfocus();
                    _focusPassword.unfocus();
                  },
                  child: SizedBox(
                    height: double.infinity,
                    width: double.infinity,
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                                left: .05.sw, right: .05.sw, top: .2.sw),
                            child: const Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                LogoLogin(),
                                FormLogin(),
                                FormCadastrar(),
                              ],
                            ),
                          ),
                          Observer(builder: (_) {
                            return utilStore.formLogin != true
                                ? SizedBox(height: .03.sh)
                                : SizedBox(height: .1.sh);
                          }),
                          const MessageLogin(),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
