import 'dart:convert';

import 'package:equatable/equatable.dart';
import 'package:home_cure/features/appointement/data/models/appoinmrnt_model.dart';
import 'package:home_cure/features/appointement/domain/entities/appointment.dart';

class NotificationsModel extends Equatable {
  const NotificationsModel({
    required this.appointment,
    required this.sentTime,
    required this.title,
  });
  // factory NotificationsModel.fromJson(String source) =>
  //     NotificationsModel.fromMap(json.decode(source) as Map<String, dynamic>);

  factory NotificationsModel.fromMap(Map<dynamic, dynamic> map, String title) {
    return NotificationsModel(
      title: title,
      appointment:
          AppointmentModel.fromMap(map['appointment'] as Map<dynamic, dynamic>),
      sentTime: DateTime.fromMillisecondsSinceEpoch(map['sentTime'] as int),
    );
  }
  final Appointment appointment;
  final DateTime sentTime;
  final String title;
  NotificationsModel copyWith({
    Appointment? appointment,
    DateTime? sentTime,
    String? title,
  }) {
    return NotificationsModel(
      appointment: appointment ?? this.appointment,
      sentTime: sentTime ?? this.sentTime,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'appointment': AppointmentModel.fromEntity(appointment).toMap(),
      'sentTime': sentTime.millisecondsSinceEpoch,
      'title': title
    };
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [appointment, sentTime, title];
}
