import 'package:dartz/dartz.dart';
import 'package:home_cure/core/api_errors/network_exceptions.dart';
import 'package:home_cure/core/useCase/use_case.dart';
import 'package:home_cure/features/appointement/domain/entities/appointment.dart';
import 'package:home_cure/features/appointement/domain/entities/done_params.dart';
import 'package:home_cure/features/appointement/domain/entities/rate_params.dart';
import 'package:home_cure/features/appointement/domain/repositories/i_appointemnts.dart';

class AcceptAppointment extends UseCase<Appointment, String> {
  AcceptAppointment(this.repository);
  final IAppointmentRepository repository;

  @override
  Future<Either<NetworkExceptions, Appointment>> call(
    String params,
  ) async {
    return repository.acceeptAppointment(params);
  }
}

class RateAppointment extends UseCase<Appointment, RatingParams> {
  RateAppointment(this.repository);
  final IAppointmentRepository repository;

  @override
  Future<Either<NetworkExceptions, Appointment>> call(
    RatingParams params,
  ) async {
    return repository.rate(params);
  }
}

class OnPorogressAppointment extends UseCase<Appointment, String> {
  OnPorogressAppointment(this.repository);
  final IAppointmentRepository repository;

  @override
  Future<Either<NetworkExceptions, Appointment>> call(
    String params,
  ) async {
    return repository.onProgresstAppointment(params);
  }
}

class DoneAppointment extends UseCase<Appointment, DoneParams> {
  DoneAppointment(this.repository);
  final IAppointmentRepository repository;

  @override
  Future<Either<NetworkExceptions, Appointment>> call(
    DoneParams params,
  ) async {
    return repository.doneAppointment(params);
  }
}
