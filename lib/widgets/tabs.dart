import 'package:flutter/material.dart';
import 'package:pathmaker/constants.dart';
import 'package:pathmaker/enum.dart';
import 'package:pathmaker/main.dart';
import 'package:pathmaker/widgets/tab_detail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pathmaker/model/ancestry.dart';

class Tabs extends ConsumerStatefulWidget {
  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends ConsumerState<Tabs> {
  List<Tab> getTabs() {
    List<Tab> tabs = [];
    for (Ancestry ancestry
        in ref.read(dataCoordinatorProvider).data.AncestryLibrary) {
      Tab newTab = Tab(text: ancestry.name);
      tabs.add(newTab);
    }
    return tabs;
  }

  List<TabDetail> getTabDetails() {
    List<TabDetail> tabDetails = [];
    for (Ancestry ancestry
        in ref.read(dataCoordinatorProvider).data.AncestryLibrary) {
      List<String> boosts = [];
      List<String> flaws = [];

      for (Ability ability in ancestry.getBoosts()) {
        boosts.add(ability.stringValue());
      }
      for (Ability ability in ancestry.getFlaws()) {
        flaws.add(ability.stringValue());
      }

      TabDetail newTabDetail = TabDetail(
          text: ancestry.description,
          boosts: boosts.join(', '),
          flaws: flaws.join(', '),
          optionalBoosts: ancestry.freeBoosts);
      tabDetails.add(newTabDetail);
    }
    return tabDetails;
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: ref.watch(dataCoordinatorProvider).data.AncestryLibrary.length,
      child: Column(
        children: [
          Container(
            height: 40.0,
            child: TabBar(
              onTap: (index) {
                ref.read(dataCoordinatorProvider).selectedAncestry = ref
                    .read(dataCoordinatorProvider)
                    .data
                    .AncestryLibrary[index];
                ref.read(dataCoordinatorProvider).updateSelections();
              },
              indicatorColor: kDarkPrimaryColour,
              labelColor: kSecondaryTextColour,
              tabs: getTabs(),
            ),
          ),
          SizedBox(
            height: 6.0,
          ),
          Container(
            height: 250.0,
            child: TabBarView(
              children: getTabDetails(),
            ),
          ),
        ],
      ),
    );
  }
}
