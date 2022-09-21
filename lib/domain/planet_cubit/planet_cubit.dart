import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_morty_cubitapp/data/locations_repo.dart';
import 'package:rick_morty_cubitapp/domain/models/location/location_model.dart';

import '../../data/base/requeest_exception.dart';

part 'planet_state.dart';

class PlanetCubit extends Cubit<PlanetState> {
  PlanetCubit() : repository = LocationRepo(), super(PlanetStateLoading());
  final LocationRepo repository;

  Future<void> fetchPlanetById(id) async {
    try {
      final location = await repository.getLocationById(id);
      emit(PlanetStateSuccess(location: location));
    } on RequestException catch(e){
      emit(PlanetStateFailure(exception: e));
    }
  }
}
