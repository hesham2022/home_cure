// To parse this JSON data, do
//
//     final fbResponse = fbResponseFromJson(jsonString);

import 'dart:convert';

FbResponse fbResponseFromJson(String str) =>
    FbResponse.fromJson(json.decode(str) as Map<String, dynamic>);

String fbResponseToJson(FbResponse data) => json.encode(data.toJson());

class FbResponse {
  FbResponse({
    required this.name,
    required this.email,
    required this.picture,
    required this.id,
  });
  factory FbResponse.fromJson(Map<String, dynamic> json) => FbResponse(
        name: json['name'] as String,
        email: json['email'] as String,
        picture: Picture.fromJson(json['picture'] as Map<String, dynamic>),
        id: json['id'] as String,
      );

  String name;
  String email;
  Picture picture;
  String id;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'name': name,
        'email': email,
        'picture': picture.toJson(),
        'id': id,
      };
}

class Picture {
  Picture({
    required this.data,
  });
  factory Picture.fromJson(Map<String, dynamic> json) => Picture(
        data: Data.fromJson(json['data'] as Map<String, dynamic>),
      );

  Data data;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'data': data.toJson(),
      };
}

class Data {
  Data({
    required this.height,
    required this.isSilhouette,
    required this.url,
    required this.width,
  });
  factory Data.fromJson(Map<String, dynamic> json) => Data(
        height: json['height'] as int,
        isSilhouette: json['is_silhouette'] as bool,
        url: json['url'] as String,
        width: json['width'] as int,
      );

  int height;
  bool isSilhouette;
  String url;
  int width;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'height': height,
        'is_silhouette': isSilhouette,
        'url': url,
        'width': width,
      };
}
