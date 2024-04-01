// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, deprecated_member_use, library_private_types_in_public_api, sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:qlevar_router/qlevar_router.dart';
import 'package:tasks_mobile/main.dart';
import 'package:tasks_mobile/utils/constants.dart';

import '../home/home_view.dart';

class PerfilView extends StatefulWidget {
  const PerfilView({Key? key});

  @override
  _PerfilViewState createState() => _PerfilViewState();
}

class _PerfilViewState extends State<PerfilView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                decoration: BoxDecoration(
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
                      Expanded(
                        child: SizedBox(
                          width: 1.sw,
                          height: 1.sh,
                          child: ListView(
                            children: [
                              Stack(
                                children: [
                                  Container(
                                    height: 250.sp,
                                    width: double.infinity,
                                    decoration: BoxDecoration(
                                      image: DecorationImage(
                                        image: AssetImage('assets/img/bg.png'),
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
                                    top: 45.sp,
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        ClipOval(
                                          child: Container(
                                            height: 90.sp,
                                            width: 90.sp,
                                            decoration: BoxDecoration(
                                              image: DecorationImage(
                                                image: AssetImage(
                                                  'assets/img/perfil.png',
                                                ),
                                                fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Positioned(
                                    width: 1.sw,
                                    top: 135.sp,
                                    child: SizedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          utilStore.user.name ?? '',
                                          textAlign: TextAlign.center,
                                          style:
                                              TextStyle(color: Constants.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    width: 1.sw,
                                    top: 180,
                                    child: SizedBox(
                                      child: Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: Text(
                                          utilStore.user.email ?? '',
                                          textAlign: TextAlign.center,
                                          style:
                                              TextStyle(color: Constants.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    width: 1.sw,
                                    top: 240,
                                    child: GestureDetector(
                                      onTap: () async {
                                        await sharedPreferences
                                            ?.remove('token');
                                        QR.to('/login');
                                      },
                                      child: SizedBox(
                                        child: Padding(
                                          padding: const EdgeInsets.all(8.0),
                                          child: Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              SizedBox(
                                                width: 25,
                                                child: FaIcon(
                                                  FontAwesomeIcons.signOutAlt,
                                                  color: Constants.white,
                                                  size: 15,
                                                ),
                                              ),
                                              Text(
                                                "Sair",
                                                textAlign: TextAlign.center,
                                                style: TextStyle(
                                                    color: Constants.white),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
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
