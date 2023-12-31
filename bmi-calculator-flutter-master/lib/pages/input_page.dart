import 'package:flutter/material.dart';
import 'package:bmi_calculator/components/reusable_card.dart';
import 'package:bmi_calculator/components/icon_content.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:bmi_calculator/constants.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/pages/result_page.dart';
import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/bmi_calculator.dart';

// in future may be a good idea to have a "design" file in which all the properties can be get and filled to the objects themselves. A pseudo extract, like extracting strings in android

enum GenderForCard { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderForCard? selectedGender;
  int height = 180;
  int weight = 60;
  int age = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        // In order to avoid shrinking to the size of the content
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    onTapCallBack: () => setState(() {
                      selectedGender = GenderForCard.male;
                    }),
                    colour: selectedGender == GenderForCard.male
                        ? reusableCardBackgroundColor
                        : reusableCardBackgroundColorInactive,
                    reusableChild:
                        ReusableCardChildContent(FontAwesomeIcons.mars, "MALE"),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                      onTapCallBack: () => setState(() {
                            selectedGender = GenderForCard.female;
                          }),
                      colour: selectedGender == GenderForCard.female
                          ? reusableCardBackgroundColor
                          : reusableCardBackgroundColorInactive,
                      reusableChild: ReusableCardChildContent(
                          FontAwesomeIcons.venus, "FEMALE")),
                )
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              colour: reusableCardBackgroundColor,
              reusableChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "HEIGHT",
                    style: labelStyle,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    // This is to maintain both texts aligned into their bottom. However, it is necessary to also define textBaseLine if the basesile will be used like below.
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: [
                      Text(
                        height.toString(),
                        style: labelStyleForNumbers,
                      ),
                      Text(
                        'cm',
                        style: labelStyle,
                      ),
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                      activeTrackColor: Colors.white,
                      inactiveTrackColor: inactiveSLiderColor,
                      thumbColor: Color(0xFFEB1555),
                      overlayColor: Color(0x29EB1555),
                      thumbShape:
                          RoundSliderThumbShape(enabledThumbRadius: 15.0),
                      overlayShape: RoundSliderOverlayShape(
                        overlayRadius: 26.0,
                      ),
                    ),
                    child: Slider(
                      //height of the user will be the value argument
                      value: height.toDouble(),
                      min: minHeight,
                      max: maxHeight,
                      // both attributes were sent to the SliderTheme
                      // activeColor: activeSliderColor,
                      // inactiveColor: inactiveSLiderColor,
                      onChanged: (double value) {
                        setState(() {
                          height = value.round();
                        });
                      },
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: ReusableCard(
                    colour: reusableCardBackgroundColor,
                    reusableChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "WEIGHT",
                          style: labelStyle,
                        ),
                        Text(
                          weight.toString(),
                          style: labelStyleForNumbers,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //the problem here is that floating action button should be use very specifically and only one per screen.
                            //We will need to make a buttom ourselves.
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onTap: () {
                                setState(
                                  () {
                                    weight--;
                                    weight =
                                        weight < minWeight ? minWeight : weight;
                                  },
                                );
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onTap: () {
                                setState(() {
                                  weight++;
                                  weight =
                                      weight > maxWeight ? maxWeight : weight;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    colour: reusableCardBackgroundColor,
                    reusableChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "AGE",
                          style: labelStyle,
                        ),
                        Text(
                          age.toString(),
                          style: labelStyleForNumbers,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //the problem here is that floating action button should be use very specifically and only one per screen.
                            //We will need to make a buttom ourselves.
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              onTap: () {
                                setState(
                                  () {
                                    age--;
                                    age = age < minAge ? minAge : age;
                                  },
                                );
                              },
                            ),
                            SizedBox(width: 10.0),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              onTap: () {
                                setState(() {
                                  age++;
                                  age = age > maxAge ? maxAge : age;
                                });
                              },
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )
              ],
            ),
          ),
          BottomButton(
            onTap: () {
              BMICalculator mbiCalc =
                  BMICalculator(height: height, weight: weight);

              Navigator.push(context, MaterialPageRoute(builder: (context) {
                return ResultPage(mbiCalc);
              }));
            },
            buttonTitle: 'CALCULATE',
          ),
        ],
      ),
    );
  }
}
