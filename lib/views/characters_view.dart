import 'package:flutter/material.dart';
import 'package:rick_morty_cubitapp/views/character_page.dart';
import 'package:rick_morty_cubitapp/widget/advanced_button.dart';
import 'package:rick_morty_cubitapp/widget/hero_card.dart';
import 'package:rick_morty_cubitapp/widget/main_logo.dart';
import 'package:rick_morty_cubitapp/widget/search_bar.dart';
import '../base/base_scaffold.dart';

class CharactersView extends StatelessWidget {
  const CharactersView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        body: Column(
          children: [
            const MainLogo(image: 'images/PngItem_4380512.png',),
            const SearchBar(),
            AdvancedButton(onPressed: () {
              openDialog(context);
            },),
            HeroCard(onTap: () {
              Navigator.push(context, MaterialPageRoute(
                  builder: (context) => const CharacterPage()));
            })
          ],
        )
    );

  }

  Future openDialog(BuildContext context) => showDialog(context: context, builder: (context) => Column(
    children: [
      AlertDialog(
        title: Text("Filters",
          style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 20
          ),),
      ),
    ],
  ));
}

