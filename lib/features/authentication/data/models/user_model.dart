// To parse this JSON data, do
//
//     final userModel = userModelFromJson(jsonString);

import 'dart:convert';

import 'package:home_cure/features/authentication/domain/entities/entities.dart';

UserModel userModelFromJson(String str) =>
    UserModel.fromJson(json.decode(str) as Map<String, dynamic>);

String userModelToJson(UserModel data) => json.encode(data.toJson());

class UserModel extends User {
  const UserModel({
    required super.details,
    required super.role,
    required super.isEmailVerified,
    required super.isOtpVerified,
    required super.name,
    required super.fcm,
    super.email,
    required super.phoneNumber,
    required super.birthOfDate,
    required super.id,
    super.gender,
    super.photo,
    super.active,
    super.qualifications,
    super.specialization,
    super.experience,
    super.degree,
  });
  factory UserModel.fromJson(Map<String, dynamic> json) => UserModel(
        details: (json['role'] as String) != 'user'
            ? Details.empty()
            : Details.fromJson(json['details'] as Map<String, dynamic>),
        role: json['role'] as String,
        isEmailVerified: (json['isEmailVerified'] as bool?) ?? false,
        isOtpVerified: (json['isOtpVerified'] as bool?) ?? false,
        name: json['name'] as String,
        email: json['email'] as String?,
        fcm: (json['fcm'] as String?) ?? '',
        photo: json['photo'] as String?,
        phoneNumber: json['phoneNumber'] as String,
        birthOfDate: DateTime.parse(json['birthOfDate'] as String),
        id: json['id'] != null ? json['id'] as String : json['_id'] as String,
        gender: json['gender'] as String?,
        active: json['active'] as bool?,
        qualifications: json['qualifications'] == null
            ? null
            : List<Qualification>.from(
                (json['qualifications'] as List<dynamic>).map<Qualification>(
                  (dynamic j) =>
                      Qualification.fromJson(j as Map<String, dynamic>),
                ),
              ),
        specialization: json['specialization'] as String?,
        experience: json['experience'] as int?,
        degree: json['degree'] as String?,

        //     (json['specialization'] as List<dynamic>?) as List<String>?,
      );

  Map<String, dynamic> toJson() => <String, dynamic>{
        'details': details.toJson(),
        'role': role,
        'isEmailVerified': isEmailVerified,
        'isOtpVerified': isOtpVerified,
        'name': name,
        'email': email,
        'gender': gender,
        'phoneNumber': phoneNumber,
        'photo': photo,
        'birthOfDate': birthOfDate.toIso8601String(),
        'id': id,
        'experience': experience,
        'degree': degree
      };
}

class Details {
  Details({
    required this.medicines,
    required this.allergy,
    required this.preSurgeries,
    required this.complaintments,
    required this.chDiseases,
    required this.attachments,
    required this.smoke,
    required this.alcohol,
    required this.height,
    required this.weight,
    required this.bloodType,
  });
  factory Details.empty() => Details(
        allergy: [],
        chDiseases: [],
        complaintments: [],
        smoke: false,
        height: 0,
        weight: 0,
        alcohol: false,
        attachments: [],
        bloodType: '',
        medicines: [],
        preSurgeries: [],
      );
  factory Details.fromJson(Map<String, dynamic> json) => Details(
        medicines: List<Medicine>.from(
          (json['medicines'] as List<dynamic>).map<Medicine>(
            (dynamic e) => Medicine.fromJson(e as Map<String, dynamic>),
          ),
        ),
        allergy: List<Allergy>.from(
          (json['allergy'] as List<dynamic>).map<Allergy>(
            (dynamic e) => Allergy.fromJson(e as Map<String, dynamic>),
          ),
        ),
        preSurgeries: List<Allergy>.from(
          (json['preSurgeries'] as List<dynamic>).map<Allergy>(
            (dynamic e) => Allergy.fromJson(e as Map<String, dynamic>),
          ),
        ),
        complaintments: List<Allergy>.from(
          (json['complaintments'] as List<dynamic>).map<Allergy>(
            (dynamic e) => Allergy.fromJson(e as Map<String, dynamic>),
          ),
        ),
        chDiseases: List<Allergy>.from(
          (json['chDiseases'] as List<dynamic>).map<Allergy>(
            (dynamic e) => Allergy.fromJson(e as Map<String, dynamic>),
          ),
        ),
        attachments: List<Attachment>.from(
          (json['attachments'] as List<dynamic>).map<Attachment>(
            (dynamic e) => Attachment.fromJson(e as Map<String, dynamic>),
          ),
        ),
        smoke: (json['smoke'] as bool?) ?? false,
        alcohol: (json['alcohol'] as bool?) ?? false,
        height: (json['height'] as int?) ?? 0,
        weight: (json['weight'] as int?) ?? 0,
        bloodType: (json['bloodType'] as String?) ?? '',
      );
  Details copyWith({
    List<Medicine>? medicines,
    List<Allergy>? allergy,
    List<Allergy>? preSurgeries,
    List<Allergy>? complaintments,
    List<Allergy>? chDiseases,
    List<Attachment>? attachments,
    bool? smoke,
    bool? alcohol,
    int? height,
    int? weight,
    String? bloodType,
  }) =>
      Details(
        bloodType: bloodType ?? this.bloodType,
        preSurgeries: preSurgeries ?? this.preSurgeries,
        medicines: medicines ?? this.medicines,
        allergy: allergy ?? this.allergy,
        alcohol: alcohol ?? this.alcohol,
        attachments: attachments ?? this.attachments,
        weight: weight ?? this.weight,
        height: height ?? this.height,
        smoke: smoke ?? this.smoke,
        complaintments: complaintments ?? this.complaintments,
        chDiseases: chDiseases ?? this.chDiseases,
      );

