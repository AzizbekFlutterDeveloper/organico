import 'package:flutter/material.dart';
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
      body: MyPadding.myPadding(
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
          ],
        ),
      ),
    );
  }
}
