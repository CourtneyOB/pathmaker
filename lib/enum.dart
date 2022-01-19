enum Ability {
  intl,
  cha,
  wis,
  dex,
  con,
  str,
}

enum Skill {
  acrobatics,
  arcana,
  athletics,
  crafting,
  deception,
  diplomacy,
  intimidation,
  lore,
  medicine,
  nature,
  occultism,
  performance,
  religion,
  society,
  stealth,
  survival,
  thievery,
}

enum Training {
  untrained,
  trained,
  expert,
  master,
  legendary,
}

enum Language {
  common,
  dwarven,
  gnomish,
  orcish,
  goblin,
  jotun,
  terran,
  undercommon,
  elven,
  celestial,
  draconic,
  gnoll,
  sylvan,
  halfling,
}

enum Size {
  fine,
  diminutive,
  tiny,
  small,
  medium,
  large,
  huge,
  gargantuan,
  colossal,
}

enum Modifier {
  boost,
  unselected,
  flaw,
}

Map<Ability, String> abilityStringValues = {
  Ability.intl: 'Intelligence',
  Ability.cha: 'Charisma',
  Ability.wis: 'Wisdom',
  Ability.dex: 'Dexterity',
  Ability.con: 'Constitution',
  Ability.str: 'Strength',
};

extension ParseString on Enum {
  String stringValue() {
    return (this.toString().split('.').last).capitalise();
  }
}

extension ParseAbilityString on Ability {
  @override
  String stringValue() {
    return abilityStringValues[this]!;
  }
}

extension StringExtension on String {
  String capitalise() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}

String enumListAsString(List<Enum> list) {
  List<String> stringList = [];

  if (list is List<Ability>) {
    for (Ability item in list) {
      stringList.add(item.stringValue());
    }
  } else {
    for (Enum item in list) {
      stringList.add(item.stringValue());
    }
  }
  return stringList.join(', ');
}

String convertToStringModifier(int value) {
  String stringValue = '';
  int modifierValue = ((value - 10) / 2).floorToDouble().toInt();
  if (modifierValue > 0) {
    stringValue = '+$modifierValue';
  } else {
    stringValue = modifierValue.toString();
  }
  return stringValue;
}

int convertToIntModifier(int value) {
  return ((value - 10) / 2).floorToDouble().toInt();
}
