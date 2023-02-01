import 'dart:convert';

// {
//   v: String,

//   aboutUs: {
//     type: String,
//   },
//   facebook: {
//     type: String,
//     trim: true,
//   },
//   twitter: String,
//   maintainceMode: {
//     type: Boolean,
//     default: false,
//   },

//   insta: String,
//   phone: String,
//   website: String,
//   email: String,
//   address: String,
// },
class ComapnySettingsModel {
  ComapnySettingsModel({
    required this.aboutUs,
    required this.facebook,
    required this.twitter,
    required this.insta,
    required this.phone,
    required this.website,
    required this.email,
    required this.address,
    required this.privacy,
    required this.phones,
    this.aboutUsAr,
    this.privacyAr,
  });
  factory ComapnySettingsModel.fromJson(String source) =>
      ComapnySettingsModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  factory ComapnySettingsModel.fromMap(Map<String, dynamic> map) {
    print('*' * 200);
    print(map['aboutUsAr']);
    return ComapnySettingsModel(
      aboutUs: map['aboutUs'] as String,
      aboutUsAr: map['aboutUsAr'] as String?,
      facebook: map['facebook'] as String,
      twitter: map['twitter'] as String,
      insta: map['insta'] as String,
      phone: map['phone'] as String,
      website: map['website'] as String,
      email: map['email'] as String,
      address: map['address'] as String,
      phones: (map['phones'] as List<dynamic>)
          .map((dynamic e) => e as String)
          .toList(),
      privacy: map['privacy'] as String,
      privacyAr: map['privacyAr'] as String?,
    );
  }
  final String aboutUs;
  final String? aboutUsAr;

  final String facebook;
  final String twitter;
  final String insta;
  final String phone;
  final String website;
  final String email;
  final String address;
  final String privacy;
  final String? privacyAr;
  final List<String> phones;
  ComapnySettingsModel copyWith({
    String? aboutUs,
    String? aboutUsAr,
    String? facebook,
    String? twitter,
    String? insta,
    String? phone,
    String? website,
    String? email,
    String? address,
    String? privacy,
    List<String>? phones,
    String? privacyAr,
  }) {
    return ComapnySettingsModel(
      aboutUs: aboutUs ?? this.aboutUs,
      aboutUsAr: aboutUsAr ?? this.aboutUsAr,
      facebook: facebook ?? this.facebook,
      twitter: twitter ?? this.twitter,
      insta: insta ?? this.insta,
      phone: phone ?? this.phone,
      website: website ?? this.website,
      email: email ?? this.email,
      address: address ?? this.address,
      privacy: privacy ?? this.privacy,
      privacyAr: privacyAr ?? this.privacyAr,
      phones: phones ?? this.phones,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'aboutUs': aboutUs,
      'aboutUsAr': aboutUsAr,
      'privacy': privacy,
      'privacyAr': privacyAr,
      'facebook': facebook,
      'twitter': twitter,
      'insta': insta,
      'phone': phone,
      'phones': phones,
      'website': website,
      'email': email,
      'address': address,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  String toString() {
    return 'ComapnySettingsModel(aboutUs: $aboutUs, facebook: $facebook, twitter: $twitter, insta: $insta, phone: $phone, website: $website, email: $email, address: $address)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is ComapnySettingsModel &&
        other.aboutUs == aboutUs &&
        other.facebook == facebook &&
        other.twitter == twitter &&
        other.insta == insta &&
        other.phone == phone &&
        other.website == website &&
        other.email == email &&
        other.address == address;
  }

  @override
  int get hashCode {
    return aboutUs.hashCode ^
        facebook.hashCode ^
        twitter.hashCode ^
        insta.hashCode ^
        phone.hashCode ^
        website.hashCode ^
        email.hashCode ^
        address.hashCode;
  }
}
