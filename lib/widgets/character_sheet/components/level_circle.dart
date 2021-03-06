import 'package:flutter/material.dart';
import 'package:pathmaker/constants.dart';
import 'package:pathmaker/main.dart';

class LevelCircle extends StatelessWidget {
  const LevelCircle({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double size =
        screenWidth(context) < kSizeLWidth ? 75.0 : screenWidth(context) * 0.06;

    return ConstrainedBox(
      constraints: BoxConstraints(maxWidth: 100.0, maxHeight: 100.0),
      child: Container(
        height: size,
        width: size,
        alignment: Alignment.center,
        decoration: BoxDecoration(
          border: Border.all(
            color: kDarkPrimaryColour,
          ),
          color: kDarkPrimaryColour,
          shape: BoxShape.circle,
          boxShadow: [
            BoxShadow(
              color: kDividerColour,
              spreadRadius: 3.0,
              blurRadius: 4,
              offset: Offset(0, 2),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.only(
            top: 5.0,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                'Level',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
              Text(
                '1',
                style: TextStyle(
                  fontSize: 24.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
