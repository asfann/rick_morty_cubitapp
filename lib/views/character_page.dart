import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_cubitapp/data/characters_repo.dart';
import 'package:rick_morty_cubitapp/widget/back_button.dart';
import 'package:rick_morty_cubitapp/widget/info_card.dart';

import '../domain/characters_cubit/character_cubit.dart';
import 'base/base_scaffold.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CharacterCubit()..fetchCharacterById(id),
      child: BaseScaffold(body: BlocBuilder<CharacterCubit, CharacterState>(
        builder: (context, state) {
          if (state is CharacterStateSuccess) {
            return SingleChildScrollView(
              child: Column(
                children: [
                  GoBackButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    height: 17,
                  ),
                  CircleAvatar(
                    backgroundImage: NetworkImage(
                      state.character.image,
                    ),
                    radius: 100,
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  Text(
                    state.character.name,
                    style: const TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 32,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Informations",
                        style:
                            TextStyle(color: Color(0xFF8E8E93), fontSize: 20),
                      ),
                    ),
                  ),
                  InfoCard(
                    title: "Gender",
                    name: state.character.gender,
                  ),
                  InfoCard(
                    title: "Status",
                    name: state.character.status,
                  ),
                  InfoCard(
                    title: "Specie",
                    name: state.character.species,
                  ),
                  InfoCard(
                      title: "Origin",
                      name: state.character.origin?.name ?? ''),
                  InfoCard(
                    title: "Type",
                    name: state.character.type ?? 'Unknown',
                  ),
                  InfoCard(
                    title: "Location",
                    name: state.character.location?.name ?? '',
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 24, top: 52),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Episodes",
                        style:
                            TextStyle(color: Color(0xFF8E8E93), fontSize: 20),
                      ),
                    ),
                  ),
                  // Expanded(
                  //   child: ListView.builder(
                  //     itemCount: state.character.episode.length,
                  //     itemBuilder: (BuildContext context, int index) {
                  //       return InfoEpisode(
                  //           title: state.character.episode.first,
                  //           name: state.character.episode.single,
                  //           leading: state.character.episode.last);
                  //     },
                  //   ),
                  // ),
                ],
              ),
            );
          } else if (state is CharacterStateFailure) {
            return Text(state.exception.message);
          } else if (state is CharacterStateLoading) {
            return Container();
          } else {
            return Container();
          }
        },
      )),
    );
  }
}
