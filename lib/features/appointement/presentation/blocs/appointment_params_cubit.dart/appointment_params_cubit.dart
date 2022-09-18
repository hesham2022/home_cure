import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cure/features/appointement/domain/entities/create_appointment_params.dart';
import 'package:home_cure/features/appointement/presentation/pages/create_appointment_second.dart';

part './appointment_params_state.dart';

class AppointmentsParamsCubit extends Cubit<AppointmentsParamsState> {
  AppointmentsParamsCubit() : super(const AppointmentsParamsState());
  static AppointmentsParamsCubit get(BuildContext context) =>
      context.read<AppointmentsParamsCubit>();
  void clear() {
    emit(const AppointmentsParamsState());
  }

  void addPeriod(
    EveningMorning period,
  ) {
    emit(state.copyWith(period: period));
  }

  void addPrice(
    int price,
  ) {
    emit(state.copyWith(price: price));
  }

  void addDyas(
    int price,
  ) {
    emit(state.copyWith(days: price));
  }

  void addSessions(
    int price,
  ) {
    emit(state.copyWith(sessions: price));
  }

  void addService(
    String service,
  ) {
    emit(state.copyWith(service: service));
  }

  void addTimeSlot(
    String period,
  ) {
    emit(state.copyWith(timeslot: period));
  }

  void addDate(
    DateTime period,
  ) {
    emit(state.copyWith(date: period));
  }

  void addReason(
    String reason,
  ) {
    emit(state.copyWith(reason: reason));
  }

  void addLocation(
    Location location,
  ) {
    emit(state.copyWith(location: location));
  }

  void addUser(String user) {
    emit(state.copyWith(user: user));
  }

  void addReson(String user) {
    emit(state.copyWith(user: user));
  }

  void addPaymentMethod(String paymentMethod) {
    emit(state.copyWith(paymentMethod: paymentMethod));
  }

  Future<void> addFile(String file, int index) async {
    var _attatchments = <String?>[];
    _attatchments = state.attachments != null
        ? [...state.attachments!]
        : List.generate(10, (index) => null);

    _attatchments[index] = file;

    emit(state.copyWith(attachments: [..._attatchments]));
  }
}
