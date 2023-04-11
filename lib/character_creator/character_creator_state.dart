part of 'character_creator_bloc.dart';

class CharacterCreatorState extends Equatable {
  final String? characterClass;
  final List<String> suggestedClasses;
  final String? race;
  final List<String> suggestedRaces;

  const CharacterCreatorState({
    this.characterClass,
    required this.suggestedClasses,
    this.race,
    required this.suggestedRaces,
  });

  @override
  List<Object?> get props => [
        characterClass,
        suggestedClasses,
        race,
        suggestedRaces,
      ];

  CharacterCreatorState copyWith({
    String? characterClass,
    List<String>? suggestedClasses,
    String? race,
    List<String>? suggestedRaces,
  }) {
    return CharacterCreatorState(
      characterClass: characterClass ?? this.characterClass,
      suggestedClasses: suggestedClasses ?? this.suggestedClasses,
      race: race ?? this.race,
      suggestedRaces: suggestedRaces ?? this.suggestedRaces,
    );
  }
}
