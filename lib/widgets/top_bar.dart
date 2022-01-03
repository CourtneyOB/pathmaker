import 'package:flutter/material.dart';
import 'package:pathmaker/main.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:pathmaker/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class TopBar extends ConsumerWidget {
  const TopBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
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
                percent: ref.watch(dataCoordinatorProvider).percentageComplete,
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
