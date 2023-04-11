import 'package:collection/collection.dart';
import 'package:dungeon_world_pc/model/character_class.dart';
import 'package:dungeon_world_pc/model/race.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'character_creator_event.dart';

part 'character_creator_state.dart';

class CharacterCreatorBloc
    extends Bloc<CharacterCreatorEvent, CharacterCreatorState> {
  CharacterCreatorBloc()
      : super(CharacterCreatorState(
          suggestedClasses:
              CharacterClass.values.map((e) => e.toString()).toList(),
          suggestedRaces: Race.values.map((e) => e.toString()).toList(),
        )) {
    on<CharacterClassSelected>((event, emit) {
      emit(state.copyWith(
        characterClass: event.characterClass,
        suggestedRaces: _getRacesForClass(event.characterClass)
            .map((e) => e.toString())
            .toList(),
      ));
    });
    on<RaceSelected>((event, emit) {
      emit(state.copyWith(race: event.race));
    });
  }

  List<Race> _getRacesForClass(String? characterClass) {
    if (characterClass == null) return [];
    final existingClass = CharacterClass.values
        .firstWhereOrNull((element) => element.toString() == characterClass);
    switch (existingClass) {
      case CharacterClass.bard:
        return [Race.elf, Race.human];
      case CharacterClass.cleric:
        return [Race.dwarf, Race.human];
      case CharacterClass.druid:
        return [Race.elf, Race.human, Race.halfling];
      case CharacterClass.fighter:
        return [Race.dwarf, Race.elf, Race.halfling, Race.human];
      case CharacterClass.paladin:
        return [Race.human];
      case CharacterClass.ranger:
        return [Race.elf, Race.human];
      case CharacterClass.thief:
        return [Race.halfling, Race.human];
      case CharacterClass.wizard:
        return [Race.elf, Race.human];
      default:
        return Race.values;
    }
  }
}
