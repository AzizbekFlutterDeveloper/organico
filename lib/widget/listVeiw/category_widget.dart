import 'dart:math';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:git/constant/color/color_data.dart';
import 'package:git/constant/sizeconfige/size_config.dart';
import 'package:git/widget/my_padding.dart';

class Category extends StatelessWidget {
  const Category({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: getHeight(178),
      width: getWidth(414),
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: 3,
        itemBuilder: ((context, index) {
          return Container(
            margin: EdgeInsets.only(
              left: getWidth(16),
              top: getHeight(16),
              bottom: getHeight(20)
            ),
            height: getHeight(134),
            width: getWidth(123),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(20)),
              color: ColorContainer.colors[Random().nextInt(6)],
            ),
            child: MyPadding.myPadding(
              left: 20.0,
              bottom: 20.0,
              top: 20.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  SizedBox(
                    height: getHeight(59),
                    width: getWidth(72),
                    child: CachedNetworkImage(imageUrl: "https://firebasestorage.googleapis.com/v0/b/organicshop-c2f38.appspot.com/o/furite%2Fapple.png?alt=media&token=df308747-cf47-4d9a-abb4-e2bd622683e5",fit: BoxFit.fill,),
                  ),
                  Text("Fruits",
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: getWidth(16),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ],
              ),
            ),
          );
        })
      ),
    );
  }
}