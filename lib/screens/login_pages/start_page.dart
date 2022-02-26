import 'package:flutter/material.dart';
import 'package:git/constant/sizeconfige/size_config.dart';
import 'package:git/provider/dark_vs_light_provider.dart';
import 'package:git/provider/start_page_provider.dart';
import 'package:git/widget/my_padding.dart';
import 'package:provider/provider.dart';

import '../../widget/contanier/my_contanier.dart';

class StartPage extends StatefulWidget {
  const StartPage({ Key? key }) : super(key: key);

  @override
  State<StartPage> createState() => _StartPageState();
}

class _StartPageState extends State<StartPage> {


  @override
  void initState() {
    StartProvider(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    
    var colorTexxt = context.watch<DarkVsLightProvider>().textColor;
    return Scaffold(
      body: Column(
        children: [
          MyPadding.myPadding(
            top: 347.0,
            left: 136.0,
            right: 135.0,
            bottom: 24.0,
            child: Image.asset("assets/images/Logo.png"),
          ),
          Text("Organico",
            style: TextStyle(
              color: colorTexxt,
              fontSize: getWidth(26),
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}