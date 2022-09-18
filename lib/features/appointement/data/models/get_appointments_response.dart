import 'package:home_cure/features/appointement/data/models/appoinmrnt_model.dart';

class AppointmentResponse {
  AppointmentResponse({
    required this.results,
    required this.page,
    required this.limit,
    required this.totalPages,
    required this.totalResults,
  });
  factory AppointmentResponse.fromJson(Map<String, dynamic> json) {
    print(json);
    return AppointmentResponse(
      results: List<AppointmentModel>.from(
        (json['results'] as List<dynamic>).map<AppointmentModel>(
          (dynamic j) => AppointmentModel.fromMap(j as Map<String, dynamic>),
        ),
      ),
      page: json['page'] as int,
      limit: json['limit'] as int,
      totalPages: json['totalPages'] as int,
      totalResults: json['totalResults'] as int,
    );
  }

  List<AppointmentModel> results;
  int page;
  int limit;
  int totalPages;
  int totalResults;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'results': List<dynamic>.from(results.map<dynamic>((x) => x.toJson())),
        'page': page,
        'limit': limit,
        'totalPages': totalPages,
        'totalResults': totalResults,
      };
}
