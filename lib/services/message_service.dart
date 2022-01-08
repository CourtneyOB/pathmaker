import 'package:flutter/material.dart';
import 'package:pathmaker/widgets/heritage_tabs.dart';
import 'package:pathmaker/widgets/message_box.dart';
import 'package:pathmaker/widgets/ancestry_tabs.dart';

class MessageService {
  List<MessageBox> messagesLibrary = [
    MessageBox(
      id: 0,
      contents: Text(
          'Welcome to KikiRPG: Pathfinder 2e Character Builder. To begin, press next.'),
    ),
    MessageBox(
      id: 1,
      contents: Column(
        children: [
          Text('Choose an ancestry'),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            child: AncestryTabs(),
          ),
        ],
      ),
    ),
    MessageBox(
      id: 2,
      contents: Column(
        children: [
          Text('Ancestry continued...'),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            child: HeritageTabs(),
          ),
        ],
      ),
    )
  ];
}
