import 'package:flutter/material.dart';
import 'package:git/constant/color/scaffold_color.dart';
import 'package:git/provider/icons_provider.dart';
import 'package:git/widget/my_contanier.dart';
import 'package:git/widget/my_padding.dart';
import 'package:provider/provider.dart';
import '../../constant/sizeconfige/size_config.dart';
import '../../provider/dark_vs_light_provider.dart';

class SignInPage extends StatelessWidget {
  const SignInPage({Key? key}) : super(key: key);

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
              MyContainer.myContainer(
                top: 32.0,
                border: Border.all(color: Colors.grey),
                color: Colors.transparent,
                child: TextFormField(
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
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
                          Text(" +998",
                            style: TextStyle(
                              fontSize: getHeight(16)
                            ),
                          ),
                        ],
                      ),
                    ),
                    hintText: " Your Phone Number",
                    border: InputBorder.none,
                  ),
                ),
              ),
              MyContainer.myContainer(
                top: 20.0,
                bottom: 24.0,
                border: Border.all(color: Colors.grey),
                color: Colors.transparent,
                child: TextFormField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    prefixIcon: Icon(Icons.lock_outline_rounded),
                    suffixIcon: IconButton(
                      icon: context.watch<PasswordIconsProvider>().passwordIcon == false ?  Icon(Icons.remove_red_eye) : Icon(Icons.remove_red_eye_outlined),
                      onPressed: (){
                        context.read<PasswordIconsProvider>().passwordIconRef();
                      },
                    ),
                    hintText: "Password",
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    child: Text("Forgot Password",
                      style: TextStyle(
                        color: ScaffoldColor.buttomColor,
                        fontSize: getWidth(16),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ],
              ),
              MyContainer.myContainer(
                top: 44.0,
                bottom: 15.0,
                child: Center(
                  child: Text("Sign In",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getWidth(16),
                    ),
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    child: Text("Sign up",
                      style: TextStyle(
                        color: ScaffoldColor.buttomColor,
                        fontSize: getWidth(16),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    onTap: (){
                      Navigator.pushNamed(context, '/sign_up');
                    },
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
