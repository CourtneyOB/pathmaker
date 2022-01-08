import 'package:flutter/material.dart';
import 'package:pathmaker/enum.dart';
import 'package:pathmaker/main.dart';
import 'package:pathmaker/widgets/ancestry_tab_detail.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pathmaker/model/ancestry.dart';
import 'package:pathmaker/widgets/tabs.dart';
import 'package:pathmaker/model/heritage.dart';

class HeritageTabs extends ConsumerStatefulWidget {
  @override
  _HeritageTabsState createState() => _HeritageTabsState();
}

class _HeritageTabsState extends ConsumerState<HeritageTabs> {
  List<Tab> getTabs() {
    List<Tab> tabs = [];
    for (Heritage heritage
        in ref.read(dataCoordinatorProvider).selectedAncestry!.heritages) {
      Tab newTab = Tab(text: heritage.name);
      tabs.add(newTab);
    }
    return tabs;
  }

  List<Widget> getTabDetails() {
    List<Widget> tabDetails = [];
    for (Heritage heritage
        in ref.read(dataCoordinatorProvider).selectedAncestry!.heritages) {
      tabDetails.add(Text(heritage.description));
    }
    return tabDetails;
  }

  @override
  Widget build(BuildContext context) {
    return Tabs(
      numberOfTabs:
          ref.read(dataCoordinatorProvider).selectedAncestry!.heritages.length,
      tabList: getTabs(),
      tabDetailList: getTabDetails(),
      onTap: (index) {
        ref.read(dataCoordinatorProvider.notifier).applyHeritage(ref
            .read(dataCoordinatorProvider)
            .selectedAncestry!
            .heritages[index]);
      },
    );
  }
}
