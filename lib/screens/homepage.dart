import 'package:flutter/material.dart';
import 'package:pathmaker/layouts/layout_controller.dart';
import 'package:pathmaker/layouts/small_web_layout.dart';
import 'package:pathmaker/layouts/web_layout.dart';
import 'package:pathmaker/layouts/mobile_layout.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ResponsiveLayout(
        sizeXLLayout: WebLayout(),
        sizeMLayout: MobileLayout(),
        sizeLLayout: SmallWebLayout(),
      ),
    );
  }
}
