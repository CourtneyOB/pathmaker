import 'package:pathmaker/model/ancestry.dart';
import 'package:pathmaker/enum.dart';

class PathFinderData {
  List<Ancestry> _ancestryLibrary = [
    Ancestry(
        name: 'Dwarf',
        description:
            'Dwarves are a short, stocky people who are often stubborn, fierce, and devoted.',
        freeBoosts: 1,
        boosts: [Ability.con, Ability.wis],
        flaws: [Ability.cha]),
    Ancestry(
        name: 'Elf',
        description:
            'Elves are a tall, slender, long-lived people with a strong tradition of art and magic.',
        freeBoosts: 1,
        boosts: [Ability.dex, Ability.intl],
        flaws: [Ability.con]),
    Ancestry(
        name: 'Gnome',
        description:
            'Gnomes are short and hardy folk, with an unquenchable curiosity and eccentric habits.',
        freeBoosts: 1,
        boosts: [Ability.con, Ability.cha],
        flaws: [Ability.str]),
    Ancestry(
        name: 'Goblin',
        description:
            'Goblins are a short, scrappy, energetic people who have spent millennia maligned and feared.',
        freeBoosts: 1,
        boosts: [Ability.dex, Ability.cha],
        flaws: [Ability.wis]),
    Ancestry(
        name: 'Halfling',
        description:
            'Halflings are a short, adaptable people who exhibit remarkable curiosity and humor.',
        freeBoosts: 1,
        boosts: [Ability.dex, Ability.wis],
        flaws: [Ability.str]),
    Ancestry(
        name: 'Human',
        description:
            'Humans are incredibly diverse. Some, such as half-elves and half-orcs, even have non-human ancestors.',
        freeBoosts: 2,
        boosts: [],
        flaws: []),
  ];

  get AncestryLibrary => _ancestryLibrary;
}
