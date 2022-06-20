import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ReusebleCard extends StatelessWidget {

  @override
   ReusebleCard({required this.Colour,required this.cardChild, required this.onPress});
  final Color Colour;
  final Widget cardChild;
  final VoidCallback onPress;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(onTap: onPress,
      child: Container(

        margin: EdgeInsets.all(15),

        decoration: BoxDecoration(

          color: Colour,

          borderRadius: BorderRadius.circular(10),

        ),

        child: cardChild,

      ),
    );
  }
}
