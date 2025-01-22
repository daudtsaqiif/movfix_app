import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movfix_app/model/models.dart';
import 'package:movfix_app/service/services.dart';

part 'detail_movie_state.dart';

class DetailMovieCubit extends Cubit<DetailMovieState> {
  DetailMovieCubit() : super(DetailMovieInitial());

  Future<void> getDetailMovie(int id) async {
  ApiReturnValue<DetailMove> result = await DetailMovieServices.getDetailMovie(id: id);
    if (result.value != null) {
      emit(DetailMovieLoaded(result.value!));
    } else {
      emit(DetailMovieLoadingFailed(result.message!));
    }
  }
}
