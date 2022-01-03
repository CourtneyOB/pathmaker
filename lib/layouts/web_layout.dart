import 'package:flutter/material.dart';
import 'package:pathmaker/constants.dart';
import 'package:pathmaker/widgets/top_bar.dart';
import 'package:pathmaker/widgets/character_sheet/character_sheet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pathmaker/widgets/message_column.dart';

class WebLayout extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            TopBar(),
            Padding(
              padding:
                  const EdgeInsets.symmetric(horizontal: kWebHorizontalPadding),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MessageColumn(),
                  CharacterSheet(),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
