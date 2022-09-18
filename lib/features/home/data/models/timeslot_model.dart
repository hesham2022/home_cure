import 'package:home_cure/features/home/domain/entities/timeslot.dart';

class TimeSlotModel extends TimeSlot {
  const TimeSlotModel({
    required super.startMinute,
    required super.endMinute,
    required super.startHour,
    required super.endHour,
    required super.startSting,
    required super.endSting,
    required super.id,
  }) : super();
  factory TimeSlotModel.fromJson(Map<String, dynamic> json) => TimeSlotModel(
        startMinute: json['startMinute'] as int,
        endMinute: json['endMinute'] as int,
        startHour: json['startHour'] as int,
        endHour: json['endHour'] as int,
        startSting: json['startSting'] as String,
        endSting: json['endSting'] as String,
        id: json['id'] as String,
      );

  @override
  Map<String, dynamic> toJson() => <String, dynamic>{
        'startMinute': startMinute,
        'endMinute': endMinute,
        'startHour': startHour,
        'endHour': endHour,
        'startSting': startSting,
        'endSting': endSting,
        'id': id,
      };
}