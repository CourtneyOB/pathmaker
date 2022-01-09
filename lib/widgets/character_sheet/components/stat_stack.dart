import 'package:flutter/material.dart';
import 'package:pathmaker/widgets/character_sheet/components/modifier_block.dart';

class StatStack extends StatelessWidget {
  StatStack({required this.stat, required this.value, required this.topIcon});

  final String stat;
  final String value;
  final Widget topIcon;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(4.0),
      child: Container(
        height: 75.0,
        child: Stack(
          alignment: Alignment.bottomCenter,
          children: [
            ModifierBlock(
              stat: stat,
              modifier: value,
            ),
            Positioned(
              child: topIcon,
              top: 0,
            ),
          ],
        ),
      ),
    );
  }
}
