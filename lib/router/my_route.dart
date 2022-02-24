import 'package:flutter/material.dart';
import 'package:git/screens/login_pages/sing_in.dart';
import 'package:git/screens/login_pages/start_page.dart';

class MyRouter {
  Route? generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => const StartPage());
      case '/sign_in':
        return MaterialPageRoute(builder: (_) => const SignInPage());
    }
  }
}