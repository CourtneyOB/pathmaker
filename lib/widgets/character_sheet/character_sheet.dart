import 'package:flutter/material.dart';
import 'package:pathmaker/constants.dart';
import 'package:pathmaker/main.dart';
import 'package:pathmaker/widgets/character_sheet/skill_box_with_training.dart';
import 'package:pathmaker/widgets/character_sheet/stat_stack.dart';
import 'package:pathmaker/widgets/character_sheet/modifier_circle.dart';
import 'text_block.dart';
import 'package:pathmaker/widgets/character_sheet/skill_modifier.dart';
import 'character_sheet_box.dart';
import 'package:pathmaker/widgets/character_sheet/level_circle.dart';
import 'weapon_row.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterSheet extends ConsumerWidget {
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
  Widget build(BuildContext context, WidgetRef ref) {
    final String name =
        ref.watch(dataCoordinatorProvider).currentCharacter.name;
    final String str = ref.watch(dataCoordinatorProvider).currentCharacter.str;
    final String con = ref.watch(dataCoordinatorProvider).currentCharacter.con;
    final String dex = ref.watch(dataCoordinatorProvider).currentCharacter.dex;
    final String intl =
        ref.watch(dataCoordinatorProvider).currentCharacter.intl;
    final String cha = ref.watch(dataCoordinatorProvider).currentCharacter.cha;
    final String wis = ref.watch(dataCoordinatorProvider).currentCharacter.wis;

    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Card(
          elevation: 8,
          child: Padding(
            padding: const EdgeInsets.all(30.0),
            child: Column(
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      flex: 1,
                      child: ConstrainedBox(
                        constraints: BoxConstraints(maxHeight: 200.0),
                        child: Container(
                          decoration: BoxDecoration(
                              border: Border.all(
                            color: kDividerColour,
                          )),
                          child: Image.asset(
                            'lib/images/placeholder_image.png',
                          ),
                        ),
                      ),
                    ), //IMAGE
                    Expanded(
                      flex: 3,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 20.0,
                          ), //SPACE FROM PICTURE
                          Container(
                            height: 180.0,
                            child: Wrap(
                              direction: Axis.vertical,
                              spacing: 8.0,
                              runSpacing: 4.0,
                              children: [
                                TextBlock(
                                  label: 'Name',
                                  value: name,
                                ),
                                TextBlock(
                                  label: 'Ancestry',
                                  value: 'Android',
                                ),
                                TextBlock(
                                  label: 'Background',
                                  value: 'Mechanic',
                                ),
                                TextBlock(
                                  label: 'Class',
                                  value: 'Alchemist',
                                ),
                                TextBlock(
                                  label: 'Alignment',
                                  value: 'Neutral',
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Column(
                      children: [
                        LevelCircle(),
                        SizedBox(
                          height: 20.0,
                        ),
                        Container(
                          width: 100.0,
                          child: Column(
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
                                  Text('25 ft'),
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
                                  Text('Medium'),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ), //TOP ROW
                Row(
                  children: [
                    Expanded(
                      child: CharacterSheetBox(
                        height: 100.0,
                        content: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            StatStack(
                              stat: 'STR',
                              value: '+1',
                              topIcon: ModifierCircle(
                                value: str,
                              ),
                            ),
                            StatStack(
                              stat: 'DEX',
                              value: '+1',
                              topIcon: ModifierCircle(
                                value: dex,
                              ),
                            ),
                            StatStack(
                              stat: 'CON',
                              value: '+1',
                              topIcon: ModifierCircle(
                                value: con,
                              ),
                            ),
                            StatStack(
                              stat: 'INT',
                              value: '+1',
                              topIcon: ModifierCircle(
                                value: intl,
                              ),
                            ),
                            StatStack(
                              stat: 'WIS',
                              value: '+1',
                              topIcon: ModifierCircle(
                                value: wis,
                              ),
                            ),
                            StatStack(
                              stat: 'CHA',
                              value: '+1',
                              topIcon: ModifierCircle(
                                value: cha,
                              ),
                            ),
                          ],
                        ),
                        label: 'Ability Scores',
                      ),
                    )
                  ],
                ), // SECOND ROW
                Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Expanded(
                                flex: 2,
                                child: CharacterSheetBox(
                                  height: 100.0,
                                  content: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
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
                                        value: '20',
                                        topIcon: Icon(
                                          Icons.favorite,
                                          color: kPrimaryColour,
                                          size: 32.0,
                                        ),
                                      ),
                                    ],
                                  ),
                                  label: 'Combat',
                                ),
                              ),
                              SizedBox(
                                width: 15.0,
                              ),
                              Expanded(
                                flex: 3,
                                child: CharacterSheetBox(
                                  height: 100,
                                  content: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
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
                                ),
                              ),
                            ],
                          ),
                          CharacterSheetBox(
                            height: 350,
                            content: Padding(
                              padding: const EdgeInsets.only(top: 15.0),
                              child: Row(
                                children: [
                                  Expanded(
                                    child: Column(
                                      children: getSkills1(),
                                    ),
                                  ),
                                  Expanded(
                                    child: Column(
                                      children: getSkills2(),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            label: 'Skills',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      width: 25.0,
                    ),
                    Expanded(
                      child: Column(
                        children: [
                          CharacterSheetBox(
                            height: 100,
                            content: Row(
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      SkillBoxWithTraining(
                                        width: 160.0,
                                        training: 'T',
                                        label: 'Simple Weapons',
                                      ),
                                      SkillBoxWithTraining(
                                        width: 160.0,
                                        training: 'U',
                                        label: 'Martial Weapons',
                                      ),
                                    ],
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceEvenly,
                                  ),
                                ),
                                Expanded(
                                  child: Column(),
                                ),
                              ],
                            ),
                            label: 'Proficiencies',
                          ),
                          CharacterSheetBox(
                            height: 350,
                            content: Padding(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 40.0),
                              child: Column(
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
                                      name: 'Sling',
                                      modifier: '+1',
                                      damage: '1d4+1'),
                                  WeaponRow(
                                      name: 'Poison Dart',
                                      modifier: '+1',
                                      damage: '1d6+2'),
                                ],
                              ),
                            ),
                            label: 'Weapons',
                          ),
                        ],
                      ),
                    ),
                  ],
                ), // THIRD ROW
              ],
            ),
          ),
        ),
      ),
    );
  }
}
