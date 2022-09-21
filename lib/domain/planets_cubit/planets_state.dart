part of 'planets_cubit.dart';

abstract class PlanetsState extends Equatable {
  const PlanetsState();
}

class PlanetsStateLoading extends PlanetsState {
  @override
  List<Object> get props => [];
}

class PlanetsStateSuccess extends PlanetsState {
  final List<Location> location;

  const PlanetsStateSuccess({required this.location});

  @override
  List<Object> get props => [];
}

class PlanetsStateFailure extends PlanetsState {
  final RequestException exception;

  const PlanetsStateFailure({required this.exception});

  @override
  List<Object> get props => [];
}