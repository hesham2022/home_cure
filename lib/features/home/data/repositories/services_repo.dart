import 'package:dartz/dartz.dart';
import 'package:home_cure/core/api_errors/network_exceptions.dart';
import 'package:home_cure/core/utils/catch_async.dart';
import 'package:home_cure/features/home/data/datasources/services_remote.dart';
import 'package:home_cure/features/home/data/models/ads_model.dart';
import 'package:home_cure/features/home/domain/entities/service.dart';
import 'package:home_cure/features/home/domain/entities/timeslot.dart';
import 'package:home_cure/features/home/domain/repositories/i_services.dart';

class ServicesRepository extends IServicesRepository {
  ServicesRepository(this.servicesRemote);
  final IServicesRemote servicesRemote;

  @override
  Future<Either<NetworkExceptions, List<ServiceEntity>>> getServices() =>
      guardFuture<List<ServiceEntity>>(servicesRemote.getServices);

  @override
  Future<Either<NetworkExceptions, List<TimeSlot>>> getTimeSlots() =>
      guardFuture<List<TimeSlot>>(servicesRemote.getTimeSlots);
  @override
  Future<Either<NetworkExceptions, List<Ad>>> getAds() =>
      guardFuture<List<Ad>>(servicesRemote.getAds);
}
