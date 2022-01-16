import 'package:flutter/material.dart';
import 'package:pathmaker/constants.dart';
import 'package:pathmaker/main.dart';

class FeatTabDetail extends StatelessWidget {
  FeatTabDetail({required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: screenWidth(context) * 0.4,
      decoration: BoxDecoration(
        border: Border.all(color: kDividerColour),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [Text(text)],
        ),
      ),
    );
  }
}
