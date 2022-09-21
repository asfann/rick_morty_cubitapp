import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_cubitapp/views/character_page.dart';
import 'package:rick_morty_cubitapp/widget/advanced_button.dart';
import 'package:rick_morty_cubitapp/widget/hero_card.dart';
import 'package:rick_morty_cubitapp/widget/main_logo.dart';
import 'package:rick_morty_cubitapp/widget/search_bar.dart';

import '../domain/character_cubit/characters_cubit.dart';
import 'base/base_scaffold.dart';

class CharactersView extends StatelessWidget {
  const CharactersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.watch<CharactersCubit>().fetchCharacters();
    return BaseScaffold(body: BlocBuilder<CharactersCubit, CharactersState>(
      builder: (context, state) {
          return Column(
            children: [
              const MainLogo(
                image: 'images/PngItem_4380512.png',
              ),
              const SearchBar(),
              AdvancedButton(
                onPressed: () {
                  openDialog(context);
                },
              ),
              if (state is CharactersStateSuccess)
                Expanded(
                  child: ListView.builder(
                    itemCount: state.characters.length,
                    itemBuilder: (BuildContext context, int index) {
                      return HeroCard(character: state.characters[index], onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>  CharacterPage(id: state.characters[index].id,)));
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

  Future openDialog(BuildContext context) => showDialog(
      context: context,
      builder: (context) => Column(
            children: [
              AlertDialog(
                title: Text(
                  "Filters",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
              ),
            ],
          ));
}
