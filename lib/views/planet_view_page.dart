import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_cubitapp/domain/planet_cubit/planet_cubit.dart';
import 'package:rick_morty_cubitapp/domain/planets_cubit/planets_cubit.dart';
import 'package:rick_morty_cubitapp/views/planet_page.dart';
import 'package:rick_morty_cubitapp/widget/advanced_button.dart';
import 'package:rick_morty_cubitapp/widget/main_logo.dart';
import 'package:rick_morty_cubitapp/widget/planet_card.dart';
import 'package:rick_morty_cubitapp/widget/search_bar.dart';

import 'base/base_scaffold.dart';

class PlanetView extends StatelessWidget {
  const PlanetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    context.watch<PlanetsCubit>().fetchPlanet();
    return BaseScaffold(body: BlocBuilder<PlanetsCubit, PlanetsState>(
      builder: (context, state) {
        return Column(
          children: [
            const MainLogo(image: "images/rick-and-morty 1.png"),
            const SearchBar(),
            AdvancedButton(onPressed: () {}),
            if (state is PlanetsStateSuccess)
              Expanded(
                  child: ListView.builder(
                      itemCount: state.location.length,
                      itemBuilder: (BuildContext context, int index) {
                        return PlanetCard(location: state.location[index],onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  PlanetPage(id: state.location[index].id,)));
                        });
                      })),
            if (state is PlanetsStateFailure) Text(state.exception.message),
            if (state is PlanetsStateLoading) Container(),
          ],
        );
      },
    ));
  }
}
