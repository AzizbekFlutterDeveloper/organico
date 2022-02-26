import 'package:flutter/material.dart';
import 'package:git/widget/listTile/my_appbar.dart';
import 'package:git/widget/my_padding.dart';
import 'package:provider/provider.dart';

import '../../constant/color/scaffold_color.dart';
import '../../constant/sizeconfige/size_config.dart';
import '../../provider/dark_vs_light_provider.dart';
import '../../service/phone_number_service.dart';
import '../../widget/contanier/my_contanier.dart';
import '../../widget/text_form.dart';

class OTACPage extends StatelessWidget {
  OTACPage({ Key? key }) : super(key: key);
  final GlobalKey<FormState> _key = GlobalKey<FormState>();

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
            children: [
              MyAppBar.myAppBar(context,name: "OTAC Number"),
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
                validator: (v){
                  if(PhoneService.smsController.text.length != 6){
                    return "";
                  }
                },
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
                if(_key.currentState!.validate()){
                  PhoneService.codesent(context,  Navigator.pushNamedAndRemoveUntil(context, "/reset", (route) => false));
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