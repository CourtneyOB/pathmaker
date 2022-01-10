import 'package:flutter/material.dart';
import 'package:pathmaker/main.dart';
import 'package:pathmaker/widgets/top_bar.dart';
import 'package:pathmaker/widgets/character_sheet/character_sheet.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pathmaker/widgets/message_column.dart';

class SmallWebLayout extends ConsumerWidget {
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.01),
          child: Column(
            children: [
              TopBar(),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  MessageColumn(),
                  ConstrainedBox(
                      constraints: BoxConstraints(maxWidth: 665),
                      child: CharacterSheet()),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
