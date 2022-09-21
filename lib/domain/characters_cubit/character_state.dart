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

  const CharacterStateSuccess({required this.character});

  @override
  List<Object> get props => [];
}

class CharacterStateFailure extends CharacterState {
  final RequestException exception;

  const CharacterStateFailure({required this.exception});

  @override
  List<Object> get props => [];
}