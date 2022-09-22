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

class SimpleBlocObserver extends BlocObserver {
  @override
  void onEvent(Bloc bloc, Object? event) {
    super.onEvent(bloc, event);
    print(event);
  }

  @override
  void onChange(BlocBase bloc, Change change) {
    super.onChange(bloc, change);
    print(change);
  }

  @override
  void onCreate(BlocBase bloc) {
    super.onCreate(bloc);
    print(bloc);
  }

  @override
  void onTransition(Bloc bloc, Transition transition) {
    super.onTransition(bloc, transition);
    print(transition);
  }

  @override
  void onError(BlocBase bloc, Object error, StackTrace stackTrace) {
    print(error);
    super.onError(bloc, error, stackTrace);
  }
}

void main() {
  Bloc.observer = SimpleBlocObserver();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
      BlocProvider(create: (context) => CharactersCubit()..fetchCharacters(),
      ),
        BlocProvider(create: (context) => PlanetsCubit(),
        ),
    ],
      child: MaterialApp(
          debugShowCheckedModeBanner: false,
          home: CharactersView()
      ),
    );
  }
}
