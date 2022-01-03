import 'package:flutter/material.dart';
import 'package:pathmaker/constants.dart';

class SkillBoxWithTraining extends StatelessWidget {
  SkillBoxWithTraining(
      {Key? key,
      required this.training,
      required this.label,
      this.width = 140.0})
      : super(key: key);

  final String training;
  final String label;
  double width;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      decoration: BoxDecoration(
        border: Border.all(
          color: kDividerColour,
        ),
        color: Colors.white,
        borderRadius: BorderRadius.circular(5.0),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 8.0),
        child: Row(
          children: [
            Text(
              training,
              style: TextStyle(
                fontWeight: FontWeight.w900,
              ),
            ),
            Container(
              height: 18.0,
              width: 7.0,
              decoration: BoxDecoration(
                border: Border(
                  right: BorderSide(
                    color: kDividerColour,
                    width: 0.8,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: 10.0,
            ),
            Text(
              label,
              style: TextStyle(fontSize: 14.0),
            ),
          ],
        ),
      ),
    );
  }
}
