import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:home_cure/core/api_errors/index.dart';
import 'package:home_cure/core/useCase/use_case.dart';
import 'package:home_cure/features/appointement/domain/entities/appointment.dart';
import 'package:home_cure/features/appointement/domain/usecases/get_appointments.dart';

part './my_appointments_cubit_state.dart';

class MyAppointmentsCubit extends Cubit<MyAppointmentsCubitState> {
  MyAppointmentsCubit(this.getMyAppoints)
      : super(MyAppointmentsCubitStateIntial());
  final GetAppointments getMyAppoints;

  void addFromFcm(Appointment appointment) {
    if (state is MyAppointmentsCubitStateLoaded) {
      final appointments =
          (state as MyAppointmentsCubitStateLoaded).appointments;
      if (!appointments.map((e) => e.id).toList().contains(appointment.id)) {
        emit(
          MyAppointmentsCubitStateLoaded([
            ...(state as MyAppointmentsCubitStateLoaded).appointments,
            appointment
          ]),
        );
      }
    }
  }

  void addModified(Appointment appointment) {
    print('Appointmenr :${appointment.id}');
    if (state is MyAppointmentsCubitStateLoaded) {
      final appointments =
          (state as MyAppointmentsCubitStateLoaded).appointments;
      emit(
        MyAppointmentsCubitStateLoaded([
          ...appointments.map((e) => e.id == appointment.id ? appointment : e)
        ]),
      );
    }
  }

  Future<void> getMyAppointsFunc() async {
    // await EasyLoading.dismiss();
    // await EasyLoading.show();
    emit(MyAppointmentsCubitStateLoading());
    final response = await getMyAppoints(NoParams());
    // await EasyLoading.dismiss();
    await response.fold(
      (l) async {
        await EasyLoading.showError(l.errorMessege);
        emit(MyAppointmentsCubitStateError(l));
      },
      (r) {
        emit(MyAppointmentsCubitStateLoaded(r));
      },
    );
  }
}