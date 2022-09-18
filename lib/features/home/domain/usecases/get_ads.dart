import 'package:dartz/dartz.dart';
import 'package:home_cure/core/api_errors/network_exceptions.dart';
import 'package:home_cure/core/useCase/use_case.dart';
import 'package:home_cure/features/home/data/models/ads_model.dart';
import 'package:home_cure/features/home/domain/repositories/i_services.dart';

class GetAds extends UseCase<List<Ad>, NoParams> {
  GetAds(this.repository);
  final IServicesRepository repository;

  @override
  Future<Either<NetworkExceptions, List<Ad>>> call(
    NoParams params,
  ) async {
    return repository.getAds();
  }
}
