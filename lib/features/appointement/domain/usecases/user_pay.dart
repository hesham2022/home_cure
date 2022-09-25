import 'package:dartz/dartz.dart';
import 'package:home_cure/core/api_errors/network_exceptions.dart';
import 'package:home_cure/core/useCase/use_case.dart';
import 'package:home_cure/features/appointement/domain/entities/appointment.dart';
import 'package:home_cure/features/appointement/domain/repositories/i_appointemnts.dart';

class UserPay extends UseCase<Appointment, String> {
  UserPay(this.repository);
  final IAppointmentRepository repository;

  @override
  Future<Either<NetworkExceptions, Appointment>> call(
    String params,
  ) async {
    return repository.userPayAppointment(params);
  }
}
class Cancel extends UseCase<void, String> {
  Cancel(this.repository);
  final IAppointmentRepository repository;

  @override
  Future<Either<NetworkExceptions, void>> call(
    String params,
  ) async {
    return repository.cancel(params);
  }
}


class ProviderPay extends UseCase<Appointment, String> {
  ProviderPay(this.repository);
  final IAppointmentRepository repository;

  @override
  Future<Either<NetworkExceptions, Appointment>> call(
    String params,
  ) async {
    return repository.providerPayAppointment(params);
  }
}
