import 'package:pathmaker/enum.dart';
import 'package:pathmaker/model/ancestry.dart';
import 'package:pathmaker/model/heritage.dart';

class Character {
  String _name = "ReallyReallyLongName";
  int _hp = 5;
  Size _size = Size.medium;
  int _speed = 0;
  List<Language> _languages = [];
  List<String> _traits = [];

  Map<Ability, int> _abilityScores = {
    Ability.cha: 10,
    Ability.dex: 10,
    Ability.con: 10,
    Ability.intl: 10,
    Ability.wis: 10,
    Ability.str: 10,
  };

  String get name => _name;
  int get hp => _hp;
  Size get size => _size;
  int get speed => _speed;
  List<Language> get languages => _languages;
  List<String> get traits => _traits;
  Map<Ability, int> get abilityScores => _abilityScores;

  //Background
  Ancestry? _ancestry;
  Heritage? _heritage;

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

    //add other attributes
    _hp = newAncestry.initialHP;
    _size = newAncestry.size;
    _languages = newAncestry.languages;
    _speed = newAncestry.speed;
    _traits = newAncestry.traits;

    List<Ability> ancestryAvailableBoosts =
        newAncestry.getUnassignedAbilities();

    _ancestry = newAncestry;
    return ancestryAvailableBoosts;
  }

  void chooseHeritage(Heritage newHeritage) {
    if (_heritage == newHeritage) {
      return;
    }
    _heritage = newHeritage;
  }

  void modifyAbilityScore(Ability ability, int modifier) {
    int currentValue = abilityScores[ability]!;
    abilityScores[ability] = currentValue + modifier;
  }
}
