import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:pathmaker/data/pathfinder_data.dart';
import 'package:pathmaker/model/character.dart';
import 'package:pathmaker/data/message_data.dart';
import 'package:pathmaker/model/ancestry.dart';
import 'package:pathmaker/enum.dart';
import 'package:pathmaker/model/heritage.dart';
import 'package:pathmaker/model/message.dart';
import 'package:pathmaker/model/feat.dart';
import 'package:pathmaker/model/skill_level.dart';

class DataCoordinator extends StateNotifier<DataState> {
  DataCoordinator(DataState state) : super(state);

  //called when switching tabs on message 1
  void applyAncestry(int id) {
    state.selectedAncestry = state.data.getAncestryByID(id);
    state.ancestryAvailableBoosts =
        state.currentCharacter.chooseAncestry(state.selectedAncestry!);

    //remove existing heritage and feat
    state.selectedHeritage = null;
    state.currentCharacter.chooseAncestryFeat(null);
    state.selectedAncestryFeat = null;

    //remove existing boosts, then empty the list
    for (Ability ability in state.selectedFreeBoosts) {
      state.currentCharacter.modifyAbilityScore(ability, -2);
    }
    state.selectedFreeBoosts = [];
    state.messageIsCompleteStatus[1] = false;

    state.availableHeritages = state.selectedAncestry!.heritages;
    state.availableAncestryFeats = state.selectedAncestry!.feats;

    state = state.clone();
  }

  //called by dialog box from message 1 (select additional boosts according to ancestry)
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

  //called by dialog box from message 1 (feat which has free skills)
  void applyFreeSkills(List<Skill> skills) {
    //remove existing
    for (Skill skill in state.selectedFreeSkills) {
      SkillLevel skillLevel = state.currentCharacter.skills
          .firstWhere((item) => item.name == skill);
      skillLevel.trainingContributors -= 1;
      if (skillLevel.trainingContributors < 1) {
        skillLevel.trainSkill(Training.untrained);
      }
    }

    //set new
    state.selectedFreeSkills = skills;
    for (Skill skill in state.selectedFreeSkills) {
      SkillLevel skillLevel = state.currentCharacter.skills
          .firstWhere((item) => item.name == skill);
      skillLevel.trainingContributors += 1;
      skillLevel.trainSkill(Training.trained);
    }
    state = state.clone();
  }

  //called when switching tabs on message 2
  void applyHeritage(int id) {
    state.selectedHeritage =
        state.data.getHeritageByID(state.selectedAncestry!.id, id);
    state.currentCharacter.chooseHeritage(state.selectedHeritage!);
    state = state.clone();
  }

  void applyAncestryFeat(int id) {
    state.selectedAncestryFeat =
        state.data.getFeatByID(state.selectedAncestry!.id, id);
    state.currentCharacter.chooseAncestryFeat(state.selectedAncestryFeat!);
    state = state.clone();

    //TODO implement other parts of ancestry feats
    //TODO Save whether they need to pick an extra feat later
  }

  void buttonFunction(int index) {
    if (index == 0) {
      state.initialiseAncestry();
    } else if (index == 1) {
      state.initialiseHeritage();
    }
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
  Feat? selectedAncestryFeat;
  List<Heritage> availableHeritages = [];
  List<Feat> availableAncestryFeats = [];
  List<Ability> ancestryAvailableBoosts = [];
  List<Ability> selectedFreeBoosts = [];
  List<Skill> selectedFreeSkills = [];

  //messages
  MessageData messageService = MessageData();
  List<Message> currentMessages = [];
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
    if (selectedAncestry == null) {
      selectedAncestry = data.AncestryLibrary[0];
      ancestryAvailableBoosts =
          currentCharacter.chooseAncestry(selectedAncestry!);
      availableHeritages = selectedAncestry!.heritages;
      availableAncestryFeats = selectedAncestry!.feats;
    }
  }

  void initialiseHeritage() {
    if (selectedAncestry != null && selectedHeritage == null) {
      selectedHeritage = availableHeritages[0];
      currentCharacter.chooseHeritage(selectedHeritage!);
      messageIsCompleteStatus[2] = true;
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
      ..availableAncestryFeats = this.availableAncestryFeats
      ..selectedAncestryFeat = this.selectedAncestryFeat
      ..selectedFreeSkills = this.selectedFreeSkills;
  }
}
