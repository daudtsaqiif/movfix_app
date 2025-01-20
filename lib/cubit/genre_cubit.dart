import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movfix_app/model/models.dart';
import 'package:movfix_app/service/services.dart';

part 'genre_state.dart';


class GenreCubit extends Cubit<GenreState> {
  GenreCubit() : super(GenreInitial());

  Future<void> getGenre() async {
    ApiReturnValue<List<Genre>> result = await GenreServices.getGenres();
    if (result.value != null) {
      emit(GenreLoaded(result.value!));
    } else {
      emit(GenreLoadingFailed(result.message!));
    }
  }
}
