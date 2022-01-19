import 'package:flutter/material.dart';
import 'package:pathmaker/main.dart';
import 'package:pathmaker/widgets/character_sheet/components/skill_modifier.dart';
import 'package:pathmaker/widgets/character_sheet/character_sheet_demographics_mini.dart';
import 'package:pathmaker/widgets/character_sheet/ability_scores.dart';
import 'package:pathmaker/widgets/character_sheet/skills.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterSheetMini extends ConsumerWidget {
  const CharacterSheetMini({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.001),
      child: Card(
        elevation: 8,
        child: Padding(
          padding: EdgeInsets.all(screenWidth(context) * 0.015),
          child: Column(
            children: [
              CharacterSheetDemographicsMini(),
              AbilityScores(
                singleRow: false,
              ),
              Skills(),
            ],
          ),
        ),
      ),
    );
  }
}
