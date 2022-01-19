import 'package:pathmaker/enum.dart';

class SkillLevel {
  int id;
  String name;
  Ability associatedAbility;
  Training training;
  int initialModifier;
  int currentModifier;

  SkillLevel(
      {required this.id,
      required this.name,
      required this.associatedAbility,
      this.training = Training.untrained,
      this.initialModifier = 0,
      this.currentModifier = 0});

  void trainSkill(Training newTraining) {
    training = newTraining;
    if (training == Training.trained) {
      initialModifier = 3;
    } else {
      initialModifier = 0;
    }
  }
}
