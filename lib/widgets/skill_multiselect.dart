import 'package:flutter/material.dart';
import 'package:pathmaker/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pathmaker/enum.dart';
import 'package:pathmaker/main.dart';

class SkillMultiSelect extends ConsumerStatefulWidget {
  int maxSelection;

  SkillMultiSelect({required this.maxSelection});

  @override
  _SkillMultiSelectState createState() => _SkillMultiSelectState();
}

class _SkillMultiSelectState extends ConsumerState<SkillMultiSelect> {
  void _showMultiSelect(BuildContext context) async {
    List<SkillMultiSelectDialogItem> getItems() {
      List<SkillMultiSelectDialogItem> items = [];
      for (Skill skill in ref
          .read(dataCoordinatorProvider)
          .currentCharacter
          .getUntrainedSkills()) {
        items.add(SkillMultiSelectDialogItem(
            value: skill, label: skill.stringValue()));
      }
      return items;
    }

    List<Skill> selectedSkills = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return SkillMultiSelectDialog(
          items: getItems(),
          selectionCount: widget.maxSelection,
        );
      },
    );
    ref.read(dataCoordinatorProvider.notifier).applyFreeSkills(selectedSkills);
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
            ref.watch(dataCoordinatorProvider).selectedFreeSkills.isEmpty
                ? 'Select ${widget.maxSelection} skill${widget.maxSelection > 1 ? 's' : ''}'
                : enumListAsString(
                    ref.watch(dataCoordinatorProvider).selectedFreeSkills),
            style: TextStyle(color: kSecondaryTextColour, fontSize: 14.0),
          ),
        ],
      ),
    );
  }
}

class SkillMultiSelectDialog extends StatefulWidget {
  final List<SkillMultiSelectDialogItem> items;
  final int selectionCount;

  SkillMultiSelectDialog({required this.items, required this.selectionCount});

  @override
  _SkillMultiSelectDialogState createState() => _SkillMultiSelectDialogState();
}

class _SkillMultiSelectDialogState extends State<SkillMultiSelectDialog> {
  List<Skill> _selectedSkills = [];
  bool isFull = false;

  void _onCancelTap() {
    Navigator.pop(context);
  }

  void _onSubmitTap() {
    Navigator.pop(context, _selectedSkills);
  }

  void _onItemCheckedChange(Skill itemValue, bool checked) {
    setState(() {
      if (checked) {
        _selectedSkills.add(itemValue);
      } else {
        _selectedSkills.remove(itemValue);
      }
      _selectedSkills.length >= widget.selectionCount
          ? isFull = true
          : isFull = false;
    });
  }

  Widget _buildItem(SkillMultiSelectDialogItem item) {
    final checked = _selectedSkills.contains(item.value);
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

class SkillMultiSelectDialogItem {
  SkillMultiSelectDialogItem({required this.value, required this.label});
  final Skill value;
  final String label;
}
