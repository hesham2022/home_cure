import 'dart:convert';

import 'package:home_cure/features/appointement/domain/entities/appointment.dart';
import 'package:home_cure/features/appointement/domain/entities/create_appointment_params.dart';

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
    required super.user,
    required super.service,
    required super.paymentMethod,
    super.link,
    super.days,
    super.sessions,
    super.providerComment,
    super.price,
    required super.canceled,
  });
  factory AppointmentModel.fromEntity(Appointment entity) => AppointmentModel(
        location: entity.location,
        attachments: entity.attachments,
        status: entity.status,
        payed: entity.payed,
        isVideo: entity.isVideo,
        id: entity.id,
        reason: entity.reason,
        date: entity.date,
        timeslot: entity.timeslot,
        user: entity.user,
        service: entity.service,
        paymentMethod: entity.paymentMethod,
        canceled: entity.canceled,
        days: entity.days,
        providerComment: entity.providerComment,
        sessions: entity.sessions,
        price: entity.price,
      );
  factory AppointmentModel.fromJson(String source) =>
      AppointmentModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory AppointmentModel.fromMap(Map<dynamic, dynamic> map) {
    return AppointmentModel(
      location: Location.fromMap(map['location'] as Map<dynamic, dynamic>),
      attachments: List<String>.from(map['attachments'] as List<dynamic>),
      status: map['status'] as String,
      providerComment: map['providerComment'] as String?,
      payed: map['payed'] as bool,
      isVideo: map['isVideo'] as bool,
      id: map['id'] != null ? map['id'] as String : map['_id'] as String,
      reason: map['reason'] as String,
      date: map['date'] is int
          ? DateTime.fromMillisecondsSinceEpoch(map['date'] as int)
          : DateTime.parse(map['date'] as String),
      timeslot: map['timeslot'] as String,
      user: map['user'] as String,
      service: map['service'] as String,
      paymentMethod: map['paymentMethod'] as String,
      link: map['link'] as String?,
      canceled: map['canceled'] as bool,
      days: map['days'] as int?,
      price: map['price'] as int?,
      sessions: map['sessions'] as int?,
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
      'timeslot': timeslot,
      'user': user,
      'service': service,
      'paymentMethod': paymentMethod,
      'link': link,
      'canceled': canceled,
    };
    if (providerComment != null) map['providerComment'] = providerComment;
    if (price != null) map['price'] = price;
    if (days != null) map['days'] = days;
    if (sessions != null) map['sessions'] = sessions;
    if (location != null) {
      map.addAll(<String, dynamic>{
        'location': location!.toMap(),
      });
    }
    return map;
  }

  String toJson() => json.encode(toMap());
}