import 'package:flutter/material.dart';
import 'package:pathmaker/enum.dart';
import 'package:pathmaker/main.dart';
import 'package:pathmaker/widgets/ancestry_tab_detail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pathmaker/model/ancestry.dart';
import 'package:pathmaker/widgets/tabs.dart';

class AncestryTabs extends ConsumerStatefulWidget {
  @override
  _AncestryTabsState createState() => _AncestryTabsState();
}

class _AncestryTabsState extends ConsumerState<AncestryTabs> {
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
    return Tabs(
      initialTab: ref.watch(dataCoordinatorProvider).selectedAncestry!.id,
      numberOfTabs:
          ref.read(dataCoordinatorProvider).data.AncestryLibrary.length,
      tabList: getTabs(),
      tabDetailList: getTabDetails(),
      onTap: (index) {
        ref.read(dataCoordinatorProvider.notifier).applyAncestry(index);
      },
    );
  }
}
