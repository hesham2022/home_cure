// To parse this JSON data, do
//
//     final AdsResponse = AdsResponseFromJson(jsonString);

import 'dart:convert';

AdsResponse adsResponseFromJson(String str) =>
    AdsResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String adsResponseToJson(AdsResponse data) => json.encode(data.toJson());

class AdsResponse {
  AdsResponse({
    required this.results,
    required this.page,
    required this.limit,
    required this.totalPages,
    required this.totalResults,
  });
  factory AdsResponse.fromJson(Map<String, dynamic> json) => AdsResponse(
        results: List<Ad>.from(
          (json['results'] as List<dynamic>).map<Ad>(
            (dynamic j) => Ad.fromMap(j as Map<String, dynamic>),
          ),
        ),
        page: json['page'] as int,
        limit: json['limit'] as int,
        totalPages: json['totalPages'] as int,
        totalResults: json['totalResults'] as int,
      );

  List<Ad> results;
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

class Ad {
  Ad({
    required this.url,
    required this.description,
    required this.id,
    required this.title,
    required this.image,
  });
  factory Ad.fromJson(String source) =>
      Ad.fromMap(json.decode(source) as Map<String, dynamic>);

  factory Ad.fromMap(Map<String, dynamic> map) {
    return Ad(
      url: map['url'] as String,
      description: map['description'] as String,
      id: map['id'] as String,
      title: map['title'] as String,
      image: map['image'] as String,
    );
  }
  final String url;
  final String description;
  final String id;
  final String title;
  final String image;
  Ad copyWith({
    String? url,
    String? description,
    String? id,
    String? title,
    String? image,
  }) {
    return Ad(
      url: url ?? this.url,
      description: description ?? this.description,
      id: id ?? this.id,
      title: title ?? this.title,
      image: image ?? this.image,
    );
  }

  Map<dynamic, dynamic> toMap() {
    return <dynamic, dynamic>{
      'url': url,
      'description': description,
      'id': id,
      'image': image,
      'title': title,
    };
  }

  String toJson() => json.encode(toMap());
}
