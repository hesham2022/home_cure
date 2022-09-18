import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/features/appointement/presentation/blocs/get_appointments_cubit/my_appointments_cubit..dart';
import 'package:home_cure/features/notifications/presentation/widgets/appintment_info_widget.dart';
import 'package:home_cure/features/notifications/presentation/widgets/notifications_tap.dart';
import 'package:home_cure/features/provider/presentation/blocs/notifications_cubit/notifications_cubit.dart';

class ProviderHome extends StatefulWidget {
  const ProviderHome({super.key});

  @override
  State<ProviderHome> createState() => _ProviderHomeState();
}

class _ProviderHomeState extends State<ProviderHome> {
  @override
  void initState() {
    context.read<MyAppointmentsCubit>().getMyAppointsFunc();
    context.read<NotificationsCubit>().getNotifications();

    // Hive.box<Map<dynamic, dynamic>>(userNotificationsBox)
    //   ..listenable().addListener(() {
    //     setState(() {});
    //   });
    super.initState();
  }

  ReqestNotificion initialValue = ReqestNotificion.request;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.all(35.w),
        child: Column(
          children: [
            SizedBox(
              height: 50.h,
            ),
            NotificationTapWidget(
              firstTitle: 'Completed',
              secondTitle: 'Pending',
              initialValue: ReqestNotificion.request,
              onChange: (v) {
                setState(() {
                  initialValue = v;
                });
              },
            ),
            SizedBox(
              height: 50.h,
            ),
            // if (initialValue == ReqestNotificion.notification)
            //   ListView.builder(
            //     physics: const NeverScrollableScrollPhysics(),
            //     shrinkWrap: true,
            //     itemCount: requests.length,
            //     itemBuilder: (c, i) => Container(
            //       margin: EdgeInsets.only(bottom: 30.h),

            //       // child: RequestInfoWidget(
            //       //   request: NotificationsModel(
            //       //     appointment:
            //       //   )
            //       //   requests[i],
            //       // ),
            //     ),
            //   )
            // else
            BlocBuilder<MyAppointmentsCubit, MyAppointmentsCubitState>(
              builder: (context, state) {
                if (state is MyAppointmentsCubitStateLoaded) {
                  final appointments =
                      initialValue == ReqestNotificion.notification
                          ? state.appointments
                              .where((element) => element.status != 'done')
                              .toList()
                          : state.appointments;
                  if (appointments.isEmpty) {
                    return const Center(
                      child: Text('No Appointments found  😥 😥'),
                    );
                  }
                  return ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: appointments.length,
                    itemBuilder: (c, i) => Container(
                      margin: EdgeInsets.only(bottom: 30.h),
                      child: AppointmentInfoWidget(
                        request: appointments[i],
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
            SizedBox(
              height: 50.h,
            ),
          ],
        ),
      ),
    );
  }
}
