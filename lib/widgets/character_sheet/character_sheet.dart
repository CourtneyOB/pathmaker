import 'package:flutter/material.dart';
import 'package:pathmaker/main.dart';
import 'package:pathmaker/widgets/character_sheet/character_sheet_demographics.dart';
import 'package:pathmaker/widgets/character_sheet/character_sheet_detail_blocks.dart';
import 'package:pathmaker/widgets/character_sheet/character_sheet_stat_stacks.dart';

import 'package:flutter_riverpod/flutter_riverpod.dart';

class CharacterSheet extends ConsumerWidget {
  const CharacterSheet({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.001),
      child: Card(
        elevation: 8,
        child: Padding(
          padding: EdgeInsets.all(screenWidth(context) * 0.015),
          child: Column(
            children: [
              CharacterSheetDemographics(),
              CharacterSheetStatStacks(),
              CharacterSheetDetailBlocks(),
            ],
          ),
        ),
      ),
    );
  }
}
