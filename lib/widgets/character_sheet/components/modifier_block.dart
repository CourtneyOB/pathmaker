import 'package:flutter/material.dart';
import 'package:pathmaker/constants.dart';

class ModifierBlock extends StatelessWidget {
  const ModifierBlock({
    Key? key,
    required this.stat,
    required this.modifier,
  }) : super(key: key);

  final String stat;
  final String modifier;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 65.0,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 5.0, vertical: 2.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Text(
              modifier,
              style: TextStyle(
                fontSize: 23.0,
              ),
            ),
            Container(
              width: 50.0,
              decoration: BoxDecoration(
                border: Border(
                  bottom: BorderSide(
                    color: kDividerColour,
                    width: 0.8,
                  ),
                ),
              ),
            ),
            Text(
              stat,
              style: TextStyle(
                fontSize: 13.0,
              ),
            ),
          ],
        ),
      ),
      decoration: BoxDecoration(
        border: Border.all(
          color: kDividerColour,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
    );
  }
}
