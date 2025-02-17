import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movfix_app/model/models.dart';
import 'package:movfix_app/service/services.dart';

part 'upcoming_movie_state.dart';

class UpcomingMovieCubit extends Cubit<UpcomingMovieState> {
  UpcomingMovieCubit() : super(UpcomingMovieInitial());

  Future<void> getPlaying() async {
    ApiReturnValue<List<Movie>> result = await MovieServices.getUpcomingMovie();

    if (result.value != null) {
      emit(UpcomingMovieLoaded(result.value!));
    } else {
      emit(UpcomingMovieLoadingFailed(result.message!));
    }
  }
}
