part of 'characters_cubit.dart';

abstract class CharactersState extends Equatable {
  const CharactersState();
}

class CharactersStateLoading extends CharactersState {
  @override
  List<Object> get props => [];
}

class CharactersStateSuccess extends CharactersState {
  final List<Character> characters;

  const CharactersStateSuccess({required this.characters});

  @override
  List<Object> get props => [];
}

class CharactersStateFailure extends CharactersState {
  final RequestException exception;

  const CharactersStateFailure({required this.exception});

  @override
  List<Object> get props => [];
}
