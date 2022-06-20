import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reuseblecard.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';
class ResultPage extends StatelessWidget {

  ResultPage({required this.bmiResult,required this.interpretation,required this.resultText});

  final String bmiResult;
  final String resultText;
  final String interpretation;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Expanded(
            child:Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.center,
              child:Text('Your Result',style: kTitleTextStyle,)
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusebleCard(
            Colour:kActiveCardColor,
            cardChild: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  resultText,style: kResultTextStyle,
                ),
                Text(
                  bmiResult,
                  style: kBMITextStyle,
                ),
                Text(interpretation,style: kBodyTextStyle,),
              ],
            ), onPress: () {  },
          ),
          ),
          BottomButton(onTap: ()async{

            Navigator.pop(context);}, buttonTitle: 'RE CALCULATOR'),
        ],
      ),
    );
  }
}

