import 'package:equatable/equatable.dart';
import 'package:home_cure/features/appointement/domain/entities/create_appointment_params.dart';
import 'package:home_cure/features/authentication/data/models/user_model.dart';
import 'package:home_cure/features/home/domain/entities/timeslot.dart';

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
    required this.rated,
    this.link,
    required this.canceled,
    this.days,
    this.createdAt,
    this.sessions,
    this.details,
    this.videoToken,
    required this.isTele,
    this.uid,
    this.price,
    this.providerComment,
    this.provider,
  });
  final String? providerComment;
  final String? provider;

  final Location? location;
  final List<String> attachments;
  final String status;
  final bool payed;
  final bool isVideo;
  final bool isTele;
  final Details? details;

  final String id;
  final String reason;
  final DateTime date;
  final DateTime? createdAt;

  final TimeSlot timeslot;
  final String user;
  final int? price;
  final String service;
  final String paymentMethod;
  final String? link;
  final bool canceled;
  final String? videoToken;
  final int? days;
  final int? uid;
  final bool rated;
  final int? sessions;
  Appointment copyWith({
    Location? location,
    List<String>? attachments,
    String? status,
    bool? payed,
    Details? details,
    bool? isVideo,
    String? id,
    String? reason,
    DateTime? date,
    bool? isTele,
    TimeSlot? timeslot,
    String? user,
    String? service,
    int? uid,
    bool? rated,
    DateTime? createdAt,
    String? paymentMethod,
    String? link,
    bool? canceled,
    int? days,
    String? videoToken,
    int? sessions,
  }) {
    return Appointment(
      location: location ?? this.location,
      attachments: attachments ?? this.attachments,
      status: status ?? this.status,
      payed: payed ?? this.payed,
      isVideo: isVideo ?? this.isVideo,
      id: id ?? this.id,
      uid: uid ?? this.uid,
      details: details ?? this.details,
      createdAt: createdAt ?? this.createdAt,
      rated: rated ?? this.rated,
      reason: reason ?? this.reason,
      date: date ?? this.date,
      isTele: isTele ?? this.isTele,
      timeslot: timeslot ?? this.timeslot,
      user: user ?? this.user,
      videoToken: videoToken ?? this.videoToken,
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
  bool get isVf => paymentMethod == 'vodafone cash';

  bool get isCash => paymentMethod == 'cash';
  bool get hasDays => days != null;
  bool get hasSessions => sessions != null;

  bool get hasVideoToken => videoToken != null;
  @override
  List<Object?> get props => [
        location,
        attachments,
        status,
        payed,
        isVideo,
        id,
        rated,
        reason,
        date,
        timeslot,
        isTele,
        user,
        service,
        paymentMethod,
        link,
        canceled,
        videoToken,
        uid,
        createdAt,
      ];
}
