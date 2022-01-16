import 'package:pathmaker/enum.dart';
import 'package:pathmaker/model/heritage.dart';
import 'package:pathmaker/model/feat.dart';

class Ancestry {
  int id;
  String name;
  String description;
  int initialHP;
  Size size;
  int speed;
  List<Language> languages;
  List<String> traits;
  List<Heritage> heritages;
  List<Feat> feats;

  Map<Ability, Modifier> abilityModifiers = {};
  int freeBoosts;

  Ancestry(
      {required this.id,
      required this.name,
      required this.description,
      required this.freeBoosts,
      required List<Ability> boosts,
      required List<Ability> flaws,
      required this.initialHP,
      required this.size,
      required this.speed,
      required this.languages,
      required this.traits,
      required this.heritages,
      required this.feats}) {
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
