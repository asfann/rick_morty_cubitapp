import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_morty_cubitapp/data/base/requeest_exception.dart';
import 'package:rick_morty_cubitapp/data/characters_repo.dart';

import '../models/character_model/character_model.dart';

part 'characters_state.dart';

class CharactersCubit extends Cubit<CharactersState> {
  CharactersCubit() : repository = CharactersRepository(), super(CharactersStateLoading());
  final CharactersRepository repository;

  Future<void> fetchCharacters({int? page}) async {
    try {
      final charactersList = await repository.getAllCharacters(params: {'page':page});
      emit(CharactersStateSuccess(characters: charactersList));
    } on RequestException catch(e){
      emit(CharactersStateFailure(exception: e));
    }
  }

  Future<void> fetchCharactersWithFilter({int? page, required Map<String, dynamic> params}) async {
    emit(CharactersStateLoading());
    try {
      final charactersList = await repository.getAllCharacters(params: {'page':page}..addAll(params));
      emit(CharactersStateSuccess(characters: charactersList));
    } on RequestException catch(e){
      emit(CharactersStateFailure(exception: e));
    }
  }
}
