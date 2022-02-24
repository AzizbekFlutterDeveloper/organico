import 'package:flutter/widgets.dart';

class StartProvider{
  var context;
  StartProvider(this.context){
    Future.delayed(Duration(seconds: 3)).then((value){
      Navigator.pushNamed(context, '/sign_in');
    });
  }
}

