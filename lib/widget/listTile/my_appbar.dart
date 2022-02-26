import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:git/constant/sizeconfige/size_config.dart';

class MyAppBar {
  static myAppBar(context,{name}) {
    return SizedBox(
      width: getWidth(374),
      height: getHeight(65),
      child: Center(
        child: Row(
          children: [
            SizedBox(
              width: getWidth(5),
            ),
            InkWell(
              child: const Icon(
                Icons.arrow_back_ios,
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            SizedBox(
              width: getWidth(29),
            ),
            Text("$name",
              style: TextStyle(
                fontSize: getWidth(18),
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
