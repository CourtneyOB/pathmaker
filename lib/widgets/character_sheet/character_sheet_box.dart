import 'package:flutter/material.dart';
import 'package:pathmaker/constants.dart';

class CharacterSheetBox extends StatelessWidget {
  final double height;
  final Widget content;
  final String label;

  CharacterSheetBox(
      {required this.height, required this.content, required this.label});

  @override
  Widget build(BuildContext context) {
    double outerHeight = height + 20.0;

    return Container(
      height: outerHeight,
      child: Stack(
        alignment: Alignment.center,
        children: [
          Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              border: Border.all(color: kDividerColour),
              borderRadius: BorderRadius.circular(5.0),
            ),
            height: height,
            child: content,
          ),
          Positioned(
            child: Container(
              child: Text(label),
              color: Colors.white,
            ),
            top: 4,
          ),
        ],
      ),
    );
  }
}
