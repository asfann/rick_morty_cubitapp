import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_morty_cubitapp/data/characters_repo.dart';
import 'package:rick_morty_cubitapp/data/locations_repo.dart';
import 'package:rick_morty_cubitapp/domain/models/location/location_model.dart';

import '../../data/base/requeest_exception.dart';
import '../models/character_model/character_model.dart';

part 'planet_state.dart';

class PlanetCubit extends Cubit<PlanetState> {
  PlanetCubit() : repository = LocationRepo(), residentsRepo = CharactersRepository(), super(PlanetStateLoading());
  final LocationRepo repository;
  final CharactersRepository residentsRepo;

  Future<void> fetchPlanetById(id) async {
    try {
      final location = await repository.getLocationById(id);
      List<Character> residents =[];
      for (var element in location.residents) {
        var resident = await residentsRepo.getCharacterByUrl(element);
        residents.add(resident);
      }
      emit(PlanetStateSuccess(location: location, residents: residents));
    } on RequestException catch(e){
      emit(PlanetStateFailure(exception: e));
    }
  }


}
