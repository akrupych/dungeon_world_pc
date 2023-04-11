import 'package:dungeon_world_pc/character_creator/character_creator_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CharacterCreatorPage extends StatelessWidget {
  const CharacterCreatorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharacterCreatorBloc(),
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Створення персонажа"),
        ),
        body: BlocBuilder<CharacterCreatorBloc, CharacterCreatorState>(
          builder: (context, state) {
            final bloc = context.read<CharacterCreatorBloc>();
            return ListView(
              padding: const EdgeInsets.all(16),
              children: [
                buildSelection(
                  hint: "Клас",
                  initialValue: state.characterClass ?? "",
                  values: state.suggestedClasses,
                  onSelected: (value) {
                    bloc.add(CharacterClassSelected(characterClass: value));
                  },
                ),
                buildSelection(
                  hint: "Раса",
                  initialValue: state.race ?? "",
                  values: state.suggestedRaces,
                  onSelected: (value) {
                    bloc.add(RaceSelected(race: value));
                  },
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  Widget buildSelection({
    required String hint,
    required String initialValue,
    required List<String> values,
    required Function(String) onSelected,
  }) {
    return Autocomplete<String>(
      initialValue: TextEditingValue(text: initialValue),
      fieldViewBuilder: (BuildContext context,
          TextEditingController textEditingController,
          FocusNode focusNode,
          VoidCallback onFieldSubmitted) {
        return TextFormField(
          controller: textEditingController,
          decoration: InputDecoration(hintText: hint),
          focusNode: focusNode,
          onFieldSubmitted: (value) => onFieldSubmitted(),
        );
      },
      optionsBuilder: (value) {
        return value.text.isEmpty ? values : [value.text, ...values];
      },
      onSelected: onSelected,
    );
  }
}
