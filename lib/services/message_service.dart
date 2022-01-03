import 'package:flutter/material.dart';
import 'package:pathmaker/widgets/message_box.dart';
import 'package:pathmaker/widgets/tabs.dart';

class MessageService extends ChangeNotifier {
  int progressTracker = 0;
  List<MessageBox> currentMessages = [];

  MessageService() {
    resetMessages();
  }

  List<MessageBox> messagesLibrary = [
    MessageBox(
      contents: Text(
          'Welcome to KikiRPG: Pathfinder 2e Character Builder. To begin, press next.'),
    ),
    MessageBox(
      contents: Column(
        children: [
          Text('Choose a class'),
          Padding(
            padding:
                const EdgeInsets.symmetric(vertical: 10.0, horizontal: 30.0),
            child: Tabs(),
          ),
        ],
      ),
    ),
    MessageBox(
      contents: Text('This is the next step'),
    )
  ];

  void resetMessages() {
    currentMessages = [
      messagesLibrary[0],
    ];
  }

  void nextMessage() {
    progressTracker++;
    currentMessages.add(messagesLibrary[progressTracker]);
    notifyListeners();
  }
}
