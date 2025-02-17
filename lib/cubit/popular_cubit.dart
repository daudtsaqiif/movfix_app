import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movfix_app/model/models.dart';
import 'package:movfix_app/service/services.dart';

part 'popular_state.dart';

class PopularCubit extends Cubit<PopularState> {
  PopularCubit() : super(PopularInitial());

  Future<void> getPopular() async {
    ApiReturnValue<List<Movie>> result = await MovieServices.getPopularMovie();

    if (result.value != null) {
      emit(PopularLoaded(result.value!));
    } else {
      emit(PopularLoadingFailed(result.message!));
    }
  }
}
