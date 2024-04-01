import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:tasks_mobile/utils/constants.dart';

class LogoLogin extends StatelessWidget {
  const LogoLogin({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          SizedBox(height: .05.sh),
          Padding(
            padding: EdgeInsets.only(bottom: .02.sw),
            child: Image.asset(
              'assets/img/logo.jpg',
              height: .05.sh,
            ),
          ),
          Padding(
            padding: EdgeInsets.only(bottom: 15.sp),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Organize suas tarefas de maneira eficiente e acompanhe seu progresso com facilidade.',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: Constants.white,
                    fontSize: 13.sp,
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: .05.sh),
        ],
      ),
    );
  }
}
