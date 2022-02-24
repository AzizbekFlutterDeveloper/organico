import 'package:flutter/material.dart';
import 'package:git/constant/color/scaffold_color.dart';
import 'package:git/constant/sizeconfige/size_config.dart';
import 'package:git/provider/icons_provider.dart';
import 'package:git/widget/my_appbar.dart';
import 'package:git/widget/my_contanier.dart';
import 'package:git/widget/my_padding.dart';
import 'package:provider/provider.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MyPadding.myPadding(
        top: 44.0,
        left: 20.0,
        right: 20.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            MyAppBar.myAppBar(context,name: "New Registration"),
            SizedBox(
              height: getHeight(48),
            ),
            Text("It looks like you don’t have an account on this number. Please let us know some information for a secure service.",
              style: TextStyle(
                fontSize: getWidth(15),
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
            SizedBox(
              height: getHeight(48),
            ),
            Text("Full Name",
              style: TextStyle(
                fontSize: getWidth(16),
                fontWeight: FontWeight.w700,
              ),
            ),
            MyContainer.myContainer(
              top: 10.0,
              bottom: 16.0,
              color: Colors.transparent,
              border: Border.all(color: Colors.grey),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Full Name",
                ),
              ),
            ),
            Text("Password",
              style: TextStyle(
                fontSize: getWidth(16),
                fontWeight: FontWeight.w700,
              ),
            ),
            MyContainer.myContainer(
              top: 10.0,
              bottom: 16.0,
              color: Colors.transparent,
              border: Border.all(color: Colors.grey),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Password",
                ),
              ),
            ),
            Text("Password Confirmation",
              style: TextStyle(
                fontSize: getWidth(16),
                fontWeight: FontWeight.w700,
              ),
            ),
            MyContainer.myContainer(
              top: 10.0,
              bottom: 16.0,
              color: Colors.transparent,
              border: Border.all(color: Colors.grey),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Password Confirmation",
                ),
              ),
            ),
            Text("Phone Number",
              style: TextStyle(
                fontSize: getWidth(16),
                fontWeight: FontWeight.w700,
              ),
            ),
            MyContainer.myContainer(
              top: 10.0,
              bottom: 16.0,
              color: Colors.transparent,
              border: Border.all(color: Colors.grey),
              child: TextFormField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: "Phone Number",
                ),
              ),
            ),
            Row(
              children: [
                Checkbox(
                  value: context.watch<CheckBoxProvider>().checkBox, 
                  onChanged: (v){
                    context.read<CheckBoxProvider>().checkBoxRef(v);
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}