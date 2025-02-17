import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movfix_app/model/models.dart';
import 'package:movfix_app/service/services.dart';

part 'video_state.dart';

class VideoCubit extends Cubit<VideoState> {
  VideoCubit() : super(VideoInitial());

  Future<void> getVideo(id) async {
    ApiReturnValue<List<Video>> getVideo = await VideoService.getVideo(id: id);

    emit(VideoInitial());
    if (getVideo.value != null) {
      emit(VideoLoaded(getVideo.value!));
    } else {
      emit(VideoLoadingFailed(getVideo.message!));
    }
  }
}
