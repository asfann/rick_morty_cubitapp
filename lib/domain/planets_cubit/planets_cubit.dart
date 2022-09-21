import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'planets_state.dart';

class PlanetsCubit extends Cubit<PlanetsState> {
  PlanetsCubit() : super(PlanetsInitial());
}
