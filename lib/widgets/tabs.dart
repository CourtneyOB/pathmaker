import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pathmaker/constants.dart';

class Tabs extends ConsumerStatefulWidget {
  final int initialTab;
  final int numberOfTabs;
  final Function(int index) onTap;
  final List<Tab> tabList;
  final List<Widget> tabDetailList;

  Tabs(
      {required this.initialTab,
      required this.numberOfTabs,
      required this.onTap,
      required this.tabList,
      required this.tabDetailList});

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends ConsumerState<Tabs> {
  List<Widget> getDetail() {
    List<Widget> tabDetail = [];

    return tabDetail;
  }

  int _selectedTab = 0;

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: widget.initialTab,
      length: widget.numberOfTabs,
      child: Column(
        children: [
          Container(
            height: 40.0,
            child: TabBar(
              isScrollable: true,
              onTap: (index) {
                widget.onTap(index);
                setState(() {
                  _selectedTab = index;
                });
              },
              indicatorColor: kDarkPrimaryColour,
              labelColor: kSecondaryTextColour,
              tabs: widget.tabList,
            ),
          ),
          SizedBox(
            height: 6.0,
          ),
          Column(
            children: [
              widget.tabDetailList[_selectedTab],
            ],
          )
        ],
      ),
    );
  }
}
