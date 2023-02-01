import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:home_cure/core/api_errors/index.dart';
import 'package:home_cure/core/useCase/use_case.dart';
import 'package:home_cure/core/utils/hive_helper.dart';
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
      } else {
        emit(
          MyAppointmentsCubitStateLoaded([
            ...(state as MyAppointmentsCubitStateLoaded)
                .appointments
                .map((e) => e.id == appointment.id ? appointment : e)
                .toList(),
          ]),
        );
      }
    }
  }

  void addModified(Appointment appointment) {
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

  void delete(Appointment appointment) {
    if (state is MyAppointmentsCubitStateLoaded) {
      final appointments =
          (state as MyAppointmentsCubitStateLoaded).appointments;
      emit(
        MyAppointmentsCubitStateLoaded(
          [...appointments.where((e) => e.id != appointment.id)],
        ),
      );
    }
  }

  Future<void> getMyAppointsFunc() async {
    // await EasyLoading.dismiss();
    // awaitEasyLoading.show();
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

Future<void> addToSched(String key, String id) async {
  await Hive.box<String>(
    HiveService.shculdedBox,
  ).put(
    key,
    id,
  );
}

Future sculded(List<Appointment> appointments) async {
  final notificationsMap = HiveService.schuldedBox().toMap();
  final notifications = notificationsMap.values.toList();
  for (final i in appointments) {
    if (!notifications.contains(i.id)) {
      await AwesomeNotifications().createNotification(
        content: NotificationContent(
          channelKey: 'basic_channel',
          id: DateTime.now().millisecond,
          title: 'Hello',
        ),
        schedule: NotificationCalendar.fromDate(
          date: DateTime(i.date.year, i.date.month, i.date.day)
              .add(const Duration(seconds: 5)),
        ),
      );
      await addToSched(i.id, i.id);
    }
  }
}
