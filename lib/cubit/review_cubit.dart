import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:movfix_app/model/models.dart';
import 'package:movfix_app/service/services.dart';

part 'review_state.dart';

class ReviewCubit extends Cubit<ReviewState> {
  ReviewCubit() : super(ReviewInitial());

  Future<void> getReview(id) async{
    ApiReturnValue<List<Review>> result = await ReviewServices.getReview(id: id);
    if(result.value != null){
      emit(ReviewLoaded(result.value!));
    }else{
      emit(ReviewLoadingFailed(result.message!));
    }
  }
}
