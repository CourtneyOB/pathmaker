import 'package:flutter/foundation.dart';
import 'package:pathmaker/constants.dart';
import 'package:pathmaker/enum.dart';
import 'package:pathmaker/services/json_reader.dart';

class Character extends ChangeNotifier {
  String _name = "Hacks";

  String get name => _name;

  set name(String value) {
    _name = value;
  }

  //Ability scores
  int _str;
  int _dex;
  int _cha;
  int _wis;
  int _con;
  int _intl;

  String get str => _str.toString();

  String get dex => _dex.toString();

  String get cha => _cha.toString();

  String get wis => _wis.toString();

  String get con => _con.toString();

  String get intl => _intl.toString();

  //Background
  Ancestry? _ancestry;

  Character()
      : _str = 10,
        _dex = 10,
        _cha = 10,
        _wis = 10,
        _con = 10,
        _intl = 10;

  Future<void> chooseAncestry(Ancestry newAncestry) async {
    Map<String, dynamic> data = await MyJsonReader.loadJson(kAncestryJson);

    //if ancestry already applied, remove the ability modifiers before applying new ones
    if (_ancestry != null) {
      if (_ancestry == newAncestry) {
        return;
      }
      List<dynamic> removeBoosts =
          data[_ancestry!.stringValue()]['abilityBoosts'];
      for (String boost in removeBoosts) {
        modifyAbilityScore(boost, -2);
      }
      List<dynamic> removeFlaws =
          data[_ancestry!.stringValue()]['abilityFlaws'];
      for (String flaw in removeFlaws) {
        modifyAbilityScore(flaw, 2);
      }
    }

    List<dynamic> boosts = data[newAncestry.stringValue()]['abilityBoosts'];
    for (String boost in boosts) {
      modifyAbilityScore(boost, 2);
    }

    List<dynamic> flaws = data[newAncestry.stringValue()]['abilityFlaws'];
    for (String flaw in flaws) {
      modifyAbilityScore(flaw, -2);
    }

    _ancestry = newAncestry;
  }

  void modifyAbilityScore(String name, int modifier) {
    if (name == 'con') {
      _con += modifier;
    }
    if (name == 'dex') {
      _dex += modifier;
    }
    if (name == 'int') {
      _intl += modifier;
    }
    if (name == 'wis') {
      _wis += modifier;
    }
    if (name == 'str') {
      _str += modifier;
    }
    if (name == 'cha') {
      _cha += modifier;
    }
  }
}
