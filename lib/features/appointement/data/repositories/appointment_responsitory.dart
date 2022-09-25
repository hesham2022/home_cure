import 'package:dartz/dartz.dart';
import 'package:home_cure/core/api_errors/network_exceptions.dart';
import 'package:home_cure/core/utils/catch_async.dart';
import 'package:home_cure/features/appointement/data/datasources/appountment_remote.dart';
import 'package:home_cure/features/appointement/domain/entities/agora_token.dart';
import 'package:home_cure/features/appointement/domain/entities/appointment.dart';
import 'package:home_cure/features/appointement/domain/entities/create_appointment_params.dart';
import 'package:home_cure/features/appointement/domain/entities/done_params.dart';
import 'package:home_cure/features/appointement/domain/repositories/i_appointemnts.dart';

class AppointmentsRepository extends IAppointmentRepository {
  AppointmentsRepository(this.appointementRemote);
  final IAppointmentRemote appointementRemote;
  @override
  Future<Either<NetworkExceptions, Appointment>> createAppointement(
    CreateAppointmentParams params,
  ) {
    return guardFuture<Appointment>(
      () async => appointementRemote.createAppointement(await params.toMap()),
    );
  }

  @override
  Future<Either<NetworkExceptions, Appointment>> userPayAppointment(
    String appointmentId,
  ) {
    return guardFuture<Appointment>(
      () => appointementRemote.userPayAppointment(appointmentId),
    );
  }

  @override
  Future<Either<NetworkExceptions, Appointment>> providerPayAppointment(
    String appointmentId,
  ) {
    return guardFuture<Appointment>(
      () => appointementRemote.providerPayAppointment(appointmentId),
    );
  }

  @override
  Future<Either<NetworkExceptions, AgoraToken>> stratVideo(
    String appointmentId,
  ) {
    return guardFuture<AgoraToken>(
      () => appointementRemote.startVideo(appointmentId),
    );
  }

  @override
  Future<Either<NetworkExceptions, void>> cancel(
    String appointmentId,
  ) {
    return guardFuture<void>(
      () => appointementRemote.cancel(appointmentId),
    );
  }

  @override
  Future<Either<NetworkExceptions, List<Appointment>>> getUserAppointments() {
    return guardFuture<List<Appointment>>(
      appointementRemote.getAppointments,
    );
  }

  @override
  Future<Either<NetworkExceptions, Appointment>> createPaymentLink(
    String appointmentId,
  ) async {
    return guardFuture<Appointment>(
      () => appointementRemote.createPaymentLink(appointmentId),
    );
  }

  @override
  Future<Either<NetworkExceptions, Appointment>> acceeptAppointment(
    String appointmentId,
  ) async {
    return guardFuture<Appointment>(
      () => appointementRemote.acceptAppointment(appointmentId),
    );
  }

  @override
  Future<Either<NetworkExceptions, Appointment>> onProgresstAppointment(
    String appointmentId,
  ) async {
    return guardFuture<Appointment>(
      () => appointementRemote.onProgressAppointment(appointmentId),
    );
  }

  @override
  Future<Either<NetworkExceptions, Appointment>> doneAppointment(
    DoneParams params,
  ) async {
    return guardFuture<Appointment>(
      () => appointementRemote.doneAppointment(params),
    );
  }
}
