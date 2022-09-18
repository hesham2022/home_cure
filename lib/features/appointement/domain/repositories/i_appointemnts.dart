import 'package:dartz/dartz.dart';
import 'package:home_cure/core/api_errors/network_exceptions.dart';
import 'package:home_cure/features/appointement/domain/entities/appointment.dart';
import 'package:home_cure/features/appointement/domain/entities/create_appointment_params.dart';
import 'package:home_cure/features/appointement/domain/entities/done_params.dart';

// ignore: one_member_abstracts
abstract class IAppointmentRepository {
  Future<Either<NetworkExceptions, Appointment>> createAppointement(
    CreateAppointmentParams params,
  );
   Future<Either<NetworkExceptions, Appointment>> userPayAppointment(
    String appointmentId,
  );
    Future<Either<NetworkExceptions, Appointment>> createPaymentLink(
    String appointmentId,
  );
   Future<Either<NetworkExceptions, Appointment>> acceeptAppointment(
    String appointmentId,
  );
   Future<Either<NetworkExceptions, Appointment>> onProgresstAppointment(
    String appointmentId,
  ); Future<Either<NetworkExceptions, Appointment>>  doneAppointment(
    DoneParams params,
  );
   Future<Either<NetworkExceptions, List<Appointment>>> getUserAppointments(
  );
}
