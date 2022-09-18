import 'package:home_cure/core/api_config/index.dart';
import 'package:home_cure/features/home/data/models/ads_model.dart';
import 'package:home_cure/features/home/data/models/service_response.dart';
import 'package:home_cure/features/home/data/models/timeslot_respinse.dart';
import 'package:home_cure/features/home/domain/entities/service.dart';
import 'package:home_cure/features/home/domain/entities/timeslot.dart';

abstract class IServicesRemote {
  IServicesRemote(this.apiConfig);
  final ApiClient apiConfig;

  Future<List<ServiceEntity>> getServices();
  Future<List<TimeSlot>> getTimeSlots();
  Future<List<Ad>> getAds();
}

class ServicesRemote extends IServicesRemote {
  ServicesRemote(super.apiConfig);

  @override
  Future<List<ServiceEntity>> getServices() async {
    final response = await apiConfig.get(kgetSevices);
    final data = response.data as Map<String, dynamic>;
    final servicesResponse = ServiceRespons.fromJson(data);
    return servicesResponse.results;
  }

  @override
  Future<List<TimeSlot>> getTimeSlots() async {
    final response = await apiConfig.get(kTimeslot);
    final data = response.data as Map<String, dynamic>;
    final timeSlotResponse = TimeSlotResponse.fromJson(data);
    return timeSlotResponse.results;
  }

  @override
  Future<List<Ad>> getAds() async {
    final response = await apiConfig.get(kAds);
    final data = response.data as Map<String, dynamic>;
    final timeSlotResponse = AdsResponse.fromJson(data);
    return timeSlotResponse.results;
  }
}
