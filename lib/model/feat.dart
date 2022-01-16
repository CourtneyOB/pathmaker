import 'package:pathmaker/enum.dart';

class Feat {
  int id;
  String name;
  String description;
  List<Skill> skillTrained;
  int freeSkills;
  List<String> weaponProficiencies;
  int speedBonus;
  int cantrips;
  int generalFeats;
  int classFeats;

  Feat({
    required this.id,
    required this.name,
    required this.description,
    this.skillTrained = const [],
    this.freeSkills = 0,
    this.weaponProficiencies = const [],
    this.speedBonus = 0,
    this.cantrips = 0,
    this.generalFeats = 0,
    this.classFeats = 0,
  });
}
