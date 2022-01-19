import 'package:flutter/material.dart';
import 'package:pathmaker/main.dart';
import 'package:pathmaker/widgets/character_sheet/character_sheet.dart';
import 'package:pathmaker/widgets/top_bar.dart';
import 'package:pathmaker/screens/drawer_menu.dart';
import 'package:pathmaker/constants.dart';

class CharacterSheetFullScreen extends StatelessWidget {
  const CharacterSheetFullScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: kDividerColour),
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: kPrimaryTextColour),
        title: TopBar(),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding:
              EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.01),
          child: Column(
            children: [
              CharacterSheet(),
            ],
          ),
        ),
      ),
      drawer: DrawerMenu(),
    );
  }
}
