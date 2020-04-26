import 'package:flutter/material.dart';

import 'package:money_me_app/screens/splash_screen.dart';
=======
import 'package:money_me_app/screen/splash_screen.dart';

import 'package:money_me_app/utils/color_util.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(

      debugShowCheckedModeBanner: false,

      theme: ThemeData(
        primaryColor: ColorUtil.PurpleBackground,
        primaryColorDark: ColorUtil.PurpleBackground,
      ),
      home : SplashScreen(),
    );
  }


}