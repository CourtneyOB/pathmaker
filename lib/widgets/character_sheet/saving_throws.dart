import 'package:flutter/material.dart';
import 'package:pathmaker/widgets/character_sheet/components/character_sheet_box.dart';
import 'package:pathmaker/widgets/character_sheet/components/stat_stack.dart';
import 'package:pathmaker/constants.dart';

class SavingThrows extends StatelessWidget {
  const SavingThrows({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CharacterSheetBox(
      padding: false,
      height: 100,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          StatStack(
            stat: 'Fortitude',
            value: '+2',
            topIcon: Icon(
              Icons.fitness_center,
              color: kPrimaryColour,
              size: 32.0,
            ),
          ),
          StatStack(
            stat: 'Reflex',
            value: '+3',
            topIcon: Icon(
              Icons.flash_on,
              color: kPrimaryColour,
              size: 32.0,
            ),
          ),
          StatStack(
            stat: 'Will',
            value: '+0',
            topIcon: Icon(
              Icons.psychology,
              color: kPrimaryColour,
              size: 32.0,
            ),
          ),
        ],
      ),
      label: 'Saving throws',
    );
  }
}
