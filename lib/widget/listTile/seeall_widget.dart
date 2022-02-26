import 'package:flutter/material.dart';
import 'package:git/constant/sizeconfige/size_config.dart';

class SeeAll extends StatelessWidget {
  final String? name;
  final onTap;
  const SeeAll({ Key? key,this.name, this.onTap }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SizedBox(width: getWidth(20)),
        Text("$name",
          style: TextStyle(
            color: Colors.black,
            fontSize: getWidth(18),
            fontWeight: FontWeight.w700,
          ),
        ),
        Spacer(),
        InkWell(
          child: Text("See all",
            style: TextStyle(
              fontSize: getWidth(14),
              color: Colors.grey,
            ),
          ),
          onTap: onTap,
        ),
        SizedBox(width: getWidth(20)),
      ],
    );
  }
}