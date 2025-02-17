part of 'video_cubit.dart';

sealed class VideoState extends Equatable {
  const VideoState();

  @override
  List<Object> get props => [];
}

final class VideoInitial extends VideoState {
  @override
  List<Object> get props => [];
}

final class VideoLoaded extends VideoState {
  final List<Video> videos;

  const VideoLoaded(this.videos);

  @override
  List<Object> get props => [videos];
}

final class VideoLoadingFailed extends VideoState {
  final String message;

  const VideoLoadingFailed(this.message);

  @override
  List<Object> get props => [message];
}


