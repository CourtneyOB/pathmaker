import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pathmaker/widgets/ancestry_tab_detail.dart';
import 'package:pathmaker/constants.dart';

class Tabs extends ConsumerStatefulWidget {
  final int numberOfTabs;
  final Function(int index) onTap;
  final List<Tab> tabList;
  final List<Widget> tabDetailList;

  Tabs(
      {required this.numberOfTabs,
      required this.onTap,
      required this.tabList,
      required this.tabDetailList});

  @override
  _TabsState createState() => _TabsState();
}

class _TabsState extends ConsumerState<Tabs> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: widget.numberOfTabs,
      child: Column(
        children: [
          Container(
            height: 40.0,
            child: TabBar(
              onTap: (index) {
                widget.onTap(index);
              },
              indicatorColor: kDarkPrimaryColour,
              labelColor: kSecondaryTextColour,
              tabs: widget.tabList,
            ),
          ),
          SizedBox(
            height: 6.0,
          ),
          Container(
            height: 200.0,
            child: TabBarView(
              children: widget.tabDetailList,
            ),
          ),
        ],
      ),
    );
  }
}
