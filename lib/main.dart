import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:rick_morty_cubitapp/domain/character_cubit/characters_cubit.dart';
import 'package:rick_morty_cubitapp/domain/planets_cubit/planets_cubit.dart';
import 'package:rick_morty_cubitapp/views/character_page.dart';
import 'package:rick_morty_cubitapp/views/characters_view_page.dart';
import 'package:rick_morty_cubitapp/views/menu_view_page.dart';
import 'package:rick_morty_cubitapp/views/planet_page.dart';
import 'package:rick_morty_cubitapp/views/planet_view_page.dart';

import 'domain/characters_cubit/character_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      BlocProvider(create: (context) => CharactersCubit(),
      ),
        BlocProvider(create: (context) => PlanetsCubit(),
        ),
    ],
      child:const MaterialApp(
          debugShowCheckedModeBanner: false,
          home: CharactersView()
      ),
    );
  }
}
