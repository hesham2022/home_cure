import 'package:dartz/dartz.dart';
import 'package:home_cure/core/api_errors/network_exceptions.dart';
import 'package:home_cure/features/home/data/models/ads_model.dart';
import 'package:home_cure/features/home/domain/entities/service.dart';
import 'package:home_cure/features/home/domain/entities/timeslot.dart';

// ignore: one_member_abstracts
abstract class IServicesRepository {
  Future<Either<NetworkExceptions, List<ServiceEntity>>> getServices();
    Future<Either<NetworkExceptions, List<TimeSlot>>> getTimeSlots();
    Future<Either<NetworkExceptions, List<Ad>>> getAds();

}
