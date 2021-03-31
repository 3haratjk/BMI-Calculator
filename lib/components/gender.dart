import 'package:bmi_calculator/constants.dart';
import 'package:flutter/material.dart';

class Gender extends StatelessWidget {
  final IconData genderIcon;
  final String genderLabel;

  Gender({this.genderIcon, this.genderLabel});

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Icon(
          genderIcon,
          size: 80.0,
        ),
        SizedBox(
          height: 15.0,
        ),
        Text(
          genderLabel,
          style: TextStyle(fontSize: 18.0, color: kLabelTextColor),
        ),
      ],
    );
  }
}
