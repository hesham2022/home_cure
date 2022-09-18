import 'package:dartz/dartz.dart';
import 'package:home_cure/core/api_errors/network_exceptions.dart';
import 'package:home_cure/core/useCase/use_case.dart';
import 'package:home_cure/features/appointement/domain/entities/appointment.dart';
import 'package:home_cure/features/appointement/domain/repositories/i_appointemnts.dart';

class CreatePaymentLink extends UseCase<Appointment, String> {
  CreatePaymentLink(this.repository);
  final IAppointmentRepository repository;

  @override
  Future<Either<NetworkExceptions, Appointment>> call(
    String params,
  ) async {
    return repository.createPaymentLink(params);
  }
}
