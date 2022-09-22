import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_morty_cubitapp/data/episodes_repo.dart';
import 'package:rick_morty_cubitapp/data/locations_repo.dart';

import '../../data/base/requeest_exception.dart';
import '../../data/characters_repo.dart';
import '../models/character_model/character_model.dart';
import '../models/episode_model/episode_model.dart';
import '../models/location/location_model.dart';

part 'character_state.dart';

class CharacterCubit extends Cubit<CharacterState> {
  CharacterCubit() : repository = CharactersRepository(), episodesRepo = EpisodesRepo(), locationRepo = LocationRepo(), super(CharacterStateLoading());
  final CharactersRepository repository;
  final EpisodesRepo episodesRepo;
  final LocationRepo locationRepo;
  Future<void> fetchCharacterById(id) async {
    try {
      final character = await repository.getCharacterById(id);
      List<Episode> episodes =[];
      for (var element in character.episode) {
        var episode = await episodesRepo.getEpisodeByUrl(element);
        episodes.add(episode);
      }
      Location? location;
      if(character.location != null) {
         location = await locationRepo.getLocationByUrl(
            character.location!.url);
      }
      emit(CharacterStateSuccess(character: character, episode: episodes, location: location));
    } on RequestException catch(e){
      emit(CharacterStateFailure(exception: e));
    }
  }
}
