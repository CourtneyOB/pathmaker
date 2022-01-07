import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pathmaker/data/pathfinder_data.dart';
import 'package:pathmaker/model/character.dart';
import 'package:pathmaker/services/message_service.dart';
import 'package:pathmaker/widgets/message_box.dart';
import 'package:pathmaker/model/ancestry.dart';
import 'package:pathmaker/enum.dart';

class DataCoordinator extends StateNotifier<DataState> {
  DataCoordinator(DataState state) : super(state);

  void applyAncestry(Ancestry ancestry) {
    state.selectedAncestry = ancestry;
    state.ancestryAvailableBoosts =
        state.currentCharacter.chooseAncestry(state.selectedAncestry);

    //remove existing boosts, then empty the list
    for (Ability ability in state.selectedFreeBoosts) {
      state.currentCharacter.modifyAbilityScore(ability, -2);
    }
    state.selectedFreeBoosts = [];

    state = state.clone();
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

  void nextMessage() {
    state.nextMessage();
    state = state.clone();
  }
}

class DataState {
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
  List<Ability> selectedFreeBoosts = [];

  //messages
  MessageService messageService = MessageService();
  List<MessageBox> currentMessages = [];
  Map<int, bool> messageIsCompleteStatus = {};

  //progress
  int progressTracker = 0;
  double percentageComplete = 0;

  DataState() {
    currentMessages.add(messageService.messagesLibrary[0]);
    messageIsCompleteStatus[0] = true;
    percentageComplete = 1 / messageService.messagesLibrary.length;
  }

  void initialiseAncestry() {
    ancestryAvailableBoosts = currentCharacter.chooseAncestry(selectedAncestry);
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
      ..selectedFreeBoosts = this.selectedFreeBoosts;
  }
}
