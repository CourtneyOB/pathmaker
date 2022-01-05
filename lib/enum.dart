enum AncestryEnum {
  human,
  elf,
  gnome,
  goblin,
  halfling,
  dwarf,
}

enum Ability {
  intl,
  cha,
  wis,
  dex,
  con,
  str,
}

enum Modifier { boost, unselected, flaw }

Map<Ability, String> abilityStringValues = {
  Ability.intl: 'Intelligence',
  Ability.cha: 'Charisma',
  Ability.wis: 'Wisdom',
  Ability.dex: 'Dexterity',
  Ability.con: 'Constitution',
  Ability.str: 'Strength',
};

extension ParseAncestryString on AncestryEnum {
  String stringValue() {
    return this.toString().split('.').last;
  }
}

extension ParseAbilityString on Ability {
  String stringValue() {
    return abilityStringValues[this]!;
  }
}
