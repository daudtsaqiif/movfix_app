import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movfix_app/model/models.dart';
import 'package:movfix_app/service/services.dart';

part 'images_state.dart';

class ImagesCubit extends Cubit<ImagesState> {
  ImagesCubit() : super(ImagesInitial());

  Future<void> getImages(id) async {
    ApiReturnValue<List<Images>> result = await ImagesService.getImages(id: id);
    if (result.value != null) {
      emit(ImagesLoaded(result.value!));
    } else {
      emit(ImagesLoadingFailed(result.message!));
    }
  }
}
