import 'package:flutter/material.dart';
import 'package:pathmaker/main.dart';
import 'package:pathmaker/widgets/character_sheet/components/character_sheet_box.dart';
import 'package:pathmaker/widgets/character_sheet/components/skill_modifier.dart';
import 'package:pathmaker/model/skill_level.dart';
import 'package:pathmaker/enum.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class Skills extends ConsumerWidget {
  List<Widget> firstSkillsList = [];
  List<Widget> secondSkillsList = [];

  void getSkills(List<SkillLevel> skills) {
    int counter = 0;

    for (SkillLevel skill in skills) {
      if (counter < 9) {
        firstSkillsList.add(SkillModifier(
            training: skill.training.stringValue()[0],
            label: skill.name.stringValue(),
            modifier: skill.currentModifier < 0
                ? '-${skill.currentModifier.toString()}'
                : '+${skill.currentModifier.toString()}'));
        firstSkillsList.add(SizedBox(
          height: 2.0,
        ));
      } else {
        secondSkillsList.add(SkillModifier(
            training: skill.training.stringValue()[0],
            label: skill.name.stringValue(),
            modifier: skill.currentModifier < 0
                ? '-${skill.currentModifier.toString()}'
                : '+${skill.currentModifier.toString()}'));
        secondSkillsList.add(SizedBox(
          height: 2.0,
        ));
      }
      counter++;
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final List<SkillLevel> skills =
        ref.watch(dataCoordinatorProvider).currentCharacter.skills;
    getSkills(skills);

    return CharacterSheetBox(
      padding: false,
      height: 325,
      label: 'Skills',
      content: Padding(
        padding: const EdgeInsets.symmetric(vertical: 17.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: firstSkillsList,
            ),
            Flexible(
              child: ConstrainedBox(
                constraints: BoxConstraints(minWidth: 0.0, maxWidth: 20.0),
                child: Container(),
              ),
            ),
            Padding(
              padding: EdgeInsets.only(right: 4.0),
              child: Column(
                children: secondSkillsList,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
