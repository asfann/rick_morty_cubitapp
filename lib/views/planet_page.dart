import 'package:flutter/material.dart';
import 'package:rick_morty_cubitapp/base/base_scaffold.dart';
import 'package:rick_morty_cubitapp/views/character_page.dart';
import 'package:rick_morty_cubitapp/widget/back_button.dart';
import 'package:rick_morty_cubitapp/widget/hero_card.dart';

class PlanetPage extends StatelessWidget {
  const PlanetPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        body: Column(
      children: [
        GoBackButton(
          onTap: () {
            Navigator.pop(context);
          },
        ),
        const SizedBox(
          height: 8,
        ),
        const Text(
          'Earth (Replacement Dimension)',
          style: TextStyle(fontSize: 20),
        ),
        Row(
          children: const [
            Expanded(
              child: Padding(
                padding: EdgeInsets.only(left: 24),
                child: ListTile(
                  title: Text(
                    'Type',
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  subtitle: Text(
                    'Planet',
                    style: TextStyle(fontSize: 14),
                  ),
                ),
              ),
            ),
            Expanded(
                child: ListTile(
              title: Text(
                'Dimension',
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              subtitle: Text(
                'Replacement Dimension',
                style: TextStyle(fontSize: 14),
              ),
            ))
          ],
        ),
        const SizedBox(
          height: 152,
        ),
        const Padding(
          padding: EdgeInsets.only(left: 24),
          child: Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Residents",
              style: TextStyle(color: Color(0xFF8E8E93), fontSize: 20),
            ),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        HeroCard(
          onTap: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context) => const CharacterPage()));
          },
        ),
      ],
    ));
  }
}
