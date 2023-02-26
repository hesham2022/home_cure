import 'package:dartz/dartz.dart';
import 'package:home_cure/core/api_errors/network_exceptions.dart';
import 'package:home_cure/core/useCase/use_case.dart';
import 'package:home_cure/features/home/domain/entities/timeslot.dart';
import 'package:home_cure/features/home/domain/repositories/i_services.dart';

class GetTimeSlots extends UseCase<List<TimeSlot>, NoParams> {
  GetTimeSlots(this.repository);
  final IServicesRepository repository;

  @override
  Future<Either<NetworkExceptions, List<TimeSlot>>> call(
    NoParams params,
  ) async {
    return repository.getTimeSlots();
  }
}

