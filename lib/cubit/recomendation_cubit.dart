import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movfix_app/model/models.dart';
import 'package:movfix_app/service/services.dart';

part 'recomendation_state.dart';

class RecomendationCubit extends Cubit<RecomendationState> {
  RecomendationCubit() : super(RecomendationInitial());

  Future<void> getRecomendation(id) async {
    ApiReturnValue<List<Movie>> result =
        await MovieServices.getRecommendation(id: id);
    if (result.value != null) {
      emit(RecomendationLoaded(result.value!));
    } else {
      emit(RecomendationLoadingFailed(result.message!));
    }
  }
}
