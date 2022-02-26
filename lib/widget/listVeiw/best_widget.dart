import 'package:flutter/material.dart';
import 'package:git/constant/sizeconfige/size_config.dart';
import 'package:git/widget/contanier/products_widget.dart';

class BestSelling extends StatelessWidget {
  const BestSelling({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(300),
      width: getWidth(414),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 4,
        itemBuilder:  (context, index) {
          return Products();
        },)
    );
  }
}