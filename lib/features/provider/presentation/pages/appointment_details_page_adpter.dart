import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cure/di/get_it.dart';
import 'package:home_cure/features/appointement/domain/entities/appointment.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit.dart';
import 'package:home_cure/features/notifications/presentation/pages/appointment_details_page.dart';

// This Page is Just An A adpter
class AppointmentDetailsPageAdpter extends StatelessWidget {
  const AppointmentDetailsPageAdpter({super.key, required this.appointment});
  final Appointment appointment;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserCubit>(
      create: (context) => getIt(),
      child: AppointmentDetailsPage(appointment: appointment),
    );
  }
}
