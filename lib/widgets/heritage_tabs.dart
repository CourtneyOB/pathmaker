import 'package:flutter/material.dart';
import 'package:pathmaker/main.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pathmaker/widgets/tabs.dart';

class HeritageTabs extends ConsumerStatefulWidget {
  @override
  _HeritageTabsState createState() => _HeritageTabsState();
}

class _HeritageTabsState extends ConsumerState<HeritageTabs> {
  @override
  Widget build(BuildContext context) {
    return Tabs(
      initialTab: ref.watch(dataCoordinatorProvider).selectedHeritage!.id,
      numberOfTabs:
          ref.watch(dataCoordinatorProvider).availableHeritages.length,
      tabList: ref
          .watch(dataCoordinatorProvider)
          .availableHeritages
          .map<Tab>((item) {
        return Tab(
          text: item.name,
        );
      }).toList(),
      tabDetailList: ref
          .watch(dataCoordinatorProvider)
          .availableHeritages
          .map<Widget>((item) {
        return Text(item.description);
      }).toList(),
      onTap: (index) {
        ref.read(dataCoordinatorProvider.notifier).applyHeritage(index);
      },
    );
  }
}
