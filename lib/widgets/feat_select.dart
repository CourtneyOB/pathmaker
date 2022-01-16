import 'package:flutter/material.dart';
import 'package:pathmaker/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pathmaker/main.dart';
import 'package:pathmaker/widgets/feat_tab_detail.dart';

class FeatSelect extends ConsumerStatefulWidget {
  const FeatSelect({Key? key}) : super(key: key);

  @override
  _FeatSelectState createState() => _FeatSelectState();
}

class _FeatSelectState extends ConsumerState<FeatSelect> {
  void _showFeatSelect(BuildContext context) async {
    int selectedFeat = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return FeatSelectDialog(
            initialTab:
                ref.watch(dataCoordinatorProvider).selectedAncestryFeat == null
                    ? 0
                    : ref
                        .watch(dataCoordinatorProvider)
                        .selectedAncestryFeat!
                        .id,
            tabList: ref
                .watch(dataCoordinatorProvider)
                .availableAncestryFeats
                .map<Tab>((item) {
              return Tab(
                height: 16,
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 12.0),
                  child: Text(item.name),
                ),
              );
            }).toList(),
            tabDetails: ref
                .watch(dataCoordinatorProvider)
                .availableAncestryFeats
                .map<FeatTabDetail>((item) {
              return FeatTabDetail(text: item.description);
            }).toList(),
            numberOfTabs: ref
                .watch(dataCoordinatorProvider)
                .availableAncestryFeats
                .length);
      },
    );
    ref.read(dataCoordinatorProvider.notifier).applyAncestryFeat(selectedFeat);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        _showFeatSelect(context);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.expand_more,
            color: kDarkPrimaryColour,
          ),
          Text(
            ref.watch(dataCoordinatorProvider).selectedAncestryFeat == null
                ? 'Select'
                : ref.watch(dataCoordinatorProvider).selectedAncestryFeat!.name,
            style: TextStyle(color: kSecondaryTextColour, fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}

class FeatSelectDialog extends StatefulWidget {
  final int initialTab;
  final int numberOfTabs;
  final List<Tab> tabList;
  final List<FeatTabDetail> tabDetails;

  FeatSelectDialog(
      {required this.initialTab,
      required this.tabList,
      required this.tabDetails,
      required this.numberOfTabs});

  @override
  _FeatSelectDialogState createState() => _FeatSelectDialogState();
}

class _FeatSelectDialogState extends State<FeatSelectDialog> {
  int _selectedIndex = 0;

  List<RotatedBox> _buildTabsList(List<Tab> tabs) {
    List<RotatedBox> tabList = [];
    for (Tab tab in tabs) {
      tabList.add(RotatedBox(quarterTurns: 3, child: tab));
    }
    return tabList;
  }

  void _onCancelTap() {
    Navigator.pop(context);
  }

  void _onSubmitTap() {
    Navigator.pop(context, _selectedIndex);
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select an Ancestry Feat'),
      contentPadding: EdgeInsets.all(10.0),
      content: IntrinsicHeight(
        child: DefaultTabController(
          initialIndex: widget.initialTab,
          length: widget.numberOfTabs,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              RotatedBox(
                quarterTurns: 1,
                child: TabBar(
                  isScrollable: true,
                  onTap: (index) {
                    setState(() {
                      _selectedIndex = index;
                    });
                  },
                  indicatorColor: kDarkPrimaryColour,
                  labelColor: kSecondaryTextColour,
                  tabs: _buildTabsList(widget.tabList),
                ),
              ),
              SizedBox(
                width: 6.0,
              ),
              Expanded(
                child: widget.tabDetails[_selectedIndex],
              ),
            ],
          ),
        ),
      ),
      actions: <Widget>[
        FlatButton(
          child: Text('CANCEL'),
          onPressed: _onCancelTap,
        ),
        FlatButton(
          child: Text('OK'),
          onPressed: _onSubmitTap,
        )
      ],
    );
  }
}
