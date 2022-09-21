import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_cubitapp/domain/planet_cubit/planet_cubit.dart';
import 'package:rick_morty_cubitapp/widget/back_button.dart';
import 'package:rick_morty_cubitapp/widget/hero_card.dart';

import 'base/base_scaffold.dart';

class PlanetPage extends StatelessWidget {
  const PlanetPage({Key? key, required this.id}) : super(key: key);
  final int id;

  @override
  Widget build(BuildContext context) {
    return BlocProvider(

      create: (context) => PlanetCubit()..fetchPlanetById(id),
      child: BaseScaffold(
          body: BlocBuilder<PlanetCubit, PlanetState>(
            builder: (context, state) {
              return Column(
                children: [
                  GoBackButton(
                    onTap: () {
                      Navigator.pop(context);
                    },
                  ),
                  const SizedBox(
                    height: 8,
                  ),

                  if (state is PlanetStateSuccess)
                    Text(
                      state.location.name,
                      style: TextStyle(fontSize: 20),
                    ),

                  if (state is PlanetStateSuccess)
                    Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.only(left: 24),
                            child: ListTile(
                              title: const Text(
                                'Type',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                state.location.type,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                            child: ListTile(
                              title: const Text(
                                'Dimension',
                                style: TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.bold),
                              ),
                              subtitle: Text(
                                state.location.dimension,
                                style: const TextStyle(fontSize: 14),
                              ),
                            ))
                      ],
                    ),
                  if (state is PlanetStateFailure) Text(
                      state.exception.message),
                  if (state is PlanetStateLoading) Container(),

                  const SizedBox(
                    height: 152,
                  ),
                  const Padding(
                    padding: EdgeInsets.only(left: 24),
                    child: Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Residents",
                        style: TextStyle(
                            color: Color(0xFF8E8E93), fontSize: 20),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 12,
                  ),
                  /*HeroCard(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CharacterPage()));
          },
        ),*/
                ],
              );
            },
          )),
    );
  }
}
