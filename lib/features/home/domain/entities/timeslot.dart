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
        startSting:
            getTimeString(json['startHour'] as int, json['startMinute'] as int),
        endSting:
            getTimeString(json['endHour'] as int, json['endMinute'] as int),
        id: json['_id'] as String,
      );
  static String getTimeString(int h, int m) {
    final period = h < 12 ? 'AM' : 'PM';
    final hours = h % 12 == 0 ? 12 : h % 12;
    return '$hours:$m $period';
  }

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
