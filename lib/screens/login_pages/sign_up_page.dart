import 'package:flutter/material.dart';
import 'package:git/constant/color/scaffold_color.dart';
import 'package:git/constant/sizeconfige/size_config.dart';
import 'package:git/provider/dark_vs_light_provider.dart';
import 'package:git/provider/icons_provider.dart';
import 'package:git/service/google_service.dart';
import 'package:git/service/phone_number_service.dart';
import 'package:git/widget/my_appbar.dart';
import 'package:git/widget/my_contanier.dart';
import 'package:git/widget/my_padding.dart';
import 'package:git/widget/text_form.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  SignUpPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _fullNameKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _passwordKey = GlobalKey<FormState>();
  final GlobalKey<FormState> _phoneKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var textColor = context.watch<DarkVsLightProvider>().textColor;
    return Scaffold(
      body: SingleChildScrollView(
        child: MyPadding.myPadding(
          top: 44.0,
          left: 20.0,
          right: 20.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyAppBar.myAppBar(context, name: "New Registration"),
              SizedBox(
                height: getHeight(48),
              ),
              Text(
                "It looks like you don’t have an account on this number. Please let us know some information for a secure service.",
                style: TextStyle(
                  fontSize: getWidth(15),
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
              ),
              SizedBox(
                height: getHeight(48),
              ),
              Text(
                "Full Name",
                style: TextStyle(
                  fontSize: getWidth(16),
                  fontWeight: FontWeight.w700,
                ),
              ),
              MyTextForm(
                controller: PhoneService.userController,
                keys: _fullNameKey,
                name: "Full Name",
                keyboardType: TextInputType.text,
                validator: (v){
                  if(PhoneService.userController.text.length < 2){
                    return "";
                  }
                },
              ),
              Text(
                "Password",
                style: TextStyle(
                  fontSize: getWidth(16),
                  fontWeight: FontWeight.w700,
                ),
              ),
              MyTextForm(
                controller: PhoneService.passwordController,
                keys: _passwordKey,
                name: "Password",
                keyboardType: TextInputType.text,
                obscureText: context.watch<PasswordIconsProvider>().passwordIcon,
                supffixIcon: IconButton(
                  onPressed: () {
                    context.read<PasswordIconsProvider>().passwordIconRef();
                  },
                  icon: context.watch<PasswordIconsProvider>().passwordIcon ==
                          false
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.remove_red_eye),
                ),
                 validator: (v){
                  if(PhoneService.passwordController.text.length < 8){
                    return "";
                  }
                },
              ),
              Text(
                "Phone Number",
                style: TextStyle(
                  fontSize: getWidth(16),
                  fontWeight: FontWeight.w700,
                ),
              ),
              MyTextForm(
                controller: PhoneService.phoneController, 
                keys: _phoneKey,
                name: "Phone Number",
                prefixIcon: SizedBox(
                    width: getWidth(94),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        CircleAvatar(
                          radius: getWidth(10),
                          backgroundImage: const AssetImage(
                            "assets/images/bayroq.jpg",
                          ),
                        ),
                        Text(
                          " +998",
                          style: TextStyle(fontSize: getHeight(16)),
                        ),
                      ],
                    ),
                  ),
                validator: (v){
                  if(PhoneService.phoneController.text.length != 13 && PhoneService.phoneController.text[0] != "+"){
                    return "";
                  }
                },
              ),
              Row(
                children: [
                  Checkbox(
                    activeColor: ScaffoldColor.buttomColor,
                    value: context.watch<CheckBoxProvider>().checkBox,
                    onChanged: (v) {
                      context.read<CheckBoxProvider>().checkBoxRef(v);
                    },
                  ),
                  Text(
                    "I accept the ",
                    style: TextStyle(
                      fontSize: getWidth(14),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    "Terms of Use ",
                    style: TextStyle(
                      fontSize: getWidth(14),
                      fontWeight: FontWeight.w400,
                      color: ScaffoldColor.buttomColor,
                    ),
                  ),
                  Text(
                    " and ",
                    style: TextStyle(
                      fontSize: getWidth(14),
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Text(
                    " Privacy Policy ",
                    style: TextStyle(
                      fontSize: getWidth(14),
                      fontWeight: FontWeight.w400,
                      color: ScaffoldColor.buttomColor,
                    ),
                  ),
                ],
              ),
              InkWell(
                child: MyContainer.myContainer(
                  top: 48.0,
                  bottom: 24.0,
                  child: Center(
                    child: Text(
                      "Sign Up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: getWidth(16),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  if(_fullNameKey.currentState!.validate() && _passwordKey.currentState!.validate() && _phoneKey.currentState!.validate()){
                    PhoneService.sendSms(context);
                    Navigator.pushNamed(context, '/code');
                  }
                },
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "or use",
                    style:
                        TextStyle(color: Colors.grey, fontSize: getWidth(16)),
                  ),
                ],
              ),
              InkWell(
                child: MyContainer.myContainer(
                  top: 24.0,
                  bottom: 24.0,
                  color: Colors.transparent,
                  border: Border.all(color: Colors.black),
                  child: Center(
                    child: Text(
                      "Sign Up with Google",
                      style: TextStyle(
                        color: textColor,
                        fontSize: getWidth(16),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  GoogleService.signInWithGoogle();
                },
              )
            ],
          ),
        ),
      ),
    );
  }
}
