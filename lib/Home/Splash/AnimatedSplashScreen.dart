import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../Home_screen.dart';

class AnimatedScreen extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash:Image.asset('lib/assets/logo.png'),
        nextScreen: Home_Screen() ,
        splashTransition: SplashTransition.slideTransition,
        backgroundColor: Color(0XFF5D9CEC),
        splashIconSize: 250,
      duration: 4000,



      )
    ;
  }
}
