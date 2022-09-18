import 'package:equatable/equatable.dart';

class TimeSlot extends Equatable {
  const TimeSlot({
    required this.startMinute,
    required this.endMinute,
    required this.startHour,
    required this.endHour,
    required this.startSting,
    required this.endSting,
    required this.id,
  });
  factory TimeSlot.fromJson(Map<String, dynamic> json) => TimeSlot(
        startMinute: json['startMinute'] as int,
        endMinute: json['endMinute'] as int,
        startHour: json['startHour'] as int,
        endHour: json['endHour'] as int,
        startSting: json['startSting'] as String,
        endSting: json['endSting'] as String,
        id: json['id'] as String,
      );

  final int startMinute;
  final int endMinute;
  final int startHour;
  final int endHour;
  final String startSting;
  final String endSting;
  final String id;

  Map<String, dynamic> toJson() => <String, dynamic>{
        'startMinute': startMinute,
        'endMinute': endMinute,
        'startHour': startHour,
        'endHour': endHour,
        'startSting': startSting,
        'endSting': endSting,
        'id': id,
      };

  @override
  List<Object?> get props => [
        id,
        startMinute,
        startHour,
        endMinute,
        endHour,
        startSting,
        endSting,
      ];
}
