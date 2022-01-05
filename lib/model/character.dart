import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:pathmaker/enum.dart';
import 'package:pathmaker/model/ancestry.dart';

class Character extends ChangeNotifier {
  String _name = "Hacks";

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  Map<Ability, int> abilityScores = {
    Ability.cha: 10,
    Ability.dex: 10,
    Ability.con: 10,
    Ability.intl: 10,
    Ability.wis: 10,
    Ability.str: 10,
  };

  //Background
  Ancestry? _ancestry;

  List<Ability> chooseAncestry(Ancestry newAncestry) {
    if (newAncestry == _ancestry) {
      List<Ability> ancestryAvailableBoosts =
          newAncestry.getUnassignedAbilities();
      return ancestryAvailableBoosts;
    }
    if (_ancestry != null) {
      //if ancestry already applied, remove the ability modifiers before applying new ones

      //remove boosts
      List<Ability> boosts = _ancestry!.getBoosts();
      for (Ability ability in boosts) {
        modifyAbilityScore(ability, -2);
      }

      //remove flaws
      List<Ability> flaws = _ancestry!.getFlaws();
      for (Ability ability in flaws) {
        modifyAbilityScore(ability, 2);
      }
    }
    //add boosts
    List<Ability> boosts = newAncestry.getBoosts();
    for (Ability ability in boosts) {
      modifyAbilityScore(ability, 2);
    }

    //add flaws
    List<Ability> flaws = newAncestry.getFlaws();
    for (Ability ability in flaws) {
      modifyAbilityScore(ability, -2);
    }

    List<Ability> ancestryAvailableBoosts =
        newAncestry.getUnassignedAbilities();
    _ancestry = newAncestry;
    return ancestryAvailableBoosts;
  }

  void modifyAbilityScore(Ability ability, int modifier) {
    int currentValue = abilityScores[ability]!;
    abilityScores[ability] = currentValue + modifier;
  }
}
