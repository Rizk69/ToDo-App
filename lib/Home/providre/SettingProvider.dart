import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class SettingProvider extends ChangeNotifier{
  String curentlang='en';
  ThemeMode curenttheme=ThemeMode.light;
  void changThem(ThemeMode newtheme){
    if(curenttheme==newtheme){return;}
    curenttheme=newtheme;
    notifyListeners();
  }
  void changLang(String newlang){
    if(curentlang==newlang){return;}
    curentlang=newlang;
    notifyListeners();
  }
  bool isDarkMode() {
    return curenttheme == ThemeMode.dark;
  }

  bool isenglish() {
    return curentlang == 'en';
  }

  Color getBackground() {
    return isDarkMode()
        ?Color(0XFFDFECDB):Color(0XFF060E1E) ;
  }
}