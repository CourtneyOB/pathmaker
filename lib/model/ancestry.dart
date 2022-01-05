import 'package:pathmaker/enum.dart';

class Ancestry {
  String name;
  String description;
  Map<Ability, Modifier> abilityModifiers = {};
  int freeBoosts;

  Ancestry(
      {required this.name,
      required this.description,
      required this.freeBoosts,
      required List<Ability> boosts,
      required List<Ability> flaws}) {
    for (var ability in Ability.values) {
      if (boosts.contains(ability)) {
        abilityModifiers[ability] = Modifier.boost;
      } else if (flaws.contains(ability)) {
        abilityModifiers[ability] = Modifier.flaw;
      } else {
        abilityModifiers[ability] = Modifier.unselected;
      }
    }
  }

  List<Ability> getBoosts() {
    List<Ability> boosts = [];

    abilityModifiers.forEach((key, value) {
      if (value == Modifier.boost) {
        boosts.add(key);
      }
    });

    return boosts;
  }

  List<Ability> getFlaws() {
    List<Ability> flaws = [];

    abilityModifiers.forEach((key, value) {
      if (value == Modifier.flaw) {
        flaws.add(key);
      }
    });

    return flaws;
  }

  List<Ability> getUnassignedAbilities() {
    List<Ability> unassigned = [];

    abilityModifiers.forEach((key, value) {
      if (value == Modifier.unselected) {
        unassigned.add(key);
      }
    });

    return unassigned;
  }
}
