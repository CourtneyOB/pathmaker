import 'package:flutter/material.dart';
import 'package:pathmaker/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pathmaker/main.dart';
import 'package:pathmaker/enum.dart';
import 'package:pathmaker/services/data_coordinator.dart';

class OptionBox extends ConsumerStatefulWidget {
  final int id;

  OptionBox({required this.id});

  @override
  _OptionBoxState createState() => _OptionBoxState();
}

class _OptionBoxState extends ConsumerState<OptionBox> {
  @override
  Widget build(BuildContext context) {
    List<Ability> boostList =
        ref.read(dataCoordinatorProvider).ancestryAvailableBoosts;

    ref.listen<DataCoordinator>(dataCoordinatorProvider, (previous, next) {
      print('listener called');
      boostList = ref.read(dataCoordinatorProvider).updateFreeBoostList();
    });

    Ability? value =
        ref.watch(dataCoordinatorProvider).selectedFreeBoosts.length <=
                widget.id
            ? null
            : ref.watch(dataCoordinatorProvider).selectedFreeBoosts[widget.id];

    return DropdownButton(
      value: value,
      style: TextStyle(color: kSecondaryTextColour),
      items: boostList.map((Ability items) {
        return DropdownMenuItem(child: Text(items.stringValue()), value: items);
      }).toList(),
      onChanged: (Ability? value) {
        ref.read(dataCoordinatorProvider).addSelection(widget.id, value!);
      },
    );
  }
}
