import 'package:dungeon_world_pc/model/race.dart';

enum CharacterClass {
  bard,
  cleric,
  druid,
  fighter,
  paladin,
  ranger,
  thief,
  wizard;

  @override
  String toString() {
    switch (this) {
      case CharacterClass.bard:
        return "Бард";
      case CharacterClass.cleric:
        return "Клірик";
      case CharacterClass.druid:
        return "Друїд";
      case CharacterClass.fighter:
        return "Воїн";
      case CharacterClass.paladin:
        return "Паладин";
      case CharacterClass.ranger:
        return "Слідопит";
      case CharacterClass.thief:
        return "Злодій";
      case CharacterClass.wizard:
        return "Маг";
    }
  }
}
