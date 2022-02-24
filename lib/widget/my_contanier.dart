import 'package:flutter/widgets.dart';
import 'package:git/constant/color/scaffold_color.dart';
import 'package:git/constant/sizeconfige/size_config.dart';

class MyContainer{
  static myContainer({color, left = 0.0, right = 0.0, top = 0.0, bottom = 0.0,child,border}){
    return Container(
      height: getHeight(48),
      width: getWidth(374),
      margin: EdgeInsets.only(
        top: getHeight(top),
        bottom: getHeight(bottom),
        left: getWidth(left),
        right: getWidth(right),
      ),
      padding: EdgeInsets.symmetric(horizontal: getWidth(15)),
      decoration: BoxDecoration(
        color: color ?? ScaffoldColor.buttomColor,
        borderRadius: BorderRadius.all(Radius.circular(100)),
        border: border,
      ),
      child: child,
    );
  }
}