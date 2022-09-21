import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

import '../../data/base/requeest_exception.dart';
import '../../data/characters_repo.dart';
import '../models/character_model/character_model.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit() : repository = CharactersRepository(), super(CharacterStateLoading());
  final CharactersRepository repository;

  Future<void> fetchCharacterById(id) async {
    try {
      final character = await repository.getCharacterById(id);
      emit(CharacterStateSuccess(character: character));
    } on RequestException catch(e){
      emit(CharacterStateFailure(exception: e));
    }
  }
}
