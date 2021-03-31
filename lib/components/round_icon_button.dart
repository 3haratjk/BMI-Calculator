import 'package:flutter/material.dart';

class RoundIconButton extends StatelessWidget {
  final IconData icon;
  final Function handlePress;
  RoundIconButton({this.icon, this.handlePress});
  @override
  Widget build(BuildContext context) {
    return RawMaterialButton(
      onPressed: handlePress,
      child: Icon(icon),
      constraints: BoxConstraints.tightFor(
        width: 50.0,
        height: 50.0,
      ),
      shape: CircleBorder(),
      fillColor: Color(0xFF333340),
      elevation: 6.0,
    );
  }
}
