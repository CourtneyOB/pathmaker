import 'package:flutter/material.dart';
import 'skill_box_with_training.dart';
import 'package:pathmaker/widgets/character_sheet/components/modifier_circle.dart';

class SkillModifier extends StatelessWidget {
  SkillModifier(
      {required this.training, required this.label, required this.modifier});

  final String training;
  final String label;
  final String modifier;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 160.0,
      height: 30.0,
      child: Stack(
        alignment: Alignment.center,
        children: [
          SkillBoxWithTraining(training: training, label: label),
          Positioned(
            child: ModifierCircle(value: modifier),
            right: 0,
          ),
        ],
      ),
    );
  }
}
