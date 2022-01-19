import 'package:flutter/material.dart';
import 'package:pathmaker/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pathmaker/main.dart';
import 'package:pathmaker/enum.dart';
import 'package:pathmaker/widgets/character_sheet/components/text_block.dart';
import 'package:pathmaker/widgets/character_sheet/components/level_circle.dart';

class CharacterSheetDemographicsMini extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String name =
        ref.watch(dataCoordinatorProvider).currentCharacter.name;
    final String ancestry =
        ref.watch(dataCoordinatorProvider).selectedAncestry == null
            ? ''
            : ref.watch(dataCoordinatorProvider).selectedAncestry!.name;
    final String size =
        ref.watch(dataCoordinatorProvider).currentCharacter.size.stringValue();
    final String speed =
        ref.watch(dataCoordinatorProvider).currentCharacter.speed.toString();

    return Row(
      children: [
        Expanded(
          child: ConstrainedBox(
            constraints:
                BoxConstraints(maxHeight: kCharacterSheetDemographicsMaxHeight),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextBlock(
                      label: 'Name',
                      value: name,
                    ),
                    TextBlock(
                      label: 'Class',
                      value: 'Alchemist',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextBlock(
                      label: 'Ancestry',
                      value: ancestry,
                    ),
                    TextBlock(
                      label: 'Alignment',
                      value: 'Neutral',
                    ),
                  ],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    TextBlock(
                      label: 'Background',
                      value: 'Mechanic',
                    ),
                    TextBlock(
                      label: 'Another Box',
                      value: '',
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
        Column(
          children: [
            LevelCircle(),
            SizedBox(
              height: 10.0,
            ),
            Container(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.directions_run,
                        color: kPrimaryColour,
                        size: 32.0,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text('$speed ft'),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(
                        Icons.straighten,
                        color: kPrimaryColour,
                        size: 32.0,
                      ),
                      SizedBox(
                        width: 5.0,
                      ),
                      Text('$size'),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
