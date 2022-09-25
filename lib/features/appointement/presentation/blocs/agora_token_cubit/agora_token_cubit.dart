// Future<void> stratVideoFunc(
//   String params,
// ) async {
//   emit(AgoraTokenCubitStateLoading());
//   final response = await startVideo(params);
//   response.fold((l) => emit(AgoraTokenCubitStateError(l)), (r) {
//     emit(AgoraTokenCubitStateStartVideo(r));
//   });
// }
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cure/core/api_errors/index.dart';
import 'package:home_cure/features/appointement/domain/entities/agora_token.dart';
import 'package:home_cure/features/appointement/domain/usecases/start_video.dart';

part './agora_token_state.dart';

class AgoraTokenCubitCubit extends Cubit<AgoraTokenCubitCubitState> {
  AgoraTokenCubitCubit(this.startVideo)
      : super(AgoraTokenCubitCubitStateIntial());
  final StartVideo startVideo;

  Future<void> stratVideoFunc(
    String params,
  ) async {
    emit(AgoraTokenCubitCubitStateLoading());
    final response = await startVideo(params);
    response.fold((l) => emit(AgoraTokenCubitCubitStateError(l)), (r) {
      emit(AgoraTokenCubitCubitStateLoaded(r));
    });
  }
}
