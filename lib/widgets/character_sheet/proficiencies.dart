import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pathmaker/main.dart';
import 'package:pathmaker/widgets/character_sheet/components/character_sheet_box.dart';
import 'package:pathmaker/widgets/character_sheet/components/skill_box_with_training.dart';
import 'package:pathmaker/widgets/divider_line.dart';
import 'package:pathmaker/enum.dart';

class Proficiencies extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final String languages =
        ref.watch(dataCoordinatorProvider).currentCharacter.languages.isEmpty
            ? 'None'
            : enumListAsString(
                ref.watch(dataCoordinatorProvider).currentCharacter.languages);
    final String traits = ref
            .watch(dataCoordinatorProvider)
            .currentCharacter
            .traits
            .isEmpty
        ? 'None'
        : ref.watch(dataCoordinatorProvider).currentCharacter.traits.join(', ');

    return CharacterSheetBox(
      label: 'Proficiencies',
      padding: true,
      height: 300,
      content: Column(
        children: [
          Wrap(
            spacing: 10.0,
            runSpacing: 10.0,
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
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              children: [
                Text('Languages'),
                Expanded(child: DividerLine()),
              ],
            ),
          ),
          Row(
            children: [
              Text(languages),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              children: [
                Text('Feats'),
                Expanded(child: DividerLine()),
              ],
            ),
          ),
          Row(
            children: [
              Text('List feats here'),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Row(
              children: [
                Text('Traits'),
                Expanded(child: DividerLine()),
              ],
            ),
          ),
          Row(
            children: [
              Text(traits),
            ],
          ),
        ],
      ),
    );
  }
}
