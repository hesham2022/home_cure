//ignore_for_file: constant_identifier_names
import 'package:equatable/equatable.dart';
import 'package:home_cure/features/authentication/data/models/user_model.dart';

class User extends Equatable {
  const User({
    required this.details,
    required this.role,
    required this.isEmailVerified,
    required this.isOtpVerified,
    required this.name,
    this.email,
    required this.phoneNumber,
    required this.birthOfDate,
    required this.fcm,
    required this.id,
    this.qualifications,
    this.active,
    this.specialization,
    this.experience,
    this.degree,
    this.gender,
    this.photo,
  });
  static User empty = User(
    name: '',
    role: 'user',
    id: '',
    phoneNumber: '',
    isEmailVerified: false,
    fcm: '',
    isOtpVerified: false,
    birthOfDate: DateTime.now(),
    details: Details(
      attachments: [],
      chDiseases: [],
      complaintments: [],
      preSurgeries: [],
      allergy: [],
      medicines: [],
      bloodType: '',
      alcohol: false,
      weight: 0,
      height: 0,
      smoke: false,
    ),
  );

  final Details details;
  final String role;
  final bool isEmailVerified;
  final bool isOtpVerified;

  final String name;
  final String? photo;
  final String fcm;
  final String? email;
  final String phoneNumber;
  final DateTime birthOfDate;
  final String id;
  final String? gender;
  //TODO THIS IS PROVIDET DETAILS
  final String? specialization;
  final int? experience;
  final String? degree;

  final List<Qualification>? qualifications;
  final bool? active;
  bool get isUser => role == 'user';
  @override
  List<Object?> get props => [name, email, phoneNumber];

  User copyWith({
    Details? details,
    String? role,
    bool? isEmailVerified,
    bool? isOtpVerified,
    String? name,
    String? photo,
    String? fcm,
    String? email,
    String? phoneNumber,
    DateTime? birthOfDate,
    String? id,
    String? gender,
    String? specialization,
    int? experience,
    String? degree,
    List<Qualification>? qualifications,
    bool? active,
  }) {
    return User(
      details: details ?? this.details,
      role: role ?? this.role,
      isEmailVerified: isEmailVerified ?? this.isEmailVerified,
      isOtpVerified: isOtpVerified ?? this.isOtpVerified,
      name: name ?? this.name,
      photo: photo ?? this.photo,
      fcm: fcm ?? this.fcm,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      birthOfDate: birthOfDate ?? this.birthOfDate,
      id: id ?? this.id,
      gender: gender ?? this.gender,
      specialization: specialization ?? this.specialization,
      qualifications: qualifications ?? this.qualifications,
      active: active ?? this.active,
      experience: experience ?? this.experience,
      degree: degree ?? this.degree,
    );
  }
}
