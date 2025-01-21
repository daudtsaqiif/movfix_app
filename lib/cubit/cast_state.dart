part of 'cast_cubit.dart';

sealed class CastState extends Equatable {
  const CastState();

  @override
  List<Object> get props => [];
}

final class CastInitial extends CastState {
  @override
  List<Object> get props => [];
}

final class CastLoaded extends CastState {
  final List<Cast> casts;

  CastLoaded(this.casts);

  @override
  List<Object> get props => [casts];
}

final class CastLoadingFailed extends CastState {
  final String massage;

  CastLoadingFailed(this.massage);

  @override
  List<Object> get props => [massage];
}

