import 'dart:developer';

import 'package:bmi_calculator/Sql/History.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/components/reuseblecard.dart';
import 'package:bmi_calculator/components/iconcontant.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/screens/result_page.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/calculator_brain.dart';
import 'package:bmi_calculator/Sql/UserService.dart';
import 'package:bmi_calculator/Sql/User.dart';
import 'package:intl/intl.dart';


// enum Gender {
//   male,
//   female,
// }
class InputPage extends StatefulWidget {

  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {

  TextEditingController nameController = TextEditingController();

var selectedGender;
var height = 180;
var weight = 60;
var age = 25;
var male ='Male';
var female ='Female';
final _userService = UserService();

var dateAndTime = DateTime.now().toString();

  _showSuccessSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
      ),
    );
  }



@override
  void initState() {
    CalculatorBrain(height: height, weight: weight);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {


    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
        centerTitle: true,
        backgroundColor: Colors.black,
        actions: [

          IconButton(onPressed: (){

            Navigator.of(context).push(
              MaterialPageRoute(
                // Builder for the nextpage
                // class's constructor.
                  builder: (context) => History(

                  )),
            );

          } ,icon: Icon(Icons.history))

        ],

      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[

          Padding(
            padding: const EdgeInsets.only(left: 16,right: 16),
            child: TextField(
              style: TextStyle(color: Colors.white,fontSize: 20),
              controller: nameController,
              decoration: InputDecoration(
                fillColor: Colors.teal,
                filled: true,
                contentPadding: EdgeInsets.all(10.0),
                border:OutlineInputBorder(borderRadius: BorderRadius.circular(10),),
                hintText: 'Enter Your Name',

              ),
            ),
          ),

          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusebleCard(
                    Colour:selectedGender == male
                        ? kInactiveCardColor
                        : kActiveCardColor ,
                    cardChild: IconContant(
                        icon: FontAwesomeIcons.mars, lable: 'MALE'),
                    onPress: () {
                      setState(() {
                        selectedGender = male;
                      });
                    },
                  ),
                ),
                Expanded(
                    child: ReusebleCard(
                      Colour: selectedGender == female
                          ?  kInactiveCardColor
                          : kActiveCardColor,
                      cardChild: IconContant(
                          icon: FontAwesomeIcons.venus, lable: 'FEMALE'),
                      onPress: () {
                        setState(() {
                          selectedGender = female;
                        });
                      },
                    )),
              ],
            ),
          ),

          Expanded(
              child: ReusebleCard(
                Colour: kActiveCardColor,
                cardChild: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Expanded(
                      child: Text(
                        'HEIGHT',
                        style: kLabelTextStyle,
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.baseline,
                      textBaseline: TextBaseline.alphabetic,
                      children: <Widget>[
                        Text( height.toString(), style: kNumberTextStyle),
                        Text(
                          'cm',
                          style: kLabelTextStyle,
                        ),
                      ],
                    ),
                    SliderTheme(
                      data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        thumbColor: Color(0xFFEB1555),
                        overlayColor: Color(0x29EB1555),
                        thumbShape:
                        RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayShape:
                        RoundSliderOverlayShape(overlayRadius: 30.0),
                      ),
                      child: Slider(
                        value:height.toDouble(),
                        min: 120.0,
                        max: 220.0,
                        inactiveColor: Color(0xFF8D8E98),
                        onChanged: (double newValue) {
                          setState(() {
                            height = newValue.round();
                          });
                        },
                      ),
                    ),
                  ],
                ),
                onPress: () {},
              )),

          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusebleCard(
                    Colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                onpressed: () {
                                  setState(() {
                                    weight--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onpressed: () {
                                setState(() {
                                  weight++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    onPress: () {},
                  ),
                ),
                Expanded(
                  child: ReusebleCard(
                    Colour: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style: kLabelTextStyle,
                        ),
                        Text(
                          age.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                                onpressed: () {
                                  setState(() {
                                    age--;
                                  });
                                },
                                icon: FontAwesomeIcons.minus),
                            SizedBox(
                              width: 10.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onpressed: () {
                                setState(() {
                                  age++;
                                });
                              },
                            ),
                          ],
                        ),
                      ],
                    ),
                    onPress: () {},
                  ),
                ),
              ],
            ),
          ),
          BottomButton(buttonTitle: 'CALCULATE', onTap: () async{

            if(nameController.text.isNotEmpty){

              if(selectedGender != null){
                var user = User();

                CalculatorBrain calc = CalculatorBrain(height: height, weight: weight);

                user.Name = nameController.text.toUpperCase();
                user.Gender = selectedGender.toString();
                user.Height = height.toString();
                user.Weight = weight.toString();
                user.Age = age.toString();
                user.Result = calc.calculateBMI();
                user.Value = calc.getInterpretation();
                user.Interpretation = calc.getResult();
                user.Timestamp = DateTime.now().toString();
                var result = await _userService.SaveUser(user);

                Navigator.push(context, MaterialPageRoute(builder: (context) =>
                    ResultPage(
                      bmiResult: calc.calculateBMI(),
                      resultText: calc.getResult(),
                      interpretation: calc.getInterpretation(),
                    )));
              }
              else{
                _showSuccessSnackBar('Select Gender');
              }

            }
            else{
              _showSuccessSnackBar('Enter Name');
            }


          },),

        ],

      ),
    );
  }

}








