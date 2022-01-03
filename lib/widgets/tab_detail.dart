import 'package:flutter/material.dart';
import 'package:pathmaker/constants.dart';

class TabDetail extends StatelessWidget {
  final String text;
  final String boosts;
  final String flaws;

  TabDetail({required this.text, required this.boosts, required this.flaws});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: kDividerColour),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text('$text \n'),
            Text(
              'Ability Boosts:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text('$boosts \n'),
            Text(
              'Ability Flaws:',
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(flaws),
          ],
        ),
      ),
    );
  }
}
