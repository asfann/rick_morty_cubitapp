import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';

part 'planet_state.dart';

class PlanetCubit extends Cubit<PlanetState> {
  PlanetCubit() : super(PlanetInitial());
}
