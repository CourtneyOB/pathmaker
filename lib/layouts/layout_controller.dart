import 'package:flutter/material.dart';
import 'package:pathmaker/constants.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget webLayout;
  final Widget mobileLayout;

  ResponsiveLayout({required this.webLayout, required this.mobileLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < kMobileWidth) {
          return mobileLayout;
        } else {
          return webLayout;
        }
      },
    );
  }
}