  List<Medicine> medicines;
  List<Allergy> allergy;
  List<Allergy> preSurgeries;
  List<Allergy> complaintments;
  List<Allergy> chDiseases;
  List<Attachment> attachments;
  bool smoke;
  bool alcohol;
  int height;
  int weight;
  String bloodType;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{
      'medicines': List<dynamic>.from(
        medicines.map<Map<String, dynamic>>((x) => x.toJson()),
      ),
      'allergy': List<dynamic>.from(
        allergy.map<Map<String, dynamic>>((x) => x.toJson()),
      ),
      'preSurgeries': List<dynamic>.from(
        preSurgeries.map<Map<String, dynamic>>((x) => x.toJson()),
      ),
      'complaintments': List<dynamic>.from(
        complaintments.map<Map<String, dynamic>>((x) => x.toJson()),
      ),
      'chDiseases': List<dynamic>.from(
        chDiseases.map<Map<String, dynamic>>((x) => x.toJson()),
      ),
      'attachments': List<dynamic>.from(
        attachments.map<Map<String, dynamic>>((x) => x.toJson()),
      ),
      'smoke': smoke,
      'alcohol': alcohol,
      'height': height,
      'weight': weight,
    };
    if (bloodType.isNotEmpty) map['bloodType'] = bloodType;

    return map;
  }
}

class Allergy {
  Allergy({
    required this.date,
    required this.id,
    required this.description,
  });
  factory Allergy.fromJson(Map<String, dynamic> json) => Allergy(
        date: DateTime.parse(json['date'] as String),
        id: json['_id'] as String,
        description: json['description'] as String,
      );

  DateTime date;
  String id;
  String description;

  Map<String, dynamic> toJson() => <String, dynamic>{
        // 'date': date.toIso8601String(),
        // '_id': id,
        'description': description,
      };
}

class Attachment {
  Attachment({
    required this.date,
    required this.id,
    required this.url,
    required this.name,
  });
  factory Attachment.fromJson(Map<String, dynamic> json) {
    return Attachment(
      date: DateTime.parse(json['date'] as String),
      id: json['_id'] as String,
      url: json['url'] as String,
      name: json['name'] as String,
    );
  }

  DateTime date;
  String id;
  String url;
  String name;

  Map<String, dynamic> toJson() => <String, dynamic>{
        // 'date': date.toIso8601String(),
        // '_id': id,
        'url': url,
        'name': name,
      };
}

class Medicine {
  Medicine({
    required this.date,
    required this.id,
    required this.name,
  });
  factory Medicine.fromJson(Map<String, dynamic> json) => Medicine(
        date: DateTime.parse(json['date'] as String),
        id: json['_id'] as String,
        name: json['name'] as String,
      );

  DateTime date;
  String id;
  String name;

  Map<String, dynamic> toJson() => <String, dynamic>{
        // 'date': date.toIso8601String(),
        // '_id': id,
        'name': name,
      };
}

class Qualification {
  Qualification({
    required this.title,
    required this.id,
    required this.attachment,
  });
  factory Qualification.fromJson(Map<String, dynamic> json) {
    return Qualification(
      title: json['title'] == null ? '' : json['title'] as String,
      id: json['_id'] as String,
      attachment: json['attachment'] as String,
    );
  }

  String title;
  String id;
  String attachment;

  Map<String, dynamic> toJson() => <String, dynamic>{
        // 'date': date.toIso8601String(),
        // '_id': id,
        'title': title,
        'attachment': attachment,
      };
}
