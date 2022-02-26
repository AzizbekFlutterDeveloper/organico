import 'package:flutter/material.dart';
import 'package:git/constant/sizeconfige/size_config.dart';
import 'package:git/widget/listTile/cupon_widget.dart';
import 'package:git/widget/listVeiw/best_widget.dart';
import 'package:git/widget/listVeiw/category_widget.dart';
import 'package:git/widget/contanier/my_contanier.dart';
import 'package:git/widget/my_padding.dart';
import 'package:git/widget/listTile/seeall_widget.dart';
import 'package:provider/provider.dart';

import '../../provider/location_provider.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return Scaffold(
      body: MyPadding.myPadding(
        top: 68.0,
        child: Column(
          children: [
            Text(
              "Your Location",
              style: TextStyle(
                fontSize: getWidth(14),
                color: Colors.grey,
              ),
            ),
            Center(
              child: ChangeNotifierProvider<LocationProvider>(
                create: (context) => LocationProvider(),
                builder: (context, child) => TextButton(
                  child: context.watch<LocationProvider>().adress == "Reset"
                      ? Text(context.watch<LocationProvider>().adress)
                      : Text(
                          "${context.watch<LocationProvider>().adress.split(',')[0]}\n${context.watch<LocationProvider>().adress.split(',')[1]}"),
                  onPressed: () {
                    context.read<LocationProvider>().updateAdress();
                  },
                ),
              ),
            ),
            MyContainer.myContainer(
              top: 20.0,
              bottom: 32.0,
              color: Colors.grey.shade200,
              child: Row(
                children: [
                  SizedBox(width: getWidth(16)),
                  Icon(
                    Icons.search,
                    size: getWidth(28),
                    color: Colors.grey,
                  ),
                  SizedBox(width: getWidth(20)),
                  Text(
                    "Search anything here",
                    style: TextStyle(
                      color: Colors.grey,
                      fontSize: getWidth(16),
                    ),
                  ),
                ],
              ),
            ),
            const CuponContainer(
              title: "You have 3 coupon",
              subtitle: "Let’s use this coupon",
            ),
            SizedBox(height: getHeight(40)),
            SeeAll(name: "Choose Category"),
            Category(),
            SizedBox(height: getHeight(25)),
            SeeAll(name: "Best Selling",),
            BestSelling(),
          ],
        ),
      ),
    );
  }
}
