import 'package:dartz/dartz.dart';
import 'package:home_cure/core/api_errors/network_exceptions.dart';
import 'package:home_cure/core/useCase/use_case.dart';
import 'package:home_cure/features/home/domain/entities/service.dart';
import 'package:home_cure/features/home/domain/repositories/i_services.dart';

class GetServices extends UseCase<List<ServiceEntity>, NoParams> {
  GetServices(this.repository);
  final IServicesRepository repository;

  @override
  Future<Either<NetworkExceptions, List<ServiceEntity>>> call(
    NoParams params,
  ) async {
    return repository.getServices();
  }
}
