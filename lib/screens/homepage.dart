import 'package:flutter/material.dart';
import 'package:pathmaker/constants.dart';
import 'package:pathmaker/main.dart';
import 'package:pathmaker/layouts/layout_controller.dart';
import 'package:pathmaker/layouts/size_l_layout.dart';
import 'package:pathmaker/layouts/size_xl_layout.dart';
import 'package:pathmaker/layouts/size_m_layout.dart';
import 'package:pathmaker/layouts/size_s_layout.dart';
import 'package:pathmaker/screens/drawer_menu.dart';
import 'package:pathmaker/widgets/top_bar.dart';

class HomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: kDividerColour),
        backgroundColor: Colors.white,
        titleTextStyle: TextStyle(color: kPrimaryTextColour),
        title: TopBar(),
      ),
      body: ResponsiveLayout(
        sizeXLLayout: SizeXLLayout(),
        sizeMLayout: SizeMLayout(),
        sizeLLayout: SizeLLayout(),
        sizeSLayout: SizeSLayout(),
      ),
      drawer: DrawerMenu(),
    );
  }
}
