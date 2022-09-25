import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cure/core/api_errors/network_exceptions.dart';
import 'package:home_cure/features/appointement/domain/entities/appointment.dart';
import 'package:home_cure/features/appointement/domain/entities/create_appointment_params.dart';
import 'package:home_cure/features/appointement/domain/entities/done_params.dart';
import 'package:home_cure/features/appointement/domain/usecases/accept_appointment.dart';
import 'package:home_cure/features/appointement/domain/usecases/create_appointment.dart';
import 'package:home_cure/features/appointement/domain/usecases/create_payment_link.dart';
import 'package:home_cure/features/appointement/domain/usecases/start_video.dart';
import 'package:home_cure/features/appointement/domain/usecases/user_pay.dart';

part './appointments_cubit_state.dart';

class AppointmentsCubit extends Cubit<AppointmentsCubitState> {
  AppointmentsCubit({
    required this.createAppointement,
    required this.userPay,
    required this.createPaymentLink,
    required this.acceptAppointment,
    required this.onPorogressAppointment,
    required this.doneAppointment,
    required this.startVideo,
    required this.cancel,
    required this.providerPay,
  }) : super(AppointmentsCubitStateIntial());
  final CreateAppointment createAppointement;
  final UserPay userPay;
  final ProviderPay providerPay;

  final CreatePaymentLink createPaymentLink;
  final AcceptAppointment acceptAppointment;
  final OnPorogressAppointment onPorogressAppointment;
  final DoneAppointment doneAppointment;
  final StartVideo startVideo;
  final Cancel cancel;
  Future<void> createAppointementFunc(
    CreateAppointmentParams params,
  ) async {
    emit(AppointmentsCubitStateLoading());
    final response = await createAppointement(params);
    response.fold((l) => emit(AppointmentsCubitStateError(l)), (r) {
      if (r.link != null) {
        emit(AppointmentsCubitStateCreatedWithPayLink(r));
      } else {
        emit(AppointmentsCubitStateCreated(r));
      }
    });
  }

//AppointmentsCubitStateStartVideo
  Future<void> userPayFunc(
    String params,
  ) async {
    emit(AppointmentsCubitStateLoading());
    final response = await userPay(params);
    response.fold((l) => emit(AppointmentsCubitStateError(l)), (r) {
      emit(AppointmentsCubitStatePayed(r));
    });
  }

  Future<void> cancelFunc(
    String params,
  ) async {
    emit(AppointmentsCubitStateLoading());
    final response = await cancel(params);
    response.fold((l) => emit(AppointmentsCubitStateError(l)), (r) {
      emit(AppointmentsCubitStateCancelled());
    });
  }

  Future<void> providerPayFunc(
    String params,
  ) async {
    emit(AppointmentsCubitStateLoading());
    final response = await providerPay(params);
    response.fold((l) => emit(AppointmentsCubitStateError(l)), (r) {
      emit(AppointmentsCubitStatePayed(r));
    });
  }

  Future<void> acceptFunc(
    String params,
  ) async {
    emit(AppointmentsCubitStateLoading());
    final response = await acceptAppointment(params);
    response.fold((l) => emit(AppointmentsCubitStateError(l)), (r) {
      emit(AppointmentsCubitStateAccepted(r));
    });
  }

  Future<void> onProgressFunc(
    String params,
  ) async {
    emit(AppointmentsCubitStateLoading());
    final response = await onPorogressAppointment(params);
    response.fold((l) => emit(AppointmentsCubitStateError(l)), (r) {
      emit(AppointmentsCubitStateOnProgress(r));
    });
  }

  Future<void> doneFunc(
    DoneParams params,
  ) async {
    emit(AppointmentsCubitStateLoading());
    final response = await doneAppointment(params);
    response.fold((l) => emit(AppointmentsCubitStateError(l)), (r) {
      emit(AppointmentsCubitStateDone(r));
    });
  }

  Future<void> addFromFcm(
    Appointment params,
  ) async {}

  Future<void> cratePaymentLinkFunc(
    String params,
  ) async {
    emit(AppointmentsCubitStateLoading());
    final response = await createPaymentLink(params);
    response.fold((l) => emit(AppointmentsCubitStateError(l)), (r) {
      emit(AppointmentsCubitStateCreatedWithPayLink(r));
    });
  }
}
