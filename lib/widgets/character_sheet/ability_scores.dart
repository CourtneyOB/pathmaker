import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pathmaker/main.dart';
import 'package:pathmaker/widgets/character_sheet/components/modifier_circle.dart';
import 'package:pathmaker/widgets/character_sheet/components/character_sheet_box.dart';
import 'package:pathmaker/widgets/character_sheet/components/stat_stack.dart';
import 'package:pathmaker/enum.dart';

class AbilityScores extends ConsumerWidget {
  AbilityScores({this.singleRow = true});

  final bool singleRow;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String str = ref
        .watch(dataCoordinatorProvider)
        .currentCharacter
        .abilityScores[Ability.str]
        .toString();
    final String strModifier = convertToStringModifier(ref
        .watch(dataCoordinatorProvider)
        .currentCharacter
        .abilityScores[Ability.str]!);
    final String con = ref
        .watch(dataCoordinatorProvider)
        .currentCharacter
        .abilityScores[Ability.con]
        .toString();
    final String conModifier = convertToStringModifier(ref
        .watch(dataCoordinatorProvider)
        .currentCharacter
        .abilityScores[Ability.con]!);
    final String dex = ref
        .watch(dataCoordinatorProvider)
        .currentCharacter
        .abilityScores[Ability.dex]
        .toString();
    final String dexModifier = convertToStringModifier(ref
        .watch(dataCoordinatorProvider)
        .currentCharacter
        .abilityScores[Ability.dex]!);
    final String intl = ref
        .watch(dataCoordinatorProvider)
        .currentCharacter
        .abilityScores[Ability.intl]
        .toString();
    final String intlModifier = convertToStringModifier(ref
        .watch(dataCoordinatorProvider)
        .currentCharacter
        .abilityScores[Ability.intl]!);
    final String cha = ref
        .watch(dataCoordinatorProvider)
        .currentCharacter
        .abilityScores[Ability.cha]
        .toString();
    final String chaModifier = convertToStringModifier(ref
        .watch(dataCoordinatorProvider)
        .currentCharacter
        .abilityScores[Ability.cha]!);
    final String wis = ref
        .watch(dataCoordinatorProvider)
        .currentCharacter
        .abilityScores[Ability.wis]
        .toString();
    final String wisModifier = convertToStringModifier(ref
        .watch(dataCoordinatorProvider)
        .currentCharacter
        .abilityScores[Ability.wis]!);

    return LayoutBuilder(builder: (context, constraints) {
      if (!singleRow) {
        return CharacterSheetBox(
          padding: false,
          height: 185.0,
          label: 'Ability Scores',
          content: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  StatStack(
                    stat: 'STR',
                    value: strModifier,
                    topIcon: ModifierCircle(
                      value: str,
                    ),
                  ),
                  StatStack(
                    stat: 'DEX',
                    value: dexModifier,
                    topIcon: ModifierCircle(
                      value: dex,
                    ),
                  ),
                  StatStack(
                    stat: 'CON',
                    value: conModifier,
                    topIcon: ModifierCircle(
                      value: con,
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  StatStack(
                    stat: 'INT',
                    value: intlModifier,
                    topIcon: ModifierCircle(
                      value: intl,
                    ),
                  ),
                  StatStack(
                    stat: 'WIS',
                    value: wisModifier,
                    topIcon: ModifierCircle(
                      value: wis,
                    ),
                  ),
                  StatStack(
                    stat: 'CHA',
                    value: chaModifier,
                    topIcon: ModifierCircle(
                      value: cha,
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      } else {
        return CharacterSheetBox(
          padding: false,
          height: 100.0,
          label: 'Ability Scores',
          content: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              StatStack(
                stat: 'STR',
                value: strModifier,
                topIcon: ModifierCircle(
                  value: str,
                ),
              ),
              StatStack(
                stat: 'DEX',
                value: dexModifier,
                topIcon: ModifierCircle(
                  value: dex,
                ),
              ),
              StatStack(
                stat: 'CON',
                value: conModifier,
                topIcon: ModifierCircle(
                  value: con,
                ),
              ),
              StatStack(
                stat: 'INT',
                value: intlModifier,
                topIcon: ModifierCircle(
                  value: intl,
                ),
              ),
              StatStack(
                stat: 'WIS',
                value: wisModifier,
                topIcon: ModifierCircle(
                  value: wis,
                ),
              ),
              StatStack(
                stat: 'CHA',
                value: chaModifier,
                topIcon: ModifierCircle(
                  value: cha,
                ),
              ),
            ],
          ),
        );
      }
    });
  }
}
