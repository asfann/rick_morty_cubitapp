import 'package:flutter/material.dart';
import 'package:rick_morty_cubitapp/views/character_page.dart';
import 'package:rick_morty_cubitapp/views/planet_page.dart';

import 'base/base_scaffold.dart';

class MenuView extends StatelessWidget {
  const MenuView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        body: Center(
      child: Column(
        children:  [
          const SizedBox(height: 48),
          GestureDetector(
            onTap:  () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const CharacterPage()));
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
                  builder: (context) => const PlanetPage()));
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
