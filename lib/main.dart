import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/screens/imputpage.dart';

void main()=>runApp(BMICalculator(),);
class BMICalculator extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primaryColor: Colors.black,
        accentColor: Colors.purple,
        scaffoldBackgroundColor: Colors.black,
      ),
        home: InputPage(),

    );
  }
}
