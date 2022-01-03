import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pathmaker/constants.dart';

class TopBar extends StatelessWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
          horizontal: kWebHorizontalPadding, vertical: 40.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: ConstrainedBox(
              constraints: BoxConstraints(minWidth: 10.0, maxWidth: 800.0),
              child: LinearPercentIndicator(
                lineHeight: 14.0,
                percent: 0.3,
                backgroundColor: kLightPrimaryColour,
                progressColor: kDarkPrimaryColour,
              ),
            ),
          ),
          SizedBox(
            width: 30.0,
          ),
          Text('KikiRPG: Pathfinder 2e Character Builder'),
        ],
      ),
    );
  }
}
