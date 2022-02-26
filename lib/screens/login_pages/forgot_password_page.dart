import 'package:flutter/material.dart';
import 'package:git/constant/sizeconfige/size_config.dart';
import 'package:git/service/phone_number_service.dart';
import 'package:git/widget/listTile/my_appbar.dart';
import 'package:git/widget/contanier/my_contanier.dart';
import 'package:git/widget/my_padding.dart';
import 'package:git/widget/text_form.dart';

class ForgotPasswordPage extends StatelessWidget {
  ForgotPasswordPage({Key? key}) : super(key: key);
  final GlobalKey<FormState> _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: MyPadding.myPadding(
          top: 44.0,
          left: 20.0,
          right: 20.0,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyAppBar.myAppBar(context, name: "Forgot Password"),
              SizedBox(height: getHeight(28)),
              SizedBox(
                height: getHeight(345),
                width: getWidth(349),
                child: Image.asset("assets/images/forgat.png"),
              ),
              SizedBox(height: getHeight(70)),
              Text(
                "Enter your phone number",
                style: TextStyle(
                  fontSize: getWidth(20),
                  fontWeight: FontWeight.w700,
                ),
              ),
              SizedBox(height: getHeight(16)),
              Text(
                "We need to verify you. We will send you a one-time authorization code. ",
                style: TextStyle(
                  fontSize: getWidth(16),
                  color: Colors.grey,
                ),
              ),
              SizedBox(height: getHeight(24)),
              MyTextForm(
                  controller: PhoneService.phoneController,
                  keys: _key,
                  name: "Your Phone Number",
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
                  validator: (v) {
                    if (PhoneService.phoneController.text.length != 9) {
                      return "";
                    }
                  }),
              InkWell(
                child: MyContainer.myContainer(
                  top: 79.0,
                  child: Center(
                    child: Text(
                      "Next",
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: getWidth(16),
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
                onTap: () {
                  if (_key.currentState!.validate()) {
                    PhoneService.sendSms(context);
                    Navigator.pushNamed(context, '/otac');
                  }
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
