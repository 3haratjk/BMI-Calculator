import 'package:bmi_calculator/calculator_brain.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import 'result_page.dart';

import '../components/reusable_card.dart';
import '../components/gender.dart';
import '../constants.dart';
import 'package:bmi_calculator/components/round_icon_button.dart';
import 'package:bmi_calculator/components/bottom_button.dart';

enum GenderType { male, female }

class InputPage extends StatefulWidget {
  @override
  _InputPageState createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  GenderType userGender;
  int userHeight = 180;
  int userWeight = 60;
  int userAge = 25;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        children: <Widget>[
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: userGender == GenderType.male
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: Gender(
                      genderIcon: FontAwesomeIcons.mars,
                      genderLabel: 'MALE',
                    ),
                    handleTap: () {
                      setState(() {
                        userGender = GenderType.male;
                      });
                    },
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: userGender == GenderType.female
                        ? kActiveCardColor
                        : kInactiveCardColor,
                    cardChild: Gender(
                      genderIcon: FontAwesomeIcons.venus,
                      genderLabel: 'FEMALE',
                    ),
                    handleTap: () {
                      setState(() {
                        userGender = GenderType.female;
                      });
                    },
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  Text(
                    'HEIGHT',
                    style: TextStyle(fontSize: 18.0, color: kLabelTextColor),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.baseline,
                    textBaseline: TextBaseline.alphabetic,
                    children: <Widget>[
                      Text(
                        userHeight.toString(),
                        style: kNumberTextStyle,
                      ),
                      Text(
                        'cm',
                        style: TextStyle(fontSize: 18.0),
                      )
                    ],
                  ),
                  SliderTheme(
                    data: SliderTheme.of(context).copyWith(
                        activeTrackColor: Colors.white,
                        inactiveTrackColor: kLabelTextColor,
                        thumbColor: kPinkColor,
                        thumbShape:
                            RoundSliderThumbShape(enabledThumbRadius: 15.0),
                        overlayColor: Color(0x29EB1555),
                        overlayShape:
                            RoundSliderOverlayShape(overlayRadius: 30.0)),
                    child: Slider(
                      value: userHeight.toDouble(),
                      min: 120,
                      max: 220,
                      onChanged: (double newValue) {
                        setState(() {
                          userHeight = newValue.floor();
                        });
                      },
                    ),
                  )
                ],
              ),
            ),
          ),
          Expanded(
            child: Row(
              children: <Widget>[
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'WEIGHT',
                          style:
                              TextStyle(fontSize: 18.0, color: kLabelTextColor),
                        ),
                        Text(
                          userWeight.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              handlePress: () {
                                setState(() {
                                  userWeight--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              handlePress: () {
                                setState(() {
                                  userWeight++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: ReusableCard(
                    color: kActiveCardColor,
                    cardChild: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          'AGE',
                          style:
                              TextStyle(fontSize: 18.0, color: kLabelTextColor),
                        ),
                        Text(
                          userAge.toString(),
                          style: kNumberTextStyle,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            RoundIconButton(
                              icon: FontAwesomeIcons.minus,
                              handlePress: () {
                                setState(() {
                                  userAge--;
                                });
                              },
                            ),
                            SizedBox(
                              width: 15.0,
                            ),
                            RoundIconButton(
                              icon: FontAwesomeIcons.plus,
                              handlePress: () {
                                setState(() {
                                  userAge++;
                                });
                              },
                            )
                          ],
                        )
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          BottomButton(
            title: 'CALCULATE',
            onTap: () {
              CalculatorBrain calc =
                  CalculatorBrain(height: userHeight, weight: userWeight);
              calc.calculateBMI();
              Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => ResultPage(
                      bmiResult: calc.getResult(),
                      bmi: calc.calculateBMI(),
                      interpretation: calc.getInterpretation(),
                    ),
                  ));
            },
          )
        ],
      ),
    );
  }
}
