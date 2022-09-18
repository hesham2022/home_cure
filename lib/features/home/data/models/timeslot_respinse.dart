// To parse this JSON data, do
//
//     final timeSlotResponse = timeSlotResponseFromJson(jsonString);

import 'dart:convert';

import 'package:home_cure/features/home/data/models/timeslot_model.dart';

TimeSlotResponse timeSlotResponseFromJson(String str) =>
    TimeSlotResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String timeSlotResponseToJson(TimeSlotResponse data) =>
    json.encode(data.toJson());

class TimeSlotResponse {
  TimeSlotResponse({
    required this.results,
    required this.page,
    required this.limit,
    required this.totalPages,
    required this.totalResults,
  });
  factory TimeSlotResponse.fromJson(Map<String, dynamic> json) =>
      TimeSlotResponse(
        results: List<TimeSlotModel>.from(
          (json['results'] as List<dynamic>).map<TimeSlotModel>(
            (dynamic j) => TimeSlotModel.fromJson(j as Map<String, dynamic>),
          ),
        ),
        page: json['page'] as int,
        limit: json['limit'] as int,
        totalPages: json['totalPages'] as int,
        totalResults: json['totalResults'] as int,
      );

  List<TimeSlotModel> results;
  int page;
  int limit;
  int totalPages;
  int totalResults;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'results': List<dynamic>.from(
          results.map<Map<String, dynamic>>((x) => x.toJson()),
        ),
        'page': page,
        'limit': limit,
        'totalPages': totalPages,
        'totalResults': totalResults,
      };
}
