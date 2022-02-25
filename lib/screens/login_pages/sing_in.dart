import 'package:flutter/material.dart';
import 'package:git/constant/color/scaffold_color.dart';
import 'package:git/provider/icons_provider.dart';
import 'package:git/service/phone_number_service.dart';
import 'package:git/widget/my_contanier.dart';
import 'package:git/widget/my_padding.dart';
import 'package:git/widget/text_form.dart';
import 'package:provider/provider.dart';
import '../../constant/sizeconfige/size_config.dart';
import '../../provider/dark_vs_light_provider.dart';

class SignInPage extends StatelessWidget {
  SignInPage({Key? key}) : super(key: key);
  final GlobalKey _phonekey = GlobalKey<FormState>();
  final GlobalKey _passwordkey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    var textColor = context.watch<DarkVsLightProvider>().textColor;
    return Scaffold(
      body: SingleChildScrollView(
        child: MyPadding.myPadding(
          left: 20.0,
          right: 20.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyPadding.myPadding(
                top: 90.0,
                left: 12.0,
                bottom: 64.0,
                child: SizedBox(
                  height: getHeight(318),
                  width: getWidth(349),
                  child: Image.asset("assets/images/sig_up.png"),
                ),
              ),
              Text(
                "Welcome",
                style: TextStyle(
                  fontSize: getWidth(22),
                  fontWeight: FontWeight.w600,
                  color: textColor,
                ),
              ),
              MyPadding.myPadding(
                top: 16.0,
                child: Text(
                  "Welcome to Organico Mobile Apps. Please fill in the field below to sign in.",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: getWidth(16),
                  ),
                ),
              ),
              MyTextForm(
                controller: PhoneService.phoneController,
                keys: _phonekey,
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
                name: "Your Phone Number",
              ),
              MyTextForm(
                controller: PhoneService.passwordController,
                keys: _passwordkey,
                obscureText:
                    context.watch<PasswordIconsProvider>().passwordIcon,
                prefixIcon: Icon(Icons.lock_outline_rounded),
                supffixIcon: IconButton(
                  icon: context.watch<PasswordIconsProvider>().passwordIcon ==
                          false
                      ? Icon(Icons.visibility_off)
                      : Icon(Icons.remove_red_eye),
                  onPressed: () {
                    context.read<PasswordIconsProvider>().passwordIconRef();
                  },
                ),
                name: " Password",
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    child: Text(
                      "Forgot Password",
                      style: TextStyle(
                        color: ScaffoldColor.buttomColor,
                        fontSize: getWidth(16),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onTap: (){
                      Navigator.pushNamed(context, '/forgot');
                    },
                  ),
                ],
              ),
              InkWell(
                child: MyContainer.myContainer(
                top: 14.0,
                child: Center(
                  child: Text(
                    "Sign In",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getWidth(16),
                    ),
                  ),
                ),
              ),
              onTap: (){
                Navigator.pushNamed(context, '/home');
              },
              ),
              InkWell(
                child: MyContainer.myContainer(
                  top: 14.0,
                  child: Center(
                    child: Text(
                      "Sign up",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: getWidth(16),
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  Navigator.pushNamed(context, '/sign_up');
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
