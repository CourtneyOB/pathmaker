import 'package:flutter/material.dart';
import 'package:pathmaker/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pathmaker/enum.dart';
import 'package:pathmaker/main.dart';

class MultiSelect extends ConsumerStatefulWidget {
  int maxSelection;

  MultiSelect({required this.maxSelection});

  @override
  _MultiSelectState createState() => _MultiSelectState();
}

class _MultiSelectState extends ConsumerState<MultiSelect> {
  void _showMultiSelect(BuildContext context) async {
    List<MultiSelectDialogItem> getItems() {
      List<MultiSelectDialogItem> items = [];
      for (Ability ability
          in ref.read(dataCoordinatorProvider).ancestryAvailableBoosts) {
        items.add(MultiSelectDialogItem(
            value: ability, label: ability.stringValue()));
      }
      return items;
    }

    List<Ability> selectedAbilities = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return MultiSelectDialog(
          items: getItems(),
          selectionCount: widget.maxSelection,
        );
      },
    );
    ref
        .read(dataCoordinatorProvider.notifier)
        .applyFreeBoosts(selectedAbilities);
  }

  @override
  Widget build(BuildContext context) {
    return TextButton(
      onPressed: () {
        _showMultiSelect(context);
      },
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.expand_more,
            color: kDarkPrimaryColour,
          ),
          Text(
            ref.watch(dataCoordinatorProvider).selectedFreeBoosts.isEmpty
                ? 'Select'
                : enumListAsString(
                    ref.watch(dataCoordinatorProvider).selectedFreeBoosts),
            style: TextStyle(color: kSecondaryTextColour, fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}

class MultiSelectDialog extends StatefulWidget {
  final List<MultiSelectDialogItem> items;
  final int selectionCount;

  MultiSelectDialog({required this.items, required this.selectionCount});

  @override
  _MultiSelectDialogState createState() => _MultiSelectDialogState();
}

class _MultiSelectDialogState extends State<MultiSelectDialog> {
  List<Ability> _selectedAbilities = [];
  bool isFull = false;

  void _onCancelTap() {
    Navigator.pop(context);
  }

  void _onSubmitTap() {
    Navigator.pop(context, _selectedAbilities);
  }

  void _onItemCheckedChange(Ability itemValue, bool checked) {
    setState(() {
      if (checked) {
        _selectedAbilities.add(itemValue);
      } else {
        _selectedAbilities.remove(itemValue);
      }
      _selectedAbilities.length >= widget.selectionCount
          ? isFull = true
          : isFull = false;
    });
  }

  Widget _buildItem(MultiSelectDialogItem item) {
    final checked = _selectedAbilities.contains(item.value);
    return CheckboxListTile(
      value: checked,
      title: Text(item.label),
      controlAffinity: ListTileControlAffinity.leading,
      onChanged: isFull && !checked
          ? null
          : (checked) => _onItemCheckedChange(item.value, checked!),
    );
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text('Select items'),
      contentPadding: EdgeInsets.all(10.0),
      content: SingleChildScrollView(
        child: ListTileTheme(
          contentPadding: EdgeInsets.fromLTRB(14.0, 0.0, 24.0, 0.0),
          child: ListBody(
            children: widget.items.map(_buildItem).toList(),
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

class MultiSelectDialogItem {
  MultiSelectDialogItem({required this.value, required this.label});
  final Ability value;
  final String label;
}
