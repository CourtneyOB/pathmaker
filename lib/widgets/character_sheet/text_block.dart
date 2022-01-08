import 'package:flutter/material.dart';
import 'package:pathmaker/constants.dart';
import 'package:pathmaker/widgets/divider_line.dart';

class TextBlock extends StatelessWidget {
  final String label;
  final String value;

  TextBlock({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45.0,
      width: 200.0,
      decoration: BoxDecoration(
        border: Border.all(
          color: kDividerColour,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
        boxShadow: [
          BoxShadow(
            color: kDividerColour,
            spreadRadius: 1.0,
            blurRadius: 4,
            offset: Offset(0, 2),
          ),
        ],
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(
          vertical: 3.0,
          horizontal: 8.0,
        ),
        child: Column(
          children: [
            Container(
              alignment: Alignment.centerLeft,
              child: Text(
                value,
                style: TextStyle(
                  fontSize: 18.0,
                ),
              ),
            ),
            DividerLine(), //DIVIDER LINE
            Container(
              padding: EdgeInsets.only(top: 1.0),
              alignment: Alignment.centerRight,
              child: Text(
                label,
                style: TextStyle(
                  fontSize: 10.0,
                  color: kSecondaryTextColour,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
