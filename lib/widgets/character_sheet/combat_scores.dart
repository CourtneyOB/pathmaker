import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pathmaker/constants.dart';
import 'package:pathmaker/main.dart';
import 'package:pathmaker/widgets/character_sheet/components/character_sheet_box.dart';
import 'package:pathmaker/widgets/character_sheet/components/stat_stack.dart';

class CombatScores extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String hp =
        ref.watch(dataCoordinatorProvider).currentCharacter.hp.toString();

    return CharacterSheetBox(
      padding: false,
      height: 100.0,
      content: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          StatStack(
            stat: 'AC',
            value: '12',
            topIcon: Icon(
              Icons.shield_sharp,
              color: kPrimaryColour,
              size: 32.0,
            ),
          ),
          StatStack(
            stat: 'Hitpoints',
            value: hp,
            topIcon: Icon(
              Icons.favorite,
              color: kPrimaryColour,
              size: 32.0,
            ),
          ),
        ],
      ),
      label: 'Combat',
    );
  }
}
