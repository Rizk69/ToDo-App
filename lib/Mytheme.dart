import 'dart:ui';

import 'package:flutter/material.dart';

class Mytheme {
  static const Color primarylight = Color(0XFF5D9CEC);
  static const Color bluee = Color(0XFF5D9CEC);
  static const Color scafoldbackgrund = Color(0XFFDFECDB);
  static const Color scafoldbackgrunddar = Color(0XFF060E1E);
  static const Color green = Color(0XFF61E757);
  static const Color red = Color(0XFFEC4B4B);
  static final lighttheme = ThemeData(

      primaryColor: primarylight,
      scaffoldBackgroundColor: scafoldbackgrund,
      bottomNavigationBarTheme: BottomNavigationBarThemeData(

          backgroundColor: Colors.transparent,
          elevation: 0,
          selectedIconTheme: IconThemeData(size: 33),
          unselectedIconTheme: IconThemeData(size: 33)),
      floatingActionButtonTheme: FloatingActionButtonThemeData(
        shape: StadiumBorder(side: BorderSide(color: Colors.white, width: 4)),
      ),
      textTheme: const TextTheme(
          headline1:TextStyle(fontSize: 25, color: primarylight),
          bodyText1: TextStyle(fontSize: 18, color: primarylight),
          headline2: TextStyle(fontSize: 18, color: Colors.black,fontWeight: FontWeight.bold),
          headline3: TextStyle(fontSize: 20, color:Color(0XFFC3C3C3) ),
          bodyText2: TextStyle(fontSize: 19, color: Colors.black)));
  static final darktheme = ThemeData(
      primaryColor: Color(0XFF141922),
      scaffoldBackgroundColor: Color(0XFF141922),
      bottomNavigationBarTheme: const BottomNavigationBarThemeData(

          unselectedItemColor: Colors.white,
          selectedItemColor: bluee,
          backgroundColor: Color(0XFF13171E),

          selectedIconTheme: IconThemeData(size: 33),
          unselectedIconTheme: IconThemeData(size: 33)),
      floatingActionButtonTheme: const FloatingActionButtonThemeData(
        shape: StadiumBorder(side: BorderSide(color: Color(0XFF141922), width: 4)),
      ),

      textTheme: const TextTheme(
          headline1:TextStyle(fontSize: 25, color: primarylight),
          bodyText1: TextStyle(fontSize: 18, color: primarylight),
          headline2: TextStyle(fontSize: 18, color: Colors.black,fontWeight: FontWeight.bold),
          headline3: TextStyle(fontSize: 20, color:Color(0XFFC3C3C3) ),
          bodyText2: TextStyle(fontSize: 19, color: Colors.white)));

}
