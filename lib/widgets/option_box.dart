import 'package:flutter/material.dart';
import 'package:pathmaker/constants.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pathmaker/main.dart';
import 'package:pathmaker/enum.dart';

class OptionBox extends ConsumerStatefulWidget {
  final int id;

  OptionBox({required this.id});

  @override
  _OptionBoxState createState() => _OptionBoxState();
}

class _OptionBoxState extends ConsumerState<OptionBox> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      value: ref
                  .read(dataCoordinatorProvider)
                  .currentCharacter
                  .selectedFreeBoosts
                  .length <=
              widget.id
          ? null
          : ref
              .read(dataCoordinatorProvider)
              .currentCharacter
              .selectedFreeBoosts[widget.id],
      style: TextStyle(color: kSecondaryTextColour),
      items: ref
          .watch(dataCoordinatorProvider)
          .currentCharacter
          .ancestryAvailableBoosts
          .map((Ability items) {
        return DropdownMenuItem(child: Text(items.stringValue()), value: items);
      }).toList(),
      onChanged: (Ability? value) {
        setState(() {
          if (ref
                  .read(dataCoordinatorProvider)
                  .currentCharacter
                  .selectedFreeBoosts
                  .length <=
              widget.id) {
            ref
                .read(dataCoordinatorProvider)
                .currentCharacter
                .selectedFreeBoosts
                .add(value);
          } else {
            ref
                .read(dataCoordinatorProvider)
                .currentCharacter
                .selectedFreeBoosts[widget.id] = value;
          }
        });
      },
    );
  }
}
