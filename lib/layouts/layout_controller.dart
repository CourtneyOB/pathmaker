import 'package:flutter/material.dart';
import 'package:pathmaker/constants.dart';

class ResponsiveLayout extends StatelessWidget {
  final Widget sizeXLLayout;
  final Widget sizeMLayout;
  final Widget sizeLLayout;
  final Widget sizeSLayout;

  ResponsiveLayout(
      {required this.sizeXLLayout,
      required this.sizeMLayout,
      required this.sizeLLayout,
      required this.sizeSLayout});

  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (context, constraints) {
        if (constraints.maxWidth < kSizeMWidth) {
          return sizeSLayout;
        }
        if (constraints.maxWidth < kSizeLWidth) {
          return sizeMLayout;
        }
        if (constraints.maxWidth < kSizeXLWidth) {
          return sizeLLayout;
        } else {
          return sizeXLLayout;
        }
      },
    );
  }
}
