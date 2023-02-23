import 'dart:convert';

import 'package:home_cure/features/appointement/domain/entities/appointment.dart';
import 'package:home_cure/features/appointement/domain/entities/create_appointment_params.dart';
import 'package:home_cure/features/authentication/data/models/user_model.dart';
import 'package:home_cure/features/home/domain/entities/timeslot.dart';

class AppointmentModel extends Appointment {
  const AppointmentModel({
    required super.location,
    required super.attachments,
    required super.status,
    required super.payed,
    required super.isVideo,
    required super.id,
    required super.reason,
    required super.date,
    required super.timeslot,
    required super.isTele,
    required super.user,
    required super.service,
    required super.paymentMethod,
    required super.rated,
    super.link,
    super.days,
    super.createdAt,
    super.sessions,
    super.providerComment,
    super.price,
    super.uid,
    super.videoToken,
    super.provider,
    super.details,
    required super.canceled,
  });
  factory AppointmentModel.fromEntity(Appointment entity) => AppointmentModel(
        location: entity.location,
        attachments: entity.attachments,
        status: entity.status,
        payed: entity.payed,
        isVideo: entity.isVideo,
        id: entity.id,
        isTele: entity.isTele,
        rated: entity.rated,
        reason: entity.reason,
        provider: entity.provider,
        date: entity.date,
        timeslot: entity.timeslot,
        user: entity.user,
        service: entity.service,
        videoToken: entity.videoToken,
        paymentMethod: entity.paymentMethod,
        canceled: entity.canceled,
        days: entity.days,
        providerComment: entity.providerComment,
        sessions: entity.sessions,
        price: entity.price,
        uid: entity.uid,
        createdAt: entity.createdAt,
        details: entity.details,
      );
  factory AppointmentModel.fromJson(String source) =>
      AppointmentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory AppointmentModel.fromMap(Map<dynamic, dynamic> map) {
    print('*' * 100);

    try {
      final a = AppointmentModel(
        location: Location.fromMap(map['location'] as Map<dynamic, dynamic>),
        attachments: List<String>.from(map['attachments'] as List<dynamic>),
        status: map['status'] as String,
        providerComment: map['providerComment'] as String?,
        payed: map['payed'] as bool,
        isTele: map['isTele'] as bool,
        provider: map['provider'] as String?,
        details: map['details'] != null
            ? Details.fromJson(
                map['details'] as Map<String, dynamic>,
              )
            : null,
        rated: map['rated'] as bool,
        createdAt: map['createdAt'] == null
            ? null
            : map['createdAt'] is int
                ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int)
                : DateTime.parse(map['createdAt'] as String),
        isVideo: map['isVideo'] as bool,
        id: map['id'] != null ? map['id'] as String : map['_id'] as String,
        reason: map['reason'] as String,
        date: map['date'] is int
            ? DateTime.fromMillisecondsSinceEpoch(map['date'] as int)
            : DateTime.parse(map['date'] as String),
        timeslot: TimeSlot.fromJson(map['timeslot'] as Map<dynamic, dynamic>),
        user: map['user'] as String,
        service: map['service'] as String,
        paymentMethod: map['paymentMethod'] as String,
        link: map['link'] as String?,
        canceled: map['canceled'] as bool,
        days: map['days'] as int?,
        price: map['price'] as int?,
        sessions: map['sessions'] as int?,
        videoToken: map['videoToken'] as String?,
        uid: map['uid'] as int?,
      );
    } catch (e, s) {
      print(e);
      print(s);
    }
    return AppointmentModel(
      location: Location.fromMap(map['location'] as Map<dynamic, dynamic>),
      attachments: List<String>.from(map['attachments'] as List<dynamic>),
      status: map['status'] as String,
      providerComment: map['providerComment'] as String?,
      payed: map['payed'] as bool,
      isTele: map['isTele'] as bool,
      provider: map['provider'] as String?,
      details: map['details'] != null
          ? Details.fromJson(
              map['details'] as Map<String, dynamic>,
            )
          : null,
      rated: map['rated'] as bool,
      createdAt: map['createdAt'] == null
          ? null
          : map['createdAt'] is int
              ? DateTime.fromMillisecondsSinceEpoch(map['createdAt'] as int)
              : DateTime.parse(map['createdAt'] as String),
      isVideo: map['isVideo'] as bool,
      id: map['id'] != null ? map['id'] as String : map['_id'] as String,
      reason: map['reason'] as String,
      date: map['date'] is int
          ? DateTime.fromMillisecondsSinceEpoch(map['date'] as int)
          : DateTime.parse(map['date'] as String),
      timeslot: TimeSlot.fromJson(map['timeslot'] as Map<String, dynamic>),
      user: map['user'] as String,
      service: map['service'] as String,
      paymentMethod: map['paymentMethod'] as String,
      link: map['link'] as String?,
      canceled: map['canceled'] as bool,
      days: map['days'] as int?,
      price: map['price'] as int?,
      sessions: map['sessions'] as int?,
      videoToken: map['videoToken'] as String?,
      uid: map['uid'] as int?,
    );
  }

  Map<String, dynamic> toMap() {
    final map = <String, dynamic>{
      'attachments': attachments,
      'status': status,
      'payed': payed,
      'isVideo': isVideo,
      'id': id,
      'reason': reason,
      'date': date.millisecondsSinceEpoch,
      'timeslot': timeslot.toJson(),
      'user': user,
      'service': service,
      'paymentMethod': paymentMethod,
      'link': link,
      'canceled': canceled,
      'rated': rated,
      'isTele': isTele,
    };
    if (providerComment != null) map['providerComment'] = providerComment;
    if (price != null) map['price'] = price;
    if (provider != null) map['provider'] = provider;

    if (days != null) map['days'] = days;
    if (sessions != null) map['sessions'] = sessions;
    if (videoToken != null) map['videoToken'] = videoToken;
    if (uid != null) map['uid'] = uid;
    if (location != null) {
      map.addAll(<String, dynamic>{
        'location': location!.toMap(),
      });
    }
    return map;
  }

  String toJson() => json.encode(toMap());
}
