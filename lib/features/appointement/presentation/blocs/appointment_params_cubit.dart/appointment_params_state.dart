part of './appointment_params_cubit.dart';

class AppointmentsParamsState extends Equatable {
  const AppointmentsParamsState({
    this.reason,
    this.date,
    this.timeslot,
    this.user,
    this.payed,
    this.paymentMethod,
    this.period,
    this.location,
    this.attachments,
    this.service,
    this.price,
    this.days,
    this.sessions,
  });
  final EveningMorning? period;
  final String? reason;
  final DateTime? date;
  final String? timeslot;
  final String? user;
  final bool? payed;
  final String? paymentMethod;
  final List<String?>? attachments;
  final Location? location;
  final String? service;
  final int? days;
  final int? price;
  final int? sessions;
  AppointmentsParamsState copyWith({
    String? reason,
    DateTime? date,
    String? timeslot,
    String? user,
    String? service,
    String? paymentMethod,
    List<String?>? attachments,
    Location? location,
    EveningMorning? period,
    int? price,
    int? sessions,
    int? days,
  }) {
    return AppointmentsParamsState(
      reason: reason ?? this.reason,
      date: date ?? this.date,
      attachments: attachments ?? this.attachments,
      timeslot: timeslot ?? this.timeslot,
      user: user ?? this.user,
      paymentMethod: paymentMethod ?? this.paymentMethod,
      location: location ?? this.location,
      period: period ?? this.period,
      service: service ?? this.service,
      price: price ?? this.price,
      sessions: sessions ?? this.sessions,
      days: days ?? this.days,
    );
  }

  CreateAppointmentParams toCreateAppointmentParams() =>
      CreateAppointmentParams(
        service: service!,
        attachments: attachments == null
            ? []
            : attachments!
                .where((element) => element != null)
                .map<String>((e) => e as String)
                .toList(),
        timeslot: timeslot,
        location: location,
        date: date,
        paymentMethod: paymentMethod,
        reason: reason,
        days: days,
        sessions: sessions,
        price: price,
      );
  @override
  List<Object?> get props => [
        reason,
        date,
        user,
        paymentMethod,
        attachments,
        location,
        period,
        timeslot,
        service,
        days,
        price,
        sessions
      ];
}