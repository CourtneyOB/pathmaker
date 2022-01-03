import 'package:flutter/material.dart';
import 'package:pathmaker/constants.dart';
import 'package:pathmaker/widgets/tab_detail.dart';

class Tabs extends StatelessWidget {
  const Tabs({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 6,
      child: Column(
        children: [
          Container(
            height: 40.0,
            child: TabBar(
              indicatorColor: kDarkPrimaryColour,
              labelColor: kSecondaryTextColour,
              tabs: [
                Tab(text: 'Dwarf'),
                Tab(text: 'Elf'),
                Tab(text: 'Gnome'),
                Tab(text: 'Goblin'),
                Tab(text: 'Halfling'),
                Tab(text: 'Human'),
              ],
            ),
          ),
          SizedBox(
            height: 6.0,
          ),
          Container(
            height: 150.0,
            child: TabBarView(
              children: [
                TabDetail(
                  text:
                      'Dwarves are a short, stocky people who are often stubborn, fierce, and devoted.',
                  boosts: 'Consitution, Wisdom, free',
                  flaws: 'charisma',
                ),
                TabDetail(
                  text:
                      'Elves are a tall, slender, long-lived people with a strong tradition of art and magic.',
                  boosts: 'Dexterity, Intelligence, free',
                  flaws: 'Constitution',
                ),
                TabDetail(
                  text:
                      'Gnomes are short and hardy folk, with an unquenchable curiosity and eccentric habits.',
                  boosts: 'Constitution, Charisma, free',
                  flaws: 'Strength',
                ),
                TabDetail(
                  text:
                      'Goblins are a short, scrappy, energetic people who have spent millennia maligned and feared.',
                  boosts: 'Dexterity, Charisma, free',
                  flaws: 'Wisdom',
                ),
                TabDetail(
                  text:
                      'Halflings are a short, adaptable people who exhibit remarkable curiosity and humor.',
                  boosts: 'Dexterity, Wisdom, free',
                  flaws: 'Strength',
                ),
                TabDetail(
                  text:
                      'Humans are incredibly diverse. Some, such as half-elves and half-orcs, even have non-human ancestors.',
                  boosts: 'Two free ability boosts',
                  flaws: 'None',
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
