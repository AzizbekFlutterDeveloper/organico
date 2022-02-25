import 'package:flutter/material.dart';
import 'package:git/constant/color/scaffold_color.dart';
import 'package:git/constant/sizeconfige/size_config.dart';
import 'package:git/widget/my_contanier.dart';

class MyTextForm extends StatelessWidget {
  var controller;
  var keys;
  var validator;
  var prefixIcon;
  var supffixIcon;
  var keyboardType;
  bool? obscureText;
  String? name;
   MyTextForm({ Key? key,required this.controller, required this.keys, this.name, this.validator, this.prefixIcon,this.supffixIcon,this.obscureText ,this.keyboardType}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(
        top: getHeight(10),
        bottom: getHeight(16),
      ),
      height: getHeight(76),
      child: MyContainer.myContainer(
        color: Colors.transparent,
        border: Border.all(color: Colors.grey),
        child: Form(
          key: keys,
          child: TextFormField(
            keyboardType:keyboardType ?? TextInputType.phone,
            controller: controller,
            obscureText: obscureText ?? false,
            decoration: InputDecoration(
              suffixIcon: supffixIcon,
              prefixIcon: prefixIcon,
              iconColor: Colors.grey,
              hintText: name,
              contentPadding: EdgeInsets.all(
                getWidth(10)
              ),
              border: InputBorder.none
            ),
            validator: validator,
          ),
        ),
      ),
    );
  }
}