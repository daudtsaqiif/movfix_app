part of 'review_cubit.dart';

sealed class ReviewState extends Equatable {
  const ReviewState();

  @override
  List<Object> get props => [];
}

final class ReviewInitial extends ReviewState {
  @override
  List<Object> get props => [];
}

final class ReviewLoaded extends ReviewState {
  final List<Review> reviews;

  const ReviewLoaded(this.reviews);

  @override
  List<Object> get props => [reviews];
}

final class ReviewLoadingFailed extends ReviewState {
  final String massage;

  ReviewLoadingFailed(this.massage);

  @override
  List<Object> get props => [massage];
}
