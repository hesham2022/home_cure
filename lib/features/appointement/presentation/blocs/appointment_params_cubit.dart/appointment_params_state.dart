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
    this.allergic,
    this.sessions,
    this.discount,
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
  final int? discount;

  final int? sessions;
  final bool? allergic;
  AppointmentsParamsState copyWith({
    String? reason,
    DateTime? date,
    String? timeslot,
    int? discount,
    String? user,
    String? service,
    String? paymentMethod,
    List<String?>? attachments,
    Location? location,
    EveningMorning? period,
    int? price,
    int? sessions,
    bool? allergic,
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
      discount: discount ?? this.discount,
      service: service ?? this.service,
      allergic: allergic ?? this.allergic,
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
        priceDiscount: discount,
        allergic: allergic,
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
        discount,
        period,
        timeslot,
        service,
        days,
        price,
        sessions,
        allergic
      ];
}
