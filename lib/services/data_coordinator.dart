import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pathmaker/data/pathfinder_data.dart';
import 'package:pathmaker/model/character.dart';
import 'package:pathmaker/services/message_service.dart';
import 'package:flutter/foundation.dart';
import 'package:pathmaker/widgets/message_box.dart';
import 'package:pathmaker/model/ancestry.dart';
import 'package:pathmaker/enum.dart';

class DataCoordinatorNotifier extends StateNotifier<DataCoordinator> {
  DataCoordinatorNotifier(DataCoordinator state) : super(state);

  void testFunction() {
    DataCoordinator coordinator = state;
    coordinator.nextMessage();
    state = coordinator;
  }
}

class DataCoordinator {
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
  List<Ability> ancestryAvailableBoosts = [];
  List<Ability?> selectedFreeBoosts = [null, null];

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
  }

  void selectAncestry() {
    ancestryAvailableBoosts = currentCharacter.chooseAncestry(selectedAncestry);
    messageIsCompleteStatus[1] = true;
  }

  List<Ability> updateFreeBoostList() {
    List<Ability> freeBoosts = [];
    for (Ability ability in ancestryAvailableBoosts) {
      if (!selectedFreeBoosts.contains(ability)) {
        freeBoosts.add(ability);
      }
    }
    return freeBoosts;
  }

  void addSelection(int i, Ability ability) {
    print('function');
  }

  //Messages
  void nextMessage() {
    if (progressTracker + 1 < messageService.messagesLibrary.length) {
      progressTracker++;
      currentMessages.add(messageService.messagesLibrary[progressTracker]);
      messageIsCompleteStatus[progressTracker] = false;
      percentageComplete =
          (progressTracker + 1) / messageService.messagesLibrary.length;
    }
  }
}
