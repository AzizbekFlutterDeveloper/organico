import 'package:flutter/material.dart';
import 'package:git/constant/color/scaffold_color.dart';
import 'package:git/provider/dark_vs_light_provider.dart';
import 'package:git/widget/my_appbar.dart';
import 'package:git/widget/my_contanier.dart';
import 'package:git/widget/my_padding.dart';
import 'package:git/widget/text_form.dart';
import 'package:provider/provider.dart';

import '../../constant/sizeconfige/size_config.dart';
import '../../service/phone_number_service.dart';

class PhoneSmsCodePAge extends StatelessWidget {
  PhoneSmsCodePAge({Key? key}) : super(key: key);
  final GlobalKey _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    var textColor = context.watch<DarkVsLightProvider>().textColor;
    SizeConfig().init(context);
    return Scaffold(
      body: MyPadding.myPadding(
        top: 44.0,
        left: 20.0,
        right: 20.0,
        child: Column(
          children: [
            MyAppBar.myAppBar(context, name: "Sms Code"),
            SizedBox(
              height: getHeight(48),
            ),
            Text(
              "Enter Authorization Code",
              style: TextStyle(
                color: textColor,
                fontSize: getWidth(20),
                fontWeight: FontWeight.w700,
              ),
            ),
            SizedBox(
              height: getHeight(16),
            ),
            Text(
              "We have sent SMS to:",
              style: TextStyle(
                fontSize: getWidth(18),
                fontWeight: FontWeight.w700,
                color: Colors.grey,
              ),
            ),
            Text(
              "+998 ${PhoneService.phoneController.text}",
              style: TextStyle(
                fontSize: getWidth(18),
                fontWeight: FontWeight.w700,
                color: textColor,
              ),
            ),
            MyPadding.myPadding(
              bottom: 27.0,
              child: MyTextForm(
                controller: PhoneService.smsController, 
                keys: _key,
                name: "6 Digit Code",
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  child: Text(
                    "Resend Code",
                    style: TextStyle(
                      color: ScaffoldColor.buttomColor,
                      fontSize: getWidth(16),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  onTap: (){
                     PhoneService.sendSms(context);
                  },
                ),
              ],
            ),
            InkWell(
              child: MyContainer.myContainer(
                top: 55.0,
                child: Center(
                  child: Text("Next",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: getWidth(16),
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ),
              onTap: (){
                PhoneService.codesent(context, Navigator.pushNamedAndRemoveUntil(context, '/home', (route) => false));
              },
            ),
          ],
        ),
      ),
    );
  }
}
