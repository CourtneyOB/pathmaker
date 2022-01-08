import 'package:flutter/material.dart';
import 'package:pathmaker/constants.dart';

class DividerLine extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.only(left: 7.0, right: 5.0),
        child: Container(
          height: 3.0,
          decoration: BoxDecoration(
            border: Border(
              bottom: BorderSide(
                color: kDividerColour,
                width: 0.8,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
