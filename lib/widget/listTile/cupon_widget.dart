import 'package:flutter/material.dart';
import 'package:git/constant/color/scaffold_color.dart';
import 'package:git/constant/sizeconfige/size_config.dart';

class CuponContainer extends StatelessWidget {
  final IconData? icon;
  final String? title;
  final String? subtitle;
  const CuponContainer({Key? key, this.icon,this.title,this.subtitle}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SizeConfig().init(context);
    return SizedBox(
      height: getHeight(46),
      width: getHeight(374),
      child: Row(
        children: [
          Container(
            height: getHeight(44),
            width: getWidth(44),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: ScaffoldColor.buttomColor,
            ),
            child: Center(
              child: Icon(
                icon ??
                Icons.confirmation_num_outlined,
                size: getWidth(27),
                color: Colors.white,
              ),
            ),
          ),
          SizedBox(width: getWidth(16)),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment:subtitle == null ? MainAxisAlignment.center : MainAxisAlignment.start,
            children: [
              Text(
                "$title",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: getWidth(18),
                  fontWeight: FontWeight.w600,
                ),
              ),
              subtitle == null ? SizedBox() :Text(
                "$subtitle",
                style: TextStyle(
                  color: Colors.grey,
                  fontSize: getWidth(14),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          Spacer(),
          InkWell(
            child: Icon(Icons.arrow_forward_ios_rounded),
            onTap: () {},
          ),
        ],
      ),
    );
  }
}
