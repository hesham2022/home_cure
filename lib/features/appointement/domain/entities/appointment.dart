import 'package:equatable/equatable.dart';
import 'package:home_cure/features/appointement/domain/entities/create_appointment_params.dart';

class Appointment extends Equatable {
  const Appointment({
    required this.location,
    required this.attachments,
    required this.status,
    required this.payed,
    required this.isVideo,
    required this.id,
    required this.reason,
    required this.date,
    required this.timeslot,
    required this.user,
    required this.service,
    required this.paymentMethod,
    this.link,
    required this.canceled,
    this.days,
    this.sessions,
    this.price,
    this.providerComment,
  });
  final String? providerComment;
  final Location? location;
  final List<String> attachments;
  final String status;
  final bool payed;
  final bool isVideo;
  final String id;
  final String reason;
  final DateTime date;
  final String timeslot;
  final String user;
  final int? price;
  final String service;
  final String paymentMethod;
  final String? link;
  final bool canceled;
  final int? days;
  final int? sessions;
  Appointment copyWith({
    Location? location,
    List<String>? attachments,
    String? status,
    bool? payed,
    bool? isVideo,
    String? id,
    String? reason,
    DateTime? date,
    String? timeslot,
    String? user,
    String? service,
    String? paymentMethod,
    String? link,
    bool? canceled,
    int? days,
    int? sessions,
  }) {
    return Appointment(
      location: location ?? this.location,
      attachments: attachments ?? this.attachments,
      status: status ?? this.status,
      payed: payed ?? this.payed,
      isVideo: isVideo ?? this.isVideo,
      id: id ?? this.id,
      reason: reason ?? this.reason,
      date: date ?? this.date,
      timeslot: timeslot ?? this.timeslot,
      user: user ?? this.user,
      service: service ?? this.service,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      link: link ?? this.link,
      canceled: canceled ?? this.canceled,
      days: days ?? this.days,
      sessions: sessions ?? this.sessions,
    );
  }

  bool get isOpened => status == 'opened';
  bool get isWaiting => status == 'waiting';
  bool get isOnPeocessing => status == 'onprocessing';
  bool get isDone => status == 'done';
  bool get isCredifCard => paymentMethod == 'credit card';
  bool get isCash => paymentMethod == 'cash';
  bool get hasDays => days != null;
  bool get hasSessions => sessions != null;

  @override
  List<Object?> get props => [
        location,
        attachments,
        status,
        payed,
        isVideo,
        id,
        reason,
        date,
        timeslot,
        user,
        service,
        paymentMethod,
        link,
        canceled,
      ];
}
