import 'package:flutter/material.dart';
import 'package:git/screens/home/home_page.dart';
import 'package:git/screens/login_pages/forgot_password_page.dart';
import 'package:git/screens/login_pages/otac_page.dart';
import 'package:git/screens/login_pages/phone_sms_code_page.dart';
import 'package:git/screens/login_pages/resett_password_page.dart';
import 'package:git/screens/login_pages/sing_in.dart';
import 'package:git/screens/login_pages/start_page.dart';

import '../screens/login_pages/sign_up_page.dart';

class MyRouter {
  Route? generateRoute(RouteSettings settings){
    final args = settings.arguments;
    switch(settings.name){
      case '/':
        return MaterialPageRoute(builder: (_) => const StartPage());
      case '/sign_in':
        return MaterialPageRoute(builder: (_) =>  SignInPage());
      case '/sign_up':
        return MaterialPageRoute(builder: (_) => SignUpPage());
      case '/code':
        return MaterialPageRoute(builder: (_) =>  PhoneSmsCodePAge());
      case '/home':
        return MaterialPageRoute(builder: (_) => const HomePage());
      case '/forgot':
        return MaterialPageRoute(builder: (_) => ForgotPasswordPage());
      case '/otac':
        return MaterialPageRoute(builder: (_) => OTACPage());
      case '/reset':
        return MaterialPageRoute(builder: (_) => ResetPasswordPage());
    }
  }
}