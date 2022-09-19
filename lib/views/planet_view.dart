import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:rick_morty_cubitapp/base/base_scaffold.dart';
import 'package:rick_morty_cubitapp/widget/advanced_button.dart';
import 'package:rick_morty_cubitapp/widget/main_logo.dart';
import 'package:rick_morty_cubitapp/widget/planet_card.dart';
import 'package:rick_morty_cubitapp/widget/search_bar.dart';

class PlanetView extends StatelessWidget {
  const PlanetView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        body: Column(
      children: [
        const MainLogo(image: "images/rick-and-morty 1.png"),
        const SearchBar(),
        AdvancedButton(onPressed:() {} ),
        const PlanetCard()
      ],
    ));
  }
}
