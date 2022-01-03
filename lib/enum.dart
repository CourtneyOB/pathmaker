enum Ancestry {
  human,
  elf,
  gnome,
  goblin,
  halfling,
  dwarf,
}

extension ParseToString on Ancestry {
  String stringValue() {
    return this.toString().split('.').last;
  }
}
