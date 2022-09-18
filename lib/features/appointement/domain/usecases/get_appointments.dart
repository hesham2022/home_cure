import 'package:dartz/dartz.dart';
import 'package:home_cure/core/api_errors/network_exceptions.dart';
import 'package:home_cure/core/useCase/use_case.dart';
import 'package:home_cure/features/appointement/domain/entities/appointment.dart';
import 'package:home_cure/features/appointement/domain/repositories/i_appointemnts.dart';

class GetAppointments extends UseCase<List<Appointment>, NoParams> {
  GetAppointments(this.repository);
  final IAppointmentRepository repository;

  @override
  Future<Either<NetworkExceptions, List<Appointment>>> call(
    NoParams params,
  ) async {
    return repository.getUserAppointments();
  }
}
