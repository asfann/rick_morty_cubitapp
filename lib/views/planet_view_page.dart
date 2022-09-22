import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_typeahead/flutter_typeahead.dart';
import 'package:rick_morty_cubitapp/domain/models/location/location_model.dart';
import 'package:rick_morty_cubitapp/domain/planets_cubit/planets_cubit.dart';
import 'package:rick_morty_cubitapp/views/planet_page.dart';
import 'package:rick_morty_cubitapp/widget/advanced_button.dart';
import 'package:rick_morty_cubitapp/widget/main_logo.dart';
import 'package:rick_morty_cubitapp/widget/planet_card.dart';

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
                      filled: true,
                      fillColor: Colors.white,
                      hintText: "Filter by name...",
                      suffixIcon:const Icon(Icons.search,
                      ),
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
                        builder: (context) => const FilterWidget()))
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
            if (state is PlanetsStateFailure) Text(state.exception.message),
            if (state is PlanetsStateLoading) Container(),
          ],
        );
      },
    ));
  }
}



class FilterWidget extends StatefulWidget {
  const FilterWidget({Key? key}) : super(key: key);

  @override
  State<FilterWidget> createState() => _FilterWidgetState();
}

class _FilterWidgetState extends State<FilterWidget> {
  String dropdownType = 'Type';
  String dropdownDimension = 'Dimension';

  var typeItems = ['Type', 'Planet', 'Resort'];
  var dimensionItems = ['Dimension', 'Dimension C-137', 'unknown', 'Replacement Dimension', 'Dimension 5-126'];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black.withOpacity(0.5),
      body: Center(
        child: Container(
          height: 330,
          width: 300,
          decoration: BoxDecoration(
              color: Colors.white, borderRadius: BorderRadius.circular(10)),
          child: Column(
            children: [
              Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                const Text(
                  'Filters',
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20),
                ),
                Padding(
                    padding: const EdgeInsets.only(left: 150),
                    child: IconButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        icon: const Icon(Icons.close)))
              ]),
              DropdownButton(
                value: dropdownType,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: typeItems.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: SizedBox(width: 200, child: Text(items)),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownType = newValue!;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              DropdownButton(
                value: dropdownDimension,
                icon: const Icon(Icons.keyboard_arrow_down),
                items: dimensionItems.map((String items) {
                  return DropdownMenuItem(
                    value: items,
                    child: SizedBox(width: 200, child: Text(items)),
                  );
                }).toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    dropdownDimension = newValue!;
                  });
                },
              ),
              const SizedBox(
                height: 20,
              ),
              AdvancedButton(
                  text: 'APPLY',
                  onPressed: () {
                    Map<String, dynamic> popResults = {};
                    if (dropdownType != 'Type') {
                      popResults['type'] = dropdownType;
                    }
                    if (dropdownDimension != 'Dimension') {
                      popResults['dimension'] = dropdownDimension;
                    }
                    Navigator.pop(context, popResults);
                  })
            ],
          ),
        ),
      ),
    );
  }
}

