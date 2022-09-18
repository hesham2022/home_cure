// To parse this JSON data, do
//
//     final serviceRespons = serviceResponsFromJson(jsonString);

import 'dart:convert';

import 'package:home_cure/features/home/data/models/service_model.dart';

ServiceRespons serviceResponsFromJson(String str) =>
    ServiceRespons.fromJson(json.decode(str) as Map<String, dynamic>);

String serviceResponsToJson(ServiceRespons data) => json.encode(data.toJson());

class ServiceRespons {
  ServiceRespons({
    required this.results,
    required this.page,
    required this.limit,
    required this.totalPages,
    required this.totalResults,
  });
  factory ServiceRespons.fromJson(Map<String, dynamic> json) => ServiceRespons(
        results: List<ServiceModel>.from(
          (json['results'] as List<dynamic>).map<ServiceModel>(
            (dynamic j) => ServiceModel.fromJson(j as Map<String, dynamic>),
          ),
        ),
        page: json['page'] as int,
        limit: json['limit'] as int,
        totalPages: json['totalPages'] as int,
        totalResults: json['totalResults'] as int,
      );

  List<ServiceModel> results;
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
