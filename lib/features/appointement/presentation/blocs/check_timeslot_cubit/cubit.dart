import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:home_cure/core/api_errors/index.dart';
import 'package:home_cure/features/appointement/domain/entities/appointment.dart';
import 'package:home_cure/features/appointement/domain/usecases/get_appointments.dart';

part './state.dart';

class CheckTimeslotsCubit extends Cubit<CheckTimeslotsCubitState> {
  CheckTimeslotsCubit(this.checkTimeSlot) : super(CheckTimeslotsCubitStateIntial());
  final CheckTimeSlot checkTimeSlot;

  Future<void> checkTimeSlotFunc(String date) async {
    // await EasyLoading.dismiss();
    // awaitEasyLoading.show();
    emit(CheckTimeslotsCubitStateLoading());
    final response = await checkTimeSlot(date);
    // await EasyLoading.dismiss();
    await response.fold(
      (l) async {
        await EasyLoading.showError(l.errorMessege);
        emit(CheckTimeslotsCubitStateError(l));
      },
      (r) {
        emit(CheckTimeslotsCubitStateLoaded(r));
      },
    );
  }
}
