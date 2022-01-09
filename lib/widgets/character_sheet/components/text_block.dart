import 'package:flutter/material.dart';
import 'package:pathmaker/constants.dart';
import 'package:pathmaker/main.dart';
import 'package:pathmaker/widgets/divider_line.dart';
import 'package:auto_size_text/auto_size_text.dart';

class TextBlock extends StatelessWidget {
  final String label;
  final String value;

  TextBlock({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    return Flexible(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: screenWidth(context) * 0.005),
        child: ConstrainedBox(
          constraints:
              BoxConstraints(maxHeight: 45.0, minWidth: 100.0, maxWidth: 200.0),
          child: Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: kDividerColour,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(5.0),
              boxShadow: [
                BoxShadow(
                  color: kDividerColour,
                  spreadRadius: 1.0,
                  blurRadius: 4,
                  offset: Offset(0, 2),
                ),
              ],
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 3.0,
                horizontal: 8.0,
              ),
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      child: AutoSizeText(
                        value,
                        style: TextStyle(
                          fontSize: 18.0,
                        ),
                      ),
                    ),
                  ),
                  DividerLine(), //DIVIDER LINE
                  Container(
                    padding: EdgeInsets.only(top: 1.0),
                    alignment: Alignment.centerRight,
                    child: Text(
                      label,
                      style: TextStyle(
                        fontSize: 10.0,
                        color: kSecondaryTextColour,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
