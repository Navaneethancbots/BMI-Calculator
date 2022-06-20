import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constants.dart';

class IconContant extends StatelessWidget {
   IconContant({ required this.icon,required this.lable});
  final IconData icon;
  final String lable;
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(icon,size: 80,color: Colors.white,),
        SizedBox(
          height: 15,
        ),
        Text(lable,style: kLabelTextStyle,),
      ],
    );
  }
}