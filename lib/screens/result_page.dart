import 'package:bmi_calculator/components/bottom_button.dart';
import 'package:bmi_calculator/constants.dart';
import 'file:///D:/AppDevelopment/bmi-calculator-flutter/lib/components/reusable_card.dart';
import 'package:flutter/material.dart';

class ResultPage extends StatelessWidget {
  final String bmiResult;
  final String bmi;
  final String interpretation;

  ResultPage(
      {@required this.bmiResult,
      @required this.bmi,
      @required this.interpretation});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BMI CALCULATOR'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.fromLTRB(15.0, 10.0, 0, 10.0),
            child: Text(
              'Your Result:',
              style: TextStyle(fontSize: 32.0, color: Colors.white),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          Expanded(
            child: ReusableCard(
              color: kActiveCardColor,
              cardChild: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Text(
                    bmiResult.toUpperCase(),
                    style: TextStyle(
                        color: bmiResult == 'normal'
                            ? Colors.lightGreenAccent
                            : kPinkColor,
                        fontSize: 22.0,
                        fontWeight: FontWeight.w600),
                  ),
                  Text(
                    bmi,
                    style:
                        TextStyle(fontSize: 100.0, fontWeight: FontWeight.w600),
                  ),
                  Column(
                    children: <Widget>[
                      Text(
                        'Normal BMI Range:',
                        style:
                            TextStyle(color: Colors.grey[600], fontSize: 18.0),
                      ),
                      Text(
                        '18.5 - 25 kg/m2',
                        style:
                            TextStyle(color: Colors.grey[400], fontSize: 22.0),
                      ),
                    ],
                  ),
                  Text(
                    interpretation,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 22.0),
                  )
                ],
              ),
            ),
          ),
          SizedBox(
            height: 10.0,
          ),
          BottomButton(
            title: 'RE-CALCULATE',
            onTap: () => Navigator.pop(context),
          )
        ],
      ),
    );
  }
}
