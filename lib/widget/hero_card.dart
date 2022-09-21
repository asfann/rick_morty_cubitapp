
import 'package:flutter/material.dart';

import '../domain/models/character_model/character_model.dart';

class HeroCard extends StatelessWidget {
  const HeroCard({
    Key? key, required this.onTap, required this.character,
  }) : super(key: key);
final Function() onTap;
  final Character character;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 20, left: 24, right: 24),
      child: GestureDetector(
        onTap: onTap,
        child: Card(
          elevation: 8,
          semanticContainer: true,
          clipBehavior: Clip.antiAliasWithSaveLayer,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.network(
                character.image,
                fit: BoxFit.fill,
              ),
               ListTile(
                title: Text(character.name),
                subtitle: Text(character.species),
              )
            ],
          ),
        ),
      ),
    );
  }
}
