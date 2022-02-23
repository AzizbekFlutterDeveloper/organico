import 'package:flutter/material.dart';
import 'package:git/constant/color/scaffold_color.dart';

class DarkVsLightProvider extends ChangeNotifier{
  ThemeData scaffoldColor = ScaffoldColor.light;
  Color textColor = ScaffoldColor.lightColor;

  void colorRef(){
    scaffoldColor == ScaffoldColor.light ? scaffoldColor = ScaffoldColor.dark : scaffoldColor = ScaffoldColor.light;
    textColor == ScaffoldColor.lightColor ? textColor = ScaffoldColor.darkColor : textColor = ScaffoldColor.lightColor;
    notifyListeners();
  }

}