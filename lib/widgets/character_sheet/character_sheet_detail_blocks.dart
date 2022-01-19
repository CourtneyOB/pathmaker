import 'package:flutter/material.dart';
import 'package:pathmaker/widgets/character_sheet/components/skill_modifier.dart';
import 'package:pathmaker/main.dart';
import 'package:pathmaker/widgets/character_sheet/components/character_sheet_box.dart';
import 'package:pathmaker/widgets/character_sheet/components/weapon_row.dart';
import 'package:pathmaker/widgets/character_sheet/proficiencies.dart';
import 'package:pathmaker/widgets/character_sheet/skills.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterSheetDetailBlocks extends ConsumerWidget {
  const CharacterSheetDetailBlocks({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return LayoutBuilder(builder: (context, constraints) {
      if (constraints.maxWidth > 1200) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.only(right: screenWidth(context) * 0.005),
                    child: Skills(),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: screenWidth(context) * 0.005),
                    child: Proficiencies(),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: screenWidth(context) * 0.005),
                    child: CharacterSheetBox(
                      label: 'Characteristics',
                      padding: true,
                      height: 325,
                      content: Column(
                        children: ref
                            .watch(dataCoordinatorProvider)
                            .currentCharacter
                            .characteristics
                            .map((item) {
                          return Text(item);
                        }).toList(),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            ConstrainedBox(
              constraints:
                  BoxConstraints(maxWidth: screenWidth(context) * 0.315),
              child: Padding(
                padding: EdgeInsets.only(right: screenWidth(context) * 0.005),
                child: CharacterSheetBox(
                  padding: true,
                  height: 360,
                  label: 'Weapons',
                  content: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      WeaponRow(
                        name: 'Dagger',
                        modifier: '+2',
                        damage: '1d4',
                      ),
                      WeaponRow(
                          name: 'Crossbow', modifier: '-2', damage: '1d6'),
                      WeaponRow(name: 'Sling', modifier: '+1', damage: '1d4+1'),
                      WeaponRow(
                          name: 'Poison Dart', modifier: '+1', damage: '1d6+2'),
                    ],
                  ),
                ),
              ),
            ),
          ],
        );
      } else if (constraints.maxWidth > 620) {
        return Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding:
                        EdgeInsets.only(right: screenWidth(context) * 0.005),
                    child: Skills(),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: screenWidth(context) * 0.005),
                    child: Proficiencies(),
                  ),
                ),
              ],
            ),
            Row(
              children: [
                Expanded(
                  flex: 6,
                  child: Padding(
                    padding:
                        EdgeInsets.only(right: screenWidth(context) * 0.005),
                    child: CharacterSheetBox(
                      label: 'Characteristics',
                      padding: true,
                      height: 360,
                      content: Column(
                        children: ref
                            .watch(dataCoordinatorProvider)
                            .currentCharacter
                            .characteristics
                            .map((item) {
                          return Text(item);
                        }).toList(),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Padding(
                    padding:
                        EdgeInsets.only(left: screenWidth(context) * 0.005),
                    child: CharacterSheetBox(
                      padding: true,
                      height: 360,
                      label: 'Weapons',
                      content: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          WeaponRow(
                            name: 'Dagger',
                            modifier: '+2',
                            damage: '1d4',
                          ),
                          WeaponRow(
                              name: 'Crossbow', modifier: '-2', damage: '1d6'),
                          WeaponRow(
                              name: 'Sling', modifier: '+1', damage: '1d4+1'),
                          WeaponRow(
                              name: 'Poison Dart',
                              modifier: '+1',
                              damage: '1d6+2'),
                        ],
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ],
        );
      } else {
        return Column(
          children: [
            Skills(),
            Proficiencies(),
            CharacterSheetBox(
              label: 'Characteristics',
              padding: true,
              height: 360,
              content: Column(
                children: ref
                    .watch(dataCoordinatorProvider)
                    .currentCharacter
                    .characteristics
                    .map((item) {
                  return Text(item);
                }).toList(),
              ),
            ),
            CharacterSheetBox(
              padding: true,
              height: 360,
              label: 'Weapons',
              content: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  WeaponRow(
                    name: 'Dagger',
                    modifier: '+2',
                    damage: '1d4',
                  ),
                  WeaponRow(name: 'Crossbow', modifier: '-2', damage: '1d6'),
                  WeaponRow(name: 'Sling', modifier: '+1', damage: '1d4+1'),
                  WeaponRow(
                      name: 'Poison Dart', modifier: '+1', damage: '1d6+2'),
                ],
              ),
            ),
          ],
        );
      }
    });
  }
}
