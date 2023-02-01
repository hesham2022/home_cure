import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cure/core/api_errors/network_exceptions.dart';
import 'package:home_cure/core/useCase/use_case.dart';
import 'package:home_cure/features/authentication/domain/entities/entities.dart';
import 'package:home_cure/features/authentication/domain/usecases/get_our_doctors.dart';

part 'our_doctors_state.dart';

class OurDoctorsCubit extends Cubit<OurDoctorsCubitState> {
  OurDoctorsCubit(this.getOurDoctorss) : super(OurDoctorsCubitStateIntial());
  final GetOurDoctors getOurDoctorss;

  Future<void> getOurDoctorssFunc() async {
    final response = await getOurDoctorss(NoParams());
    emit(OurDoctorsCubitStateLoading());
    response.fold(
      (l) => emit(OurDoctorsCubitStateError(l)),
      (r) => emit(OurDoctorsCubitStateLoaded(r)),
    );
  }
}
