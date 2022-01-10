import 'package:flutter/material.dart';
import 'package:pathmaker/main.dart';
import 'package:pathmaker/widgets/character_sheet/components/skill_modifier.dart';
import 'package:pathmaker/widgets/character_sheet/character_sheet_demographics.dart';
import 'package:pathmaker/widgets/character_sheet/character_sheet_stat_stacks.dart';
import 'package:pathmaker/widgets/character_sheet/components/character_sheet_box.dart';
import 'package:pathmaker/widgets/character_sheet/components/weapon_row.dart';
import 'package:pathmaker/widgets/character_sheet/proficiencies.dart';

class CharacterSheet extends StatelessWidget {
  const CharacterSheet({
    Key? key,
  }) : super(key: key);

  List<Widget> getSkills1() {
    List<Widget> skills = [];
    List<String> skillNames = [
      'Acrobatics',
      'Arcana',
      'Athletics',
      'Crafting',
      'Deception',
      'Diplomacy',
      'Intimidation',
      'Lore',
      'Medicine',
      'Nature',
    ];

    for (String s in skillNames) {
      skills.add(SkillModifier(training: 'T', label: s, modifier: '+1'));
      skills.add(SizedBox(
        height: 2.0,
      ));
    }

    return skills;
  }

  List<Widget> getSkills2() {
    List<Widget> skills = [];
    List<String> skillNames = [
      'Medicine',
      'Nature',
      'Occultism',
      'Performance',
      'Religion',
      'Society',
      'Stealth',
      'Survival',
      'Thievery'
    ];

    for (String s in skillNames) {
      skills.add(SkillModifier(training: 'T', label: s, modifier: '+1'));
      skills.add(SizedBox(
        height: 2.0,
      ));
    }

    return skills;
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.001),
        child: Card(
          elevation: 8,
          child: Padding(
            padding: EdgeInsets.all(screenWidth(context) * 0.015),
            child: Column(
              children: [
                CharacterSheetDemographics(),
                CharacterSheetStatStacks(),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 6,
                      child: Padding(
                        padding: EdgeInsets.only(
                            right: screenWidth(context) * 0.005),
                        child: Column(
                          children: [
                            CharacterSheetBox(
                              padding: false,
                              height: 360,
                              label: 'Skills',
                              content: Padding(
                                padding:
                                    const EdgeInsets.symmetric(vertical: 17.0),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Column(
                                      children: getSkills1(),
                                    ),
                                    Flexible(
                                      child: ConstrainedBox(
                                        constraints: BoxConstraints(
                                            minWidth: 0.0, maxWidth: 20.0),
                                        child: Container(),
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(right: 4.0),
                                      child: Column(
                                        children: getSkills2(),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 5,
                      child: Padding(
                        padding:
                            EdgeInsets.only(left: screenWidth(context) * 0.005),
                        child: Column(
                          children: [
                            Proficiencies(),
                          ],
                        ),
                      ), //PROF/WEAPONS
                    ),
                  ],
                ),
                Row(
                  children: [
                    Expanded(
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
                                name: 'Crossbow',
                                modifier: '-2',
                                damage: '1d6'),
                            WeaponRow(
                                name: 'Sling', modifier: '+1', damage: '1d4+1'),
                            WeaponRow(
                                name: 'Poison Dart',
                                modifier: '+1',
                                damage: '1d6+2'),
                          ],
                        ),
                      ),
                    )
                  ],
                ) // THIRD ROW
              ],
            ),
          ),
        ),
      ),
    );
  }
}
