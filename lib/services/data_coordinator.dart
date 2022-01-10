import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pathmaker/data/pathfinder_data.dart';
import 'package:pathmaker/model/character.dart';
import 'package:pathmaker/services/message_service.dart';
import 'package:pathmaker/model/ancestry.dart';
import 'package:pathmaker/enum.dart';
import 'package:pathmaker/model/heritage.dart';
import 'package:pathmaker/model/message.dart';

class DataCoordinator extends StateNotifier<DataState> {
  DataCoordinator(DataState state) : super(state);

  void applyAncestry(Ancestry ancestry) {
    state.selectedAncestry = ancestry;
    state.ancestryAvailableBoosts =
        state.currentCharacter.chooseAncestry(state.selectedAncestry!);

    //remove existing boosts, then empty the list
    for (Ability ability in state.selectedFreeBoosts) {
      state.currentCharacter.modifyAbilityScore(ability, -2);
    }
    state.selectedFreeBoosts = [];

    state.availableHeritages = ancestry.heritages;

    state = state.clone();

    //TODO heritage, ancestry feat, languages
  }

  void applyFreeBoosts(List<Ability> abilities) {
    //remove existing boosts
    for (Ability ability in state.selectedFreeBoosts) {
      state.currentCharacter.modifyAbilityScore(ability, -2);
    }

    //set new boosts
    state.selectedFreeBoosts = abilities;
    for (Ability ability in state.selectedFreeBoosts) {
      state.currentCharacter.modifyAbilityScore(ability, 2);
    }

    state.messageIsCompleteStatus[1] = true;
    state = state.clone();
  }

  void applyHeritage(Heritage heritage) {
    state.selectedHeritage = heritage;
    state.currentCharacter.chooseHeritage(state.selectedHeritage!);
    state = state.clone();
  }

  void setAncestryTab(int index) {
    state.ancestryTabSelection = index;
    state = state.clone();
  }

  void setHeritageTab(int index) {
    state.heritageTabSelection = index;
    state = state.clone();
  }

  void nextMessage() {
    state.nextMessage();
    state = state.clone();
  }

  void previousMessage() {
    state.previousMessage();
    state = state.clone();
  }

  void expandMessage(int index) {
    state.currentMessages[index].isExpanded =
        !state.currentMessages[index].isExpanded;
    state = state.clone();
  }
}

class DataState {
  //data
  PathFinderData data = PathFinderData();

  //character creation
  Character currentCharacter = Character();
  Ancestry? selectedAncestry;
  Heritage? selectedHeritage;
  List<Heritage> availableHeritages = [];
  List<Ability> ancestryAvailableBoosts = [];
  List<Ability> selectedFreeBoosts = [];

  //messages
  MessageService messageService = MessageService();
  List<Message> currentMessages = [];
  Map<int, bool> messageIsCompleteStatus = {};

  //tabs
  int ancestryTabSelection = 0;
  int heritageTabSelection = 0;

  //progress
  int progressTracker = 0;
  double percentageComplete = 0;

  DataState() {
    currentMessages.add(messageService.messagesLibrary[0]);
    messageIsCompleteStatus[0] = true;
    percentageComplete = 1 / messageService.messagesLibrary.length;
  }

  void initialiseAncestry() {
    if (selectedAncestry == null) {
      selectedAncestry = data.AncestryLibrary[0];
      ancestryAvailableBoosts =
          currentCharacter.chooseAncestry(selectedAncestry!);
      availableHeritages = selectedAncestry!.heritages;
    }
  }

  //Messages
  void nextMessage() {
    if (progressTracker + 1 < messageService.messagesLibrary.length) {
      progressTracker++;
      currentMessages.last.isExpanded = false;
      currentMessages.add(messageService.messagesLibrary[progressTracker]);
      messageIsCompleteStatus[progressTracker] = false;
      percentageComplete =
          (progressTracker + 1) / messageService.messagesLibrary.length;
    }
  }

  void previousMessage() {
    if (progressTracker - 1 >= 0) {
      progressTracker--;
      currentMessages.removeLast();
      currentMessages.last.isExpanded = true;
      percentageComplete =
          (progressTracker + 1) / messageService.messagesLibrary.length;
    }
  }

  DataState clone() {
    return DataState()
      ..ancestryAvailableBoosts = this.ancestryAvailableBoosts
      ..currentCharacter = this.currentCharacter
      ..currentMessages = this.currentMessages
      ..data = this.data
      ..messageIsCompleteStatus = this.messageIsCompleteStatus
      ..messageService = this.messageService
      ..percentageComplete = this.percentageComplete
      ..progressTracker = this.progressTracker
      ..selectedAncestry = this.selectedAncestry
      ..selectedHeritage = this.selectedHeritage
      ..availableHeritages = this.availableHeritages
      ..selectedFreeBoosts = this.selectedFreeBoosts
      ..ancestryTabSelection = this.ancestryTabSelection
      ..heritageTabSelection = this.heritageTabSelection;
  }
}
