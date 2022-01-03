import 'package:flutter/cupertino.dart';
import 'package:pathmaker/model/character.dart';
import 'package:pathmaker/services/message_service.dart';
import 'package:flutter/foundation.dart';
import 'package:pathmaker/widgets/message_box.dart';
import 'package:pathmaker/enum.dart';

class DataCoordinator extends ChangeNotifier {
  //character creation
  Character currentCharacter = Character();
  Ancestry? selectedAncestry;

  //messages
  MessageService messageService = MessageService();
  List<MessageBox> currentMessages = [];
  Map<int, bool> messageIsCompleteStatus = {};

  //progress
  int progressTracker = 0;
  double percentageComplete = 0;

  DataCoordinator() {
    currentMessages.add(messageService.messagesLibrary[0]);
    messageIsCompleteStatus[0] = true;
    percentageComplete = 1 / messageService.messagesLibrary.length;
  }

  void updateSelections() {
    selectAncestry();
    notifyListeners();
  }

  void selectAncestry() async {
    if (selectedAncestry != null) {
      await currentCharacter.chooseAncestry(selectedAncestry!);
      messageIsCompleteStatus[1] = true;
      notifyListeners();
    }
  }

  void nextMessage() {
    if (progressTracker + 1 < messageService.messagesLibrary.length) {
      progressTracker++;
      currentMessages.add(messageService.messagesLibrary[progressTracker]);
      messageIsCompleteStatus[progressTracker] = false;
      percentageComplete =
          (progressTracker + 1) / messageService.messagesLibrary.length;
      notifyListeners();
    }
  }
}
