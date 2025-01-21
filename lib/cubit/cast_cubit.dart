import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movfix_app/model/models.dart';
import 'package:movfix_app/service/services.dart';

part 'cast_state.dart';

class CastCubit extends Cubit<CastState> {
  CastCubit() : super(CastInitial());

  Future<void> getCast(id) async {
    ApiReturnValue<List<Cast>> result = await CastServices.getCast(id: id);
    if (result.value != null) {
      emit(CastLoaded(result.value!));
    } else {
      emit(CastLoadingFailed(result.message!));
    }
  }
}
