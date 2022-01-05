import 'package:flutter/cupertino.dart';
import 'package:pathmaker/data/pathfinder_data.dart';
import 'package:pathmaker/model/character.dart';
import 'package:pathmaker/services/message_service.dart';
import 'package:flutter/foundation.dart';
import 'package:pathmaker/widgets/message_box.dart';
import 'package:pathmaker/model/ancestry.dart';
import 'package:pathmaker/enum.dart';

class DataCoordinator extends ChangeNotifier {
  //data
  PathFinderData data = PathFinderData();

  //character creation
  Character currentCharacter = Character();
  Ancestry selectedAncestry = Ancestry(
      name: 'Dwarf',
      description:
          'Dwarves are a short, stocky people who are often stubborn, fierce, and devoted.',
      freeBoosts: 1,
      boosts: [Ability.con, Ability.wis],
      flaws: [Ability.cha]);
  List<String> abilityOptions = [
    'Dexterity',
    'Intelligence',
    'Strength',
    'Constitution',
    'Wisdom',
    'Charisma'
  ];

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

  void selectAncestry() {
    currentCharacter.chooseAncestry(selectedAncestry);
    messageIsCompleteStatus[1] = true;
    notifyListeners();
  }

  //Messages

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
