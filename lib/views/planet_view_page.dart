import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:rick_morty_cubitapp/domain/models/location/location_model.dart';
import 'package:rick_morty_cubitapp/domain/planets_cubit/planets_cubit.dart';
import 'package:rick_morty_cubitapp/views/planet_page.dart';
import 'package:rick_morty_cubitapp/widget/advanced_button.dart';
import 'package:rick_morty_cubitapp/widget/main_logo.dart';
import 'package:rick_morty_cubitapp/widget/planet_card.dart';

import '../widget/planet_filter.dart';
import 'base/base_scaffold.dart';
import 'base/transparent_route.dart';

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
            TypeAheadField(
                keepSuggestionsOnLoading: false,
                textFieldConfiguration: TextFieldConfiguration(
                  autocorrect: false,
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search,
        ),
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
                  return (state is PlanetsStateSuccess)
                      ? state.location.where((go) =>
                      go.name.toLowerCase().contains(pattern.toLowerCase()))
                      : <Location>[];
                },
                itemBuilder: (context, Location? suggestion) {
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
                onSuggestionSelected: (Location? suggestion) {
                  final location = suggestion!;
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => PlanetPage(
                            id: location.id!,
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
                        builder: (context) => const PlanetFilter()))
                    .then((value) {
                  if (value is Map<String, dynamic>) {
                    // BlocProvider.of<CharactersCubit>(context).fetchCharactersWithFilter(page: 1, params: value);
                    context
                        .read<PlanetsCubit>()
                        .fetchPlanetsWithFilter(page: 1, params: value);
                  }
                });
              },
            ),
            if (state is PlanetsStateSuccess)
              Expanded(
                  child: ListView.builder(
                      itemCount: state.location.length,
                      itemBuilder: (BuildContext context, int index) {
                        return PlanetCard(location: state.location[index],onTap: () {
                          if(state.location[index].id!=null){
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) =>  PlanetPage(id: state.location[index].id!,)
                              )
                          );}
                        });
                      })),
            AdvancedButton(onPressed: () {

            }, text: "Load More", show: true,),
            if (state is PlanetsStateFailure) Text(state.exception.message),
            if (state is PlanetsStateLoading) Container(),
          ],
        );
      },
    ));
  }
}


