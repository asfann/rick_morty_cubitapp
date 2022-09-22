part of 'planet_cubit.dart';

abstract class PlanetState extends Equatable {
  const PlanetState();
}

class PlanetStateLoading extends PlanetState {
  @override
  List<Object> get props => [];
}

class PlanetStateSuccess extends PlanetState {
  final Location location;
  final List<Character> residents;

  const PlanetStateSuccess({required this.location, required this.residents});

  @override
  List<Object> get props => [];
}

class PlanetStateFailure extends PlanetState {
  final RequestException exception;

  const PlanetStateFailure({required this.exception});

  @override
  List<Object> get props => [];
}

