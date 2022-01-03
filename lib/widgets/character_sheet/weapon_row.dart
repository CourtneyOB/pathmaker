import 'package:flutter/material.dart';
import 'package:pathmaker/widgets/character_sheet/skill_box_with_training.dart';

class WeaponRow extends StatelessWidget {
  WeaponRow({required this.name, required this.modifier, required this.damage});

  final String name;
  final String modifier;
  final String damage;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SkillBoxWithTraining(width: 200.0, training: 'T', label: name),
            Expanded(
              child: Container(),
            ),
            Container(
              width: 80.0,
              child: Row(
                children: [
                  Stack(
                    alignment: Alignment.center,
                    children: [
                      ConstrainedBox(
                        constraints: BoxConstraints(maxWidth: 38.0),
                        child: Image.asset('lib/images/d20.png'),
                      ),
                      Text(
                        modifier,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16.0,
                        ),
                      ),
                    ],
                  ),
                  Text(damage),
                ],
              ),
            ),
          ],
        ),
        SizedBox(
          height: 20.0,
        ),
      ],
    );
  }
}
