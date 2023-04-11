part of 'character_creator_bloc.dart';

abstract class CharacterCreatorEvent extends Equatable {
  const CharacterCreatorEvent();
}

class CharacterClassSelected extends CharacterCreatorEvent {
  final String characterClass;

  const CharacterClassSelected({required this.characterClass});

  @override
  List<Object?> get props => [characterClass];
}

class RaceSelected extends CharacterCreatorEvent {
  final String race;

  const RaceSelected({required this.race});

  @override
  List<Object?> get props => [race];
}
