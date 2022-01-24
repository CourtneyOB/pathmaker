import 'package:pathmaker/enum.dart';

class SkillLevel {
  int id;
  Skill name;
  Ability associatedAbility;
  Training training;
  int trainingContributors;
  int initialModifier;
  int abilityModifier;
  int currentModifier;

  SkillLevel(
      {required this.id,
      required this.name,
      required this.associatedAbility,
      this.training = Training.untrained,
      this.trainingContributors = 0,
      this.initialModifier = 0,
      this.abilityModifier = 0,
      this.currentModifier = 0});

  void trainSkill(Training newTraining) {
    training = newTraining;
    if (training == Training.trained) {
      initialModifier = 3;
    } else {
      initialModifier = 0;
    }
    calculateModifier();
  }

  void calculateModifier() {
    currentModifier = initialModifier + abilityModifier;
  }
}
