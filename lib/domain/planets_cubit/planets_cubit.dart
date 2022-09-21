import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rick_morty_cubitapp/data/locations_repo.dart';

import '../../data/base/requeest_exception.dart';
import '../models/location/location_model.dart';

part 'planets_state.dart';

class PlanetsCubit extends Cubit<PlanetsState> {
  PlanetsCubit() : repository = LocationRepo(), super(PlanetsStateLoading());
final LocationRepo repository;

Future<void> fetchPlanet({int? page}) async {
  try {
    final location = await repository.getAllLocations(params: {'page':page});
    emit(PlanetsStateSuccess(location: location));
  } on RequestException catch(e){
    emit(PlanetsStateFailure(exception: e));
  }
}
}
