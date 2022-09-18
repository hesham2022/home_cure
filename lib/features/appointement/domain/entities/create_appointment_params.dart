import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:equatable/equatable.dart';

class CreateAppointmentParams extends Equatable {
  const CreateAppointmentParams({
    this.reason,
    this.date,
    this.timeslot,
    this.payed,
    this.paymentMethod,
    this.attachments,
    this.location,
    this.days,
    this.sessions,
    this.price,
    required this.service,
  });

  final String? reason;
  final DateTime? date;
  final String? timeslot;
  final bool? payed;
  final String? paymentMethod;
  final List<String>? attachments;
  final String service;
  final Location? location;
  final int? price;
  final int? days;
  final int? sessions;

  CreateAppointmentParams copyWith({
    String? reason,
    DateTime? date,
    String? timeslot,
    String? service,
    String? paymentMethod,
    List<String>? attachments,
    Location? location,
    int? price,
    int? days,
    int? sessions,
  }) {
    return CreateAppointmentParams(
      reason: reason ?? this.reason,
      date: date ?? this.date,
      timeslot: timeslot ?? this.timeslot,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      attachments: attachments ?? this.attachments,
      location: location ?? this.location,
      service: service ?? this.service,
      price: price ?? this.price,
      sessions: sessions ?? this.sessions,
      days: days ?? this.days,
    );
  }

  Future<Map<String, dynamic>> toMap() async {
    final multiparts =
        Future.wait([for (var i in attachments!) MultipartFile.fromFile(i)]);
    final map = <String, dynamic>{
      'reason': reason,
      'date': date!.toIso8601String(),
      'timeslot': timeslot,
      'paymentMethod': paymentMethod,
      'attachments': await multiparts,
      'location': location?.toMap(),
      'service': service
    };
    if (days != null) {
      map['days'] = days;
    }
    if (price != null) {
      map['price'] = price;
    }
    if (sessions != null) {
      map['sessions'] = sessions;
    }
    return map;
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props =>
      [reason, date, paymentMethod, attachments, location];
}

class Location extends Equatable {
  const Location({
    required this.coordinates,
    required this.address,
  });

  factory Location.fromJson(String source) =>
      Location.fromMap(json.decode(source) as Map<String, dynamic>);

  factory Location.fromMap(Map<dynamic, dynamic> map) {
    return Location(
      coordinates: List<num>.from(map['coordinates'] as List<dynamic>)
          .map((e) => e.toDouble())
          .toList(),
      address: map['address'] as String? ?? '',
    );
  }
  final List<double> coordinates;
  final String address;

  Location copyWith({
    List<double>? coordinates,
    String? address,
  }) {
    return Location(
      coordinates: coordinates ?? this.coordinates,
      address: address ?? this.address,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'coordinates': coordinates,
      'address': address,
    };
  }

  String toJson() => json.encode(toMap());

  @override
  List<Object?> get props => [coordinates, address];
}
