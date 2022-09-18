import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cure/core/api_errors/network_exceptions.dart';
import 'package:home_cure/core/useCase/use_case.dart';
import 'package:home_cure/features/home/data/models/ads_model.dart';
import 'package:home_cure/features/home/domain/usecases/get_ads.dart';

part './ads_state.dart';

class AdsCubit extends Cubit<AdsCubitState> {
  AdsCubit(this.getAds) : super(AdsCubitStateIntial());
  final GetAds getAds;

  Future<void> getAdsFunc() async {
    final response = await getAds(NoParams());
    emit(AdsCubitStateLoading());
    response.fold(
      (l) => emit(AdsCubitStateError(l)),
      (r) => emit(AdsCubitStateLoaded(r)),
    );
  }
}
