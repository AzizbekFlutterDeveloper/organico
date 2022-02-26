import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:git/constant/color/color_data.dart';
import 'package:git/constant/color/scaffold_color.dart';
import 'package:git/widget/my_padding.dart';

import '../../constant/sizeconfige/size_config.dart';

class Products extends StatelessWidget {
  const Products({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return StreamBuilder(
      builder: (context, snapshot) {
        return Container(
          height: getHeight(242),
          width: getWidth(196),
          margin: EdgeInsets.only(
            left: getWidth(16),
            top: getHeight(20),
          ),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(20)),
            color: ColorContainer.colors[Random().nextInt(6)],
          ),
          child: MyPadding.myPadding(
            top: 20.0,
            left: 20.0,
            right: 20.0,
            bottom: 20.0,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                SizedBox(
                  height: getHeight(79),
                  width: getWidth(97),
                  child: CachedNetworkImage(
                    imageUrl:
                        "https://firebasestorage.googleapis.com/v0/b/organicshop-c2f38.appspot.com/o/furite%2Fapple.png?alt=media&token=df308747-cf47-4d9a-abb4-e2bd622683e5",
                    fit: BoxFit.contain,
                  ),
                ),
                Text(
                  "Apple",
                  style: TextStyle(
                    fontSize: getWidth(16),
                    color: Colors.black,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                Text(
                  "Fruitmarket",
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: getWidth(14),
                    fontWeight: FontWeight.w300,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "\$4.68 /Kg",
                      style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: getWidth(16),
                      ),
                    ),
                    Container(
                      height: getHeight(36),
                      width: getWidth(36),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(10)),
                        color: ScaffoldColor.buttomColor,
                      ),
                      child: Center(
                        child: Icon(
                          Icons.add,
                          size: getWidth(25),
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
