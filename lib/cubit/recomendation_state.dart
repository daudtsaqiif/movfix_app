part of 'recomendation_cubit.dart';

sealed class RecomendationState extends Equatable {
  const RecomendationState();

  @override
  List<Object> get props => [];
}

final class RecomendationInitial extends RecomendationState {
  @override
  List<Object> get props => [];
}

final class RecomendationLoaded extends RecomendationState {
  final List<Movie> recomendations;

  RecomendationLoaded(this.recomendations);

  @override
  List<Object> get props => [recomendations];
}

final class RecomendationLoadingFailed extends RecomendationState {
  final String massage;

  RecomendationLoadingFailed(this.massage);

  @override
  List<Object> get props => [massage];
}

