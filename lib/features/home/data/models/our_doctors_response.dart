// To parse this JSON data, do
//
//     final OurDoctorsResponse = OurDoctorsResponseFromJson(jsonString);

import 'dart:convert';

import 'package:home_cure/features/authentication/data/models/user_model.dart';

OurDoctorsResponse ourDoctorsResponseFromJson(String str) =>
    OurDoctorsResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String ourDoctorsResponseToJson(OurDoctorsResponse data) =>
    json.encode(data.toJson());

class OurDoctorsResponse {
  OurDoctorsResponse({
    required this.results,
    required this.page,
    required this.limit,
    required this.totalPages,
    required this.totalResults,
  });
  factory OurDoctorsResponse.fromJson(Map<String, dynamic> json) =>
      OurDoctorsResponse(
        results: List<UserModel>.from(
          (json['results'] as List<dynamic>).map<UserModel>(
            (dynamic j) => UserModel.fromJson(j as Map<String, dynamic>),
          ),
        ),
        page: json['page'] as int,
        limit: json['limit'] as int,
        totalPages: json['totalPages'] as int,
        totalResults: json['totalResults'] as int,
      );

  List<UserModel> results;
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
