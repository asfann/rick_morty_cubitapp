import 'package:flutter/material.dart';
import 'package:rick_morty_cubitapp/views/character_page.dart';
import 'package:rick_morty_cubitapp/views/characters_view_page.dart';
import 'package:rick_morty_cubitapp/views/planet_page.dart';
import 'package:rick_morty_cubitapp/views/planet_view_page.dart';

import 'base/base_scaffold.dart';

class MenuView extends StatelessWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      iconBool: true,
        close: true,
        body: Center(
      child: Column(
        children:  [
          const SizedBox(height: 48),
          GestureDetector(
            onTap:  () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) =>   CharactersView()));
            },
            child:const  Text(
              "Characters",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          ),
          const SizedBox(height: 48),
          GestureDetector(
            onTap:  () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const PlanetView()));
            },
            child: const Text(
              "Locations",
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
            ),
          )
        ],
      ),
    ),
    );
  }
}
