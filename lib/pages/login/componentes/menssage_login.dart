import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_mobile/utils/constants.dart';
import 'package:tasks_mobile/store/utils.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

final List<Map> _info = <Map>[
  {
    'id': '1',
    'titulo': 'Organização',
    'descricao':
        'Mantenha suas atividades organizadas e em ordem por criar tarefas',
  },
  {
    'id': '2',
    'titulo': 'Produtividade',
    'descricao':
        'Aumente sua produtividade ao planejar e priorizar suas tarefas.',
  },
  {
    'id': '3',
    'titulo': 'Redução do Estresse',
    'descricao':
        'Evite esquecimentos e a sensação de sobrecarga, reduzindo o estresse.',
  },
  {
    'id': '4',
    'titulo': 'Foco',
    'descricao':
        'Mantenha o foco nas tarefas mais importantes e evite distrações.',
  },
];

final utilStore = GetIt.I.get<Utils>();

class MessageLogin extends StatefulWidget {
  const MessageLogin({super.key});

  @override
  State<MessageLogin> createState() => _MessageLoginState();
}

class _MessageLoginState extends State<MessageLogin> {
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          color: Colors.black.withOpacity(0.5),
          height: 75.sp,
          width: 1.sw,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                _info[utilStore.indexPageLogin]['titulo'],
                style: TextStyle(
                    color: Constants.white,
                    fontSize: 13.sp,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                _info[utilStore.indexPageLogin]['descricao'],
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: Constants.white,
                  fontSize: 13.sp,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 25.sp,
        ),
        const Padding(
          padding: EdgeInsets.symmetric(vertical: .0),
          child: Text(
            Constants.versionApp,
            style: TextStyle(
              color: Constants.white,
            ),
          ),
        ),
        SizedBox(
          height: 5.sp,
        ),
        Container(
          width: 1.sw / 3,
          height: 2.sp,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(510.sp),
            color: Constants.black,
          ),
        ),
      ],
    );
  }
}
