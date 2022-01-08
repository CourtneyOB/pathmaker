import 'package:flutter/material.dart';
import 'package:pathmaker/widgets/multiselect.dart';
import 'package:pathmaker/constants.dart';

class TabDetail extends StatelessWidget {
  final String text;
  final String boosts;
  final String flaws;
  final int optionalBoosts;

  TabDetail(
      {required this.text,
      required this.boosts,
      required this.flaws,
      required this.optionalBoosts});

  List<Widget> getContent() {
    List<Widget> content = [
      Text('$text \n'),
      Text(
        'Ability Boosts:',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Text('$boosts \n'),
      Text(
        'Ability Flaws:',
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      Text(flaws)
    ];
    if (optionalBoosts > 0) {
      String text = '';
      if (optionalBoosts == 1) {
        text = '\nChoose a free ability boost:';
      } else if (optionalBoosts > 1) {
        text = '\nChoose $optionalBoosts free ability boosts:';
      }
      content.add(Text(
        text,
        style: TextStyle(fontWeight: FontWeight.bold),
      ));
    }

    content.add(MultiSelect(
      maxSelection: optionalBoosts,
    ));

    return content;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        border: Border.all(color: kDividerColour),
      ),
      child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: getContent(),
        ),
      ),
    );
  }
}