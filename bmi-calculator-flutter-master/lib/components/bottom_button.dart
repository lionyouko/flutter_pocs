import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

//C135 - we refactored out this button to another fle as it is used in two pages
class BottomButton extends StatelessWidget {
  final void Function() onTap;
  final String buttonTitle;

  BottomButton({required this.onTap, required this.buttonTitle});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      // We here are using the Navigator to transition between screens, but since it is just one, we not using namedRoutes
      //Named routes are defined in the beginning of the app, in MaterialApp Widget.

      onTap: onTap,
      child: Container(
        child: Center(
          child: Text(
            buttonTitle,
            //C135 styling for the calculate button
            style: largeButtonStyle,
          ),
        ),
        color: bottonContainerBackgroundColor,
        margin: EdgeInsets.only(top: 10),
        width: double.infinity,
        height: bottonContainerHeight,
        //C135 a bit of padding in the bottom
        padding: EdgeInsets.only(
          bottom: 20.0,
        ),
      ),
    );
  }
}
