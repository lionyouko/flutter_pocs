import 'package:bmi_calculator/bmi_calculator.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class ResultPage extends StatelessWidget {
  //C136 - passing functionality to the app without any state management
  final BMICalculator calc;

  ResultPage(this.calc);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        //C135 - design this page
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Container(
              padding: EdgeInsets.all(15.0),
              alignment: Alignment.bottomLeft,
              child: Text(
                'Your Result',
                style: titleTextStyle,
              ),
            ),
          ),
          Expanded(
            flex: 5,
            child: ReusableCard(
              colour: reusableCardBackgroundColor,
              reusableChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    calc.getResults(),
                    style: resultTextStyle,
                  ),
                  Text(
                    calc.calculateBMI(),
                    style: bmiResultTyle,
                  ),
                  Text(
                    calc.getInterpretations(),
                    style: bmiResultExplanationStyle,
                    textAlign: TextAlign.center,
                  )
                ],
              ),
            ),
          ),
          BottomButton(
              onTap: () {
                Navigator.pop(context);
              },
              buttonTitle: 'RE-CALCULATE')
        ],
      ),
    );
  }
}
