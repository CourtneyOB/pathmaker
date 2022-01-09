import 'package:flutter/material.dart';
import 'package:pathmaker/main.dart';
import 'package:pathmaker/widgets/character_sheet/saving_throws.dart';
import 'package:pathmaker/widgets/character_sheet/ability_scores.dart';
import 'package:pathmaker/widgets/character_sheet/combat_scores.dart';

class CharacterSheetStatStacks extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 860) {
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              flex: 11,
              child: AbilityScores(),
            ),
            Expanded(
              flex: 4,
              child: Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: screenWidth(context) * 0.005),
                child: CombatScores(),
              ),
            ),
            Expanded(
              flex: 5,
              child: SavingThrows(),
            ),
          ],
        );
      } else {
        return Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: AbilityScores(),
                )
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 2,
                  child: CombatScores(),
                ),
                SizedBox(
                  width: 15.0,
                ),
                Expanded(
                  flex: 3,
                  child: SavingThrows(),
                ),
              ],
            ),
          ],
        );
      }
    });
  }
}
