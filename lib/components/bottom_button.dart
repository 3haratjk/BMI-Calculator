import 'package:flutter/material.dart';
import 'package:bmi_calculator/constants.dart';

class BottomButton extends StatelessWidget {
  final String title;
  final Function onTap;

  BottomButton({this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        child: Center(
            child: Text(
          title,
          style: TextStyle(fontSize: 24.0, fontWeight: FontWeight.w600),
        )),
        color: kPinkColor,
        height: 80.0,
        width: double.infinity,
      ),
    );
  }
}
