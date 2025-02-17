import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movfix_app/model/models.dart';
import 'package:movfix_app/service/services.dart';

part 'now_playing_movie_state.dart';

class NowPlayingMovieCubit extends Cubit<NowPlayingMovieState> {
  NowPlayingMovieCubit() : super(NowPlayingMovieInitial());
  Future<void> getPlaying() async {
    ApiReturnValue<List<Movie>> result = await MovieServices.getPlayingMovie();

    if (result.value != null) {
      emit(NowPlayingMovieLoaded(result.value!));
    } else {
      emit(NowPlayingMovieLoadingFailed(result.message!));
    }
  }
}
