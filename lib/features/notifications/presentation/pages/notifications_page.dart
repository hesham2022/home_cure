import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/app.dart';
import 'package:home_cure/core/mdels/notification_mode.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/features/appointement/presentation/blocs/get_appointments_cubit/my_appointments_cubit..dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit_state.dart';
import 'package:home_cure/features/notifications/presentation/widgets/appintment_info_widget.dart';
import 'package:home_cure/features/notifications/presentation/widgets/notifications_tap.dart';
import 'package:home_cure/gen/assets.gen.dart';

enum RequestStatus { inProgress, completed, done, cancelled }

class Request {
  Request({
    required this.status,
    this.missed = false,
  });
  final bool missed;

  final RequestStatus status;
}

final requests = [
  Request(status: RequestStatus.completed),
  Request(status: RequestStatus.inProgress),
  Request(status: RequestStatus.completed),
  Request(status: RequestStatus.inProgress),
  Request(status: RequestStatus.completed),
  Request(status: RequestStatus.inProgress),
  Request(status: RequestStatus.completed),
  Request(status: RequestStatus.inProgress),
  Request(status: RequestStatus.completed),
  Request(status: RequestStatus.inProgress),
];
final requests2 = [
  Request(status: RequestStatus.completed, missed: true),
  Request(status: RequestStatus.inProgress),
  Request(status: RequestStatus.completed, missed: true),
  Request(status: RequestStatus.inProgress, missed: true),
  Request(status: RequestStatus.completed),
  Request(status: RequestStatus.inProgress, missed: true),
  Request(status: RequestStatus.completed),
  Request(status: RequestStatus.inProgress, missed: true),
  Request(status: RequestStatus.completed),
  Request(status: RequestStatus.inProgress),
];

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
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
            if (initialValue == ReqestNotificion.notification)
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: requests.length,
                itemBuilder: (c, i) => Container(
                  margin: EdgeInsets.only(bottom: 30.h),
                  // child: RequestInfoWidget(
                  //   request: requests[i],
                  // ),
                ),
              )
            else
              BlocBuilder<MyAppointmentsCubit, MyAppointmentsCubitState>(
                builder: (context, state) {
                  if (state is MyAppointmentsCubitStateLoaded) {
                    final appointments = state.appointments;
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

class RequestInfoWidget extends StatelessWidget {
  const RequestInfoWidget({
    super.key,
    required this.request,
  });

  final NotificationsModel request;
  String getStatus() {
    if (request.appointment.isWaiting) {
      return 'Accepted';
    }
    if (request.appointment.isOnPeocessing) {
      return 'On Processing';
    }
    if (request.appointment.isDone) {
      return 'Completed';
    }
    return 'Pending';
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final isUser = (context.read<UserCubit>().state as UserCubitStateLoaded)
            .user
            .isUser;
        if (isUser) {
          context.router.push(
            AppointmentDetailsPageRoute(appointment: request.appointment),
          );
        } else {
          context.router.push(
            AppointmentDetailsPageAdpterRoute(
              appointment: request.appointment,
            ),
          );
        }
        // context.router.push(AppointmentDetailsPageRoute(appointment: request.appointment));
      },
      child: LayoutBuilder(
        builder: (c, s) {
          return Row(
            children: [
              Container(
                height: 100.h,
                width: 6,
                color: request.appointment.isDone ? primaryColor : seocondColor,
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Container(
                  height: 100.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(10),
                    child: Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Container(
                                alignment: Alignment.center,
                                padding: const EdgeInsets.symmetric(
                                  horizontal: 6,
                                ),
                                height: 20.h,
                                width: 80.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: request.appointment.status == 'waiting'
                                      ? const Color(0xffD74B7F).withOpacity(.2)
                                      : request.appointment.status == 'done'
                                          ? const Color(0xff0A84E1)
                                              .withOpacity(.2)
                                          : const Color(0xff1AA9A0)
                                              .withOpacity(.2),
                                ),
                                child: Text(
                                  getStatus(),
                                  style: textStyleWithSecondSemiBold.copyWith(
                                    fontSize: 12.sp,
                                    height: 1,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 10.h,
                              ),
                              Text(
                                'Call Request',
                                style: textStyleWithPrimarySemiBold.copyWith(
                                  fontSize: 14.sp,
                                  height: 1,
                                  color: const Color(0xff5D6C7A),
                                ),
                              )
                            ],
                          ),
                        ),
                        //
                        Container(
                          width: 1,
                          color: primaryColor,
                        ),
                        SizedBox(
                          width: (s.maxWidth / 2) + 10,
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Friday',
                                      style: textStyleWithPrimarySemiBold
                                          .copyWith(fontSize: 14.sp),
                                    ),
                                    Text(
                                      '25 June 2022',
                                      style:
                                          textStyleWithPrimarySemiBold.copyWith(
                                        fontSize: 12.sp,
                                        color: const Color(0xff5D6C7A),
                                      ),
                                    ),
                                    Text(
                                      '05:52 PM',
                                      style:
                                          textStyleWithPrimarySemiBold.copyWith(
                                        fontSize: 12.sp,
                                        color: const Color(0xff5D6C7A),
                                      ),
                                    ),
                                    Text(
                                      'Number: 20010000000000',
                                      style:
                                          textStyleWithSecondSemiBold.copyWith(
                                        fontSize: 8.sp,
                                        color: const Color(0xff5D6C7A),
                                      ),
                                    ),
                                  ],
                                ),
                                Assets.svg.phone3.svg(
                                  color: request.appointment.isOpened
                                      ? const Color(0xffD74B7F)
                                      : request.appointment.isDone
                                          ? null
                                          : seocondColor,
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
