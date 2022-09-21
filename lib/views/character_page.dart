import 'package:flutter/material.dart';
import 'package:rick_morty_cubitapp/widget/back_button.dart';
import 'package:rick_morty_cubitapp/widget/info_card.dart';

import 'base/base_scaffold.dart';

class CharacterPage extends StatelessWidget {
  const CharacterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        body: Column(
      children:  [
         GoBackButton(onTap: () {
           Navigator.pop(context);
         },),
        const SizedBox(
          height: 17,
        ),
        const CircleAvatar(
          backgroundImage: AssetImage(
            'images/_image_.png',
          ),
          radius: 100,
        ),
        const SizedBox(
          height: 16,
        ),
        const Text(
          "Rick Sanchez",
          style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
        ),
        const SizedBox(
          height: 32,
        ),
        const Padding(
          padding:  EdgeInsets.only(left: 24),
          child:  Align(
            alignment: Alignment.centerLeft,
            child: Text(
              "Informations",
              style: TextStyle(color: Color(0xFF8E8E93), fontSize: 20),
            ),
          ),
        ),
        const  InfoCard(),
        const  InfoCard(),
        const  InfoCard(),
        const  InfoCard(),
        const InfoCard(),
      ],
    ));
  }
}
