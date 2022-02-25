import 'package:flutter/material.dart';
import 'package:git/constant/sizeconfige/size_config.dart';
import 'package:git/main.dart';
import 'package:git/widget/my_appbar.dart';
import 'package:git/widget/my_padding.dart';

class ResetPasswordPage extends StatelessWidget {
  const ResetPasswordPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: SingleChildScrollView(
        child: MyPadding.myPadding(
          top: 44.0,
          left: 20.0,
          right: 20.0,
          child: Column(
            children: [
              MyAppBar.myAppBar(context,name: "Reset Password"),
              SizedBox(
                
              ),
            ],
          ),
        ),
      ),
    );
  }
}