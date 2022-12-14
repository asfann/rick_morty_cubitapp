import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:rick_morty_cubitapp/views/base/transparent_route.dart';
import 'package:rick_morty_cubitapp/views/character_page.dart';
import 'package:rick_morty_cubitapp/widget/advanced_button.dart';
import 'package:rick_morty_cubitapp/widget/hero_card.dart';
import 'package:rick_morty_cubitapp/widget/main_logo.dart';
import '../domain/character_cubit/characters_cubit.dart';
import '../domain/models/character_model/character_model.dart';
import '../widget/character_filter.dart';
import 'base/base_scaffold.dart';

class CharactersView extends StatefulWidget {
  const CharactersView({Key? key}) : super(key: key);

  @override
  State<CharactersView> createState() => _CharactersViewState();
}

class _CharactersViewState extends State<CharactersView> {
  @override
  Widget build(BuildContext context) {
    // context.watch<CharactersCubit>().fetchCharacters(page: 1);
    return BaseScaffold(body: BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
        return Column(
          children: [
            const MainLogo(
              image: 'images/PngItem_4380512.png',
            ),
            TypeAheadField(
                keepSuggestionsOnLoading: false,
                textFieldConfiguration: TextFieldConfiguration(
                  autocorrect: false,
                  decoration: InputDecoration(
                    prefixIcon:const Icon(Icons.search),
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Filter by name...",
                      contentPadding:
                          const EdgeInsets.only(left: 20, bottom: 5, top: 12.5),
                      focusedBorder: OutlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10)),
                      enabledBorder: UnderlineInputBorder(
                          borderSide: const BorderSide(color: Colors.white),
                          borderRadius: BorderRadius.circular(10))),
                ),
                suggestionsBoxDecoration: SuggestionsBoxDecoration(
                    elevation: 20, borderRadius: BorderRadius.circular(10)),
                suggestionsCallback: (pattern) {
                  return (state is CharactersStateSuccess)
                      ? state.characters.where((go) =>
                          go.name.toLowerCase().contains(pattern.toLowerCase()))
                      : <Character>[];
                },
                itemBuilder: (context, Character? suggestion) {
                  final org = suggestion!;
                  return ListTile(
                    dense: true,
                    title: Text(
                      org.name,

                    ),
                  );
                },
                noItemsFoundBuilder: (context) => const SizedBox(
                      child:  Padding(
                        padding:  EdgeInsets.all(8.0),
                        child: Text(
                          "Not exist",
                        ),
                      ),
                    ),
                onSuggestionSelected: (Character? suggestion) {
                final character = suggestion!;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CharacterPage(
                            id: character.id,
                          )
                      )
                  );
                }),
            AdvancedButton(
              text: 'ADVANCED FILTER',
              onPressed: () {
                Navigator.push(
                        context,
                        TransparentRoute(
                            builder: (context) => const CharacterFilter()))
                    .then((value) {
                  if (value is Map<String, dynamic>) {
                    // BlocProvider.of<CharactersCubit>(context).fetchCharactersWithFilter(page: 1, params: value);
                    context
                        .read<CharactersCubit>()
                        .fetchCharactersWithFilter(page: 1, params: value);
                  }
                });
              },
            ),
            if (state is CharactersStateSuccess)
              Expanded(
                child: ListView.builder(
                  itemCount: state.characters.length,
                  itemBuilder: (BuildContext context, int index) {
                    return HeroCard(
                        character: state.characters[index],
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => CharacterPage(
                                        id: state.characters[index].id,
                                      )
                              )
                          );
                        });
                  },
                ),
              ),
            if (state is CharactersStateFailure) Text(state.exception.message),
            if (state is CharactersStateLoading) Container(),
          ],
        );
      },
    ));
  }
}
