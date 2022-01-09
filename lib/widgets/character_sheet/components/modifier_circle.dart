import 'package:flutter/material.dart';
import 'package:pathmaker/constants.dart';

class ModifierCircle extends StatelessWidget {
  final String value;

  ModifierCircle({required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: kPrimaryColour,
        shape: BoxShape.circle,
      ),
      child: Text(
        value,
        style: TextStyle(
          color: Colors.white,
          fontSize: 18.0,
        ),
      ),
      width: 30.0,
      height: 30.0,
    );
  }
}
