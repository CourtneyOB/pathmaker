import 'package:flutter/material.dart';
import 'package:pathmaker/widgets/heritage_tabs.dart';
import 'package:pathmaker/widgets/message_box.dart';
import 'package:pathmaker/widgets/ancestry_tabs.dart';
import 'package:pathmaker/model/message.dart';

class MessageData {
  List<Message> messagesLibrary = [
    Message(
      headerValue: 'Welcome',
      expandedValue: MessageBox(
        id: 0,
        contents: Align(
          alignment: Alignment.centerLeft,
          child: Padding(
            padding: const EdgeInsets.only(left: 5.0, bottom: 8.0),
            child: Text(
                'Welcome to KikiRPG: Pathfinder 2e Character Builder. To begin, press next.'),
          ),
        ),
      ),
    ),
    Message(
        headerValue: 'Ancestry',
        expandedValue: MessageBox(
          id: 1,
          contents: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text('Choose an ancestry'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: AncestryTabs(),
              ),
            ],
          ),
        )),
    Message(
        headerValue: 'Heritage',
        expandedValue: MessageBox(
          id: 2,
          contents: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Text('Choose a heritage'),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: HeritageTabs(),
              ),
            ],
          ),
        )),
    Message(
        headerValue: 'Next step',
        expandedValue: MessageBox(
          id: 3,
          contents: Column(
            children: [
              Padding(
                padding: const EdgeInsets.only(left: 5.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('This is the next step')),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5.0, bottom: 10.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text('Details here')),
              ),
            ],
          ),
        )),
  ];
}
