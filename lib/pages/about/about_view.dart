// ignore_for_file: use_key_in_widget_constructors, must_be_immutable, deprecated_member_use, library_private_types_in_public_api, sort_child_properties_last, prefer_const_literals_to_create_immutables, prefer_const_constructors
import 'dart:async';

import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_mobile/utils/constants.dart';
import 'package:tasks_mobile/store/utils.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final utilStore = GetIt.I.get<Utils>();

class AboutView extends StatefulWidget {
  const AboutView({Key? key});

  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  final List<Map<String, dynamic>> itens = [
    {
      "id": 1,
      "nome": "BANDEIROLA",
      "descricao":
          "Bandeirola de sinalização, fabricado em tecido flurescente, na cor laranja com lima limão , com 50 cm de altura x 60 cm de comprimento, resistente a intermpéries(sol e chuva). Comcabo de madeira de 80cmde comprimento. Peso 150 gramas. Utilizado para advertência em rodovias e vias urbanas.",
      "qtd": "Qtd: 328,00",
      // "decreto": "Decreto 7174",
      // "opcao": "Trat. Diferenciado",
    },
    {
      "id": 2,
      "nome": "BALIZADOR",
      "qtd": "Qtd: 278,00",
      "descricao":
          "Balizador canalizador de fluxo, produxido em polietileno semi-flexivel, com proteção contra raios UV, resistente a interméries(sol e chuva). Possui refletivo adesivo, de alta visibilidade.Cor laranja com refletivo branco. Dimensão máxima de 130 x 120 x 450 mm.",
    },
    {
      "id": 3,
      "nome": "PISCA - PISCA DE SINALIZAÇÃO DE TRÂNSITO",
      "qtd": "Qtd: 338,00",
      "descricao":
          "Pisca de advertência sanfonada, fabricado em polietileno flexível de alta densidade, com proteção contra raios UV, resistente a intempéries (sol e chuva), com sistema fotocécula com 4 leds de alto brilho, alimentação através de 4 pilhas AA e acionamento através de botão liga-desliga. Base com encaixes para cones, super cones, barreiras, cavaletes e balizadores. Cúpula na cor vermelho para sinalização de emergência.",
    },
    {
      "id": 4,
      "nome": "CONE SINALIZAÇÃO",
      "qtd": "Qtd: 300,00",
      "descricao":
          "Cone de sinalização fabricado em polietileno semi-flexível, com proteção contra raios UV, resistente a intempéries (sol e chuva), com 75 cm de altura, com 2 ou 3 fitas adesivas refletivas, com rebaixo individual para proteção das mesmas. Com orifício para encaixe de Pisca de advertência externo (sinalizador noturno) epassagem de correntes e fitas.",
      "lote": "Lote 01",
    },
  ];

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
                                        "Um pouco mais sobre Tasks",
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
                                  "Conheça mais sobre a TASK.",
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
                                        child: Center(
                                          child: Text(
                                            'Bem-vindo ao Task: Sua Ferramenta de Gestão de Tarefas\n\n'
                                            'No caos do dia a dia, manter-se organizado é essencial. Com o Task, você pode transformar suas ideias em ação de forma rápida e eficaz. Não importa se você está gerenciando projetos complexos ou apenas mantendo o controle das tarefas diárias, o Task está aqui para simplificar sua vida.\n\n'
                                            'Recursos Intuitivos, Resultados Notáveis\n\n'
                                            'Com uma interface limpa e intuitiva, o Task permite que você crie, priorize e acompanhe suas tarefas com facilidade. Basta alguns toques para adicionar uma nova tarefa, definir prazos e atribuir prioridades. \n\n'
                                            'Mantenha o Foco, Atinga seus Objetivos\n\n'
                                            'Estabeleça metas claras e acompanhe seu progresso com o Task. Com insights visuais, você pode identificar rapidamente as áreas que exigem mais atenção e ajustar sua abordagem para alcançar seus objetivos com sucesso.\n\n'
                                            'Segurança e Confiabilidade em Primeiro Lugar\n\n'
                                            'Seus dados são preciosos e merecem proteção. Com o Task, você pode confiar em uma plataforma segura e confiável para armazenar suas informações. Suportado por tecnologia de ponta, seus dados estão protegidos contra ameaças externas, garantindo sua privacidade e tranquilidade.\n\n'
                                            'Experimente o Task Hoje Mesmo\n\n'
                                            'Não espere mais para organizar sua vida. Liberte-se do caos, conquiste mais e viva com propósito com o Task ao seu lado.',
                                            style: TextStyle(
                                              color: Constants.white,
                                            ),
                                          ),
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
