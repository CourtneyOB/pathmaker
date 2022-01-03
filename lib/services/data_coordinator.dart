import 'package:flutter/cupertino.dart';
import 'package:pathmaker/model/character.dart';
import 'package:pathmaker/services/message_service.dart';
import 'package:flutter/foundation.dart';
import 'package:pathmaker/widgets/message_box.dart';
import 'package:pathmaker/enum.dart';

class DataCoordinator extends ChangeNotifier {
  Character currentCharacter = Character();
  MessageService messageService = MessageService();
  List<MessageBox> currentMessages = [];
  Ancestry? selectedAncestry;
  int progressTracker = 0;
  double percentageComplete = 0;

  DataCoordinator() {
    currentMessages.add(messageService.messagesLibrary[0]);
    percentageComplete = 1 / messageService.messagesLibrary.length;
  }

  void updateSelections() {
    selectAncestry();
    notifyListeners();
  }

  void selectAncestry() async {
    if (selectedAncestry != null) {
      await currentCharacter.chooseAncestry(selectedAncestry!);
      notifyListeners();
    }
  }

  void nextMessage() {
    if (progressTracker + 1 < messageService.messagesLibrary.length) {
      progressTracker++;
      currentMessages.add(messageService.messagesLibrary[progressTracker]);
      percentageComplete =
          (progressTracker + 1) / messageService.messagesLibrary.length;
      print(percentageComplete);
      notifyListeners();
    }
  }
}
