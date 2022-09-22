part of 'character_cubit.dart';

abstract class CharacterState extends Equatable {
  const CharacterState();
}

class CharacterStateLoading extends CharacterState {
  @override
  List<Object> get props => [];
}

class CharacterStateSuccess extends CharacterState {
  final Character character;
  final List<Episode> episode;
  final Location? location;


  const CharacterStateSuccess({required this.character,required this.episode, required this.location});

  @override
  List<Object> get props => [];
}

class CharacterStateFailure extends CharacterState {
  final RequestException exception;

  const CharacterStateFailure({required this.exception});

  @override
  List<Object> get props => [];
}