import 'package:flutter/material.dart';

class PasswordIconsProvider extends ChangeNotifier{
  bool passwordIcon = true;

  void passwordIconRef(){
    passwordIcon = !passwordIcon;
    notifyListeners();
  }
}

class CheckBoxProvider extends ChangeNotifier{
  bool checkBox = false;

  void checkBoxRef(v){
    checkBox = v;
    notifyListeners();
  }
}