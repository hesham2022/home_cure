import 'dart:convert';

class ComplaintModel {
  ComplaintModel({
    required this.name,
    required this.email,
    required this.phoneNumber,
    required this.complaintment,
    required this.userPhoneNumber,
    this.number,
  });
  factory ComplaintModel.fromJson(String source) =>
      ComplaintModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory ComplaintModel.fromMap(Map<String, dynamic> map) {
    return ComplaintModel(
      name: map['name'] as String,
      email: map['email'] as String,
      phoneNumber: map['phoneNumber'] as String,
      complaintment: map['complaintment'] as String,
      userPhoneNumber: map['userPhoneNumber'] as String,
      number: (map['number'] as int).toString(),
    );
  }
  final String name;
  final String email;
  final String phoneNumber;
  final String? number;

  final String complaintment;
  final String userPhoneNumber;
  ComplaintModel copyWith({
    String? name,
    String? email,
    String? phoneNumber,
    String? complaintment,
    String? userPhoneNumber,
    String? number,
  }) {
    return ComplaintModel(
      name: name ?? this.name,
      userPhoneNumber: userPhoneNumber ?? this.userPhoneNumber,
      email: email ?? this.email,
      phoneNumber: phoneNumber ?? this.phoneNumber,
      complaintment: complaintment ?? this.complaintment,
      number: number ?? this.number,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'email': email,
      'phoneNumber': phoneNumber,
      'complaintment': complaintment,
      'userPhoneNumber': userPhoneNumber
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'ComplaintModel(name: $name, email: $email, phoneNumber: $phoneNumber, complaintment: $complaintment)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ComplaintModel &&
        other.name == name &&
        other.email == email &&
        other.phoneNumber == phoneNumber &&
        other.complaintment == complaintment;
  }

  @override
  int get hashCode {
    return name.hashCode ^
        email.hashCode ^
        phoneNumber.hashCode ^
        complaintment.hashCode;
  }
}
