import 'package:flutter/material.dart';
import 'package:git/constant/sizeconfige/size_config.dart';
import 'package:git/main.dart';
import 'package:git/widget/listTile/my_appbar.dart';
import 'package:git/widget/contanier/my_contanier.dart';
import 'package:git/widget/my_padding.dart';
import 'package:provider/provider.dart';

import '../../provider/icons_provider.dart';
import '../../service/phone_number_service.dart';
import '../../widget/text_form.dart';

class ResetPasswordPage extends StatelessWidget {
  ResetPasswordPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _newNameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _newpasswordKey = GlobalKey<FormState>();
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
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyAppBar.myAppBar(context, name: "Reset Password"),
              SizedBox(height: getHeight(48)),
              Text(
                "Please fill in the field below to reset your current password.",
                style: TextStyle(
                  fontSize: getWidth(15),
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: getHeight(48)),
              Text(
                "New Password",
                style: TextStyle(
                  fontSize: getWidth(16),
                  fontWeight: FontWeight.w700,
                ),
              ),
              MyTextForm(
                controller: PhoneService.userController,
                keys: _newNameKey,
                name: "New Password",
                keyboardType: TextInputType.text,
                supffixIcon: IconButton(
                  onPressed: () {
                    context.read<PasswordIconsProvider>().passwordIconRef();
                  },
                  icon: context.watch<PasswordIconsProvider>().passwordIcon ==
                          false
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.remove_red_eye),
                ),
                validator: (v) {
                  if (PhoneService.userController.text.length < 2) {
                    return "";
                  }
                },
              ),
              Text(
                "New Password Confirmation",
                style: TextStyle(
                  fontSize: getWidth(16),
                  fontWeight: FontWeight.w700,
                ),
              ),
              MyTextForm(
                controller: PhoneService.passwordController,
                keys: _newpasswordKey,
                name: "New Password Confirmation",
                keyboardType: TextInputType.text,
                obscureText:
                    context.watch<PasswordIconsProvider>().passwordIcon,
                supffixIcon: IconButton(
                  onPressed: () {
                    context.read<PasswordIconsProvider>().passwordIconRef();
                  },
                  icon: context.watch<PasswordIconsProvider>().passwordIcon ==
                          false
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.remove_red_eye),
                ),
                validator: (v) {
                  if (PhoneService.passwordController.text.length < 8) {
                    return "";
                  }
                },
              ),
              MyContainer.myContainer(
                top: 40.0,
                child: Center(
                  child: Text(
                    "Reset password",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getWidth(16),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
