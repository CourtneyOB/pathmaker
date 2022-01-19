import 'package:pathmaker/enum.dart';
import 'package:pathmaker/model/ancestry.dart';
import 'package:pathmaker/model/heritage.dart';
import 'package:pathmaker/model/feat.dart';
import 'package:pathmaker/model/skill_level.dart';

class Character {
  String _name = "ReallyReallyLongName";
  int _hp = 5;
  Size _size = Size.medium;
  int _speed = 0;
  List<Language> _languages = [];
  List<String> _traits = [];
  List<String> _characteristics = [];
  List<SkillLevel> _skills = [
    SkillLevel(id: 0, name: 'Acrobatics', associatedAbility: Ability.dex),
    SkillLevel(id: 1, name: 'Arcana', associatedAbility: Ability.intl),
    SkillLevel(id: 2, name: 'Athletics', associatedAbility: Ability.str),
    SkillLevel(id: 3, name: 'Crafting', associatedAbility: Ability.intl),
    SkillLevel(id: 4, name: 'Deception', associatedAbility: Ability.cha),
    SkillLevel(id: 5, name: 'Diplomacy', associatedAbility: Ability.cha),
    SkillLevel(id: 6, name: 'Intimidation', associatedAbility: Ability.cha),
    SkillLevel(id: 7, name: 'Lore', associatedAbility: Ability.intl),
    SkillLevel(id: 8, name: 'Medicine', associatedAbility: Ability.wis),
    SkillLevel(id: 9, name: 'Nature', associatedAbility: Ability.wis),
    SkillLevel(id: 10, name: 'Occultism', associatedAbility: Ability.intl),
    SkillLevel(id: 11, name: 'Performance', associatedAbility: Ability.cha),
    SkillLevel(id: 12, name: 'Religion', associatedAbility: Ability.wis),
    SkillLevel(id: 13, name: 'Society', associatedAbility: Ability.intl),
    SkillLevel(id: 14, name: 'Stealth', associatedAbility: Ability.dex),
    SkillLevel(id: 15, name: 'Survival', associatedAbility: Ability.wis),
    SkillLevel(id: 16, name: 'Thievery', associatedAbility: Ability.dex),
  ];

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
  List<String> get characteristics => _characteristics;
  Map<Ability, int> get abilityScores => _abilityScores;
  List<SkillLevel> get skills => _skills;

  //Background
  Ancestry? _ancestry;
  Heritage? _heritage;
  Feat? _ancestryFeat;

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

      //remove heritage if selected
      if (_heritage != null) {
        _characteristics.remove(_heritage!.description);
        _heritage = null;
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
    if (_heritage != null) {
      _characteristics.remove(_heritage!.description);
    }
    _heritage = newHeritage;
    _characteristics.add(_heritage!.description);
  }

  void chooseAncestryFeat(Feat newFeat) {
    if (_ancestryFeat == newFeat) {
      return;
    }
    if (_ancestryFeat != null) {
      //remove attributes associated with feat
    }
    _ancestryFeat = newFeat;
    //add attributes associated with feat
  }

  void modifyAbilityScore(Ability ability, int modifier) {
    int currentValue = abilityScores[ability]!;
    abilityScores[ability] = currentValue + modifier;
    for (SkillLevel skill in _skills) {
      if (skill.associatedAbility == ability) {
        skill.currentModifier = skill.initialModifier +
            convertToIntModifier(abilityScores[ability]!);
      }
    }
  }
}
