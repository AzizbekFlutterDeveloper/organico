import 'package:flutter/widgets.dart';
import 'package:git/constant/sizeconfige/size_config.dart';

class MyPadding{
  static myPadding({top = 0.0, left = 0.0, right = 0.0 , bottom = 0.0, child}){
    return Padding(
      padding: EdgeInsets.only(
        top: getHeight(top),
        bottom: getHeight(bottom),
        left: getWidth(left),
        right: getWidth(right),
      ),
      child: child,
    );
  }
}