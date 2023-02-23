import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/app.dart';
import 'package:home_cure/core/mdels/notification_mode.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/utils/fcm_utils.dart';
import 'package:home_cure/features/appointement/presentation/blocs/get_appointments_cubit/my_appointments_cubit..dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit_state.dart';
import 'package:home_cure/features/home/presentation/blocs/timeslot_cubit/timeslot_cubit.dart';
import 'package:home_cure/features/notifications/presentation/widgets/appintment_info_widget.dart';
import 'package:home_cure/features/notifications/presentation/widgets/notifications_tap.dart';
import 'package:home_cure/features/provider/presentation/blocs/notifications_cubit/notifications_cubit.dart';
import 'package:home_cure/gen/assets.gen.dart';
import 'package:home_cure/l10n/l10n.dart';
import 'package:intl/intl.dart';

enum RequestStatus { inProgress, completed, done, cancelled }

class NotificationsPage extends StatefulWidget {
  const NotificationsPage({super.key});

  @override
  State<NotificationsPage> createState() => _NotificationsPageState();
}

class _NotificationsPageState extends State<NotificationsPage> {
  ReqestNotificion initialValue = ReqestNotificion.request;
  @override
  Widget build(BuildContext context) {
    if (context.read<NotificationsBudgeCubit>().state > 0) {
      context.read<NotificationsBudgeCubit>().read();
    }
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Center(child: Assets.img.logo.image(height: 70, width: 70)),
            SizedBox(
              height: 25.h,
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
              height: 25.h,
            ),
            if (initialValue == ReqestNotificion.notification)
              BlocBuilder<NotificationsCubit, NotificationsCubitState>(
                builder: (context, state) {
                  if (state is NotificationsCubitStateLoaded) {
                    return state.appointments.isEmpty
                        ? Text(context.l10n.emptyData)
                        : ListView.builder(
                            physics: const NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.appointments.length,
                            itemBuilder: (c, i) => Container(
                              margin: EdgeInsets.only(bottom: 30.h),
                              child: RequestInfoWidget(
                                request:
                                    state.appointments.reversed.toList()[i],
                              ),
                            ),
                          );
                  }
                  return const SizedBox();
                },
              )
            else
              BlocBuilder<MyAppointmentsCubit, MyAppointmentsCubitState>(
                builder: (context, state) {
                  if (state is MyAppointmentsCubitStateLoaded) {
                    final appointments = state.appointments.reversed.toList();
                    return appointments.isEmpty
                        ? Text(context.l10n.emptyData)
                        : ListView.builder(
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

class RequestInfoWidget extends StatefulWidget {
  const RequestInfoWidget({
    super.key,
    required this.request,
  });

  final NotificationsModel request;

  @override
  State<RequestInfoWidget> createState() => _RequestInfoWidgetState();
}

class _RequestInfoWidgetState extends State<RequestInfoWidget> {
  // String getStatus() {
  String? local;

  String getStatus(BuildContext context) {
    if (widget.request.appointment.isWaiting) {
      return context.l10n.accepted;
    }
    if (widget.request.appointment.isOnPeocessing) {
      return context.l10n.onProccessing;
    }
    if (widget.request.appointment.isDone) {
      return context.l10n.completed;
    }
    return context.l10n.pending;
  }

  Color getColor() {
    if (widget.request.appointment.isOpened) return seocondColor;
    if (widget.request.appointment.isWaiting) return seocondColor;
    if (widget.request.appointment.isOnPeocessing) return seocondColor;

    return primaryColor;
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        local = Localizations.maybeLocaleOf(context)?.toLanguageTag();
      });
    });
    super.initState();
  }

  Widget getIcon() {
    if (widget.request.appointment.isVideo) {
      return Icon(
        Icons.video_call,
        color: getColor(),
      );
    }
    if (widget.request.appointment.isTele) {
      return Assets.svg.phone3.svg(
        color: getColor(),
      );
    }
    return Icon(
      Icons.location_pin,
      color: getColor(),
    );
  }

  String getAgo(BuildContext context) {
    final duration = DateTime.now().difference(widget.request.sentTime);
    if (duration.inDays > 0) {
      return '${duration.inDays} ${context.l10n.day}';
    }
    if (duration.inHours > 0) {
      return '${duration.inHours} ${context.l10n.hours}';
    }
    if (duration.inMinutes > 0) {
      return '${duration.inMinutes} ${context.l10n.minutes}';
    }
    return '';
  }

  String getTitleString(BuildContext context) {
    if (widget.request.appointment.isVideo) {
      return context.l10n.videoRequest;
    }
    if (widget.request.appointment.isTele) {
      return context.l10n.callRequest;
    }
    return context.l10n.appointmentRequest;
  }

  @override
  Widget build(BuildContext context) {
    final isAr = context.l10n.localeName == 'ar';
    return InkWell(
      onTap: () {
        if (context.read<UserCubit>().state is UserCubitStateError) {
          print((context.read<UserCubit>().state as UserCubitStateError).error);
        }
        final isUser = (context.read<UserCubit>().state as UserCubitStateLoaded)
            .user
            .isUser;
        if (isUser) {
          context.router.push(
            AppointmentDetailsPageRoute(
              appointment: widget.request.appointment,
            ),
          );
        } else {
          context.router.push(
            AppointmentDetailsPageAdpterRoute(
              appointment: widget.request.appointment,
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
                height: 170.h,
                width: 6,
                color: widget.request.appointment.isDone
                    ? primaryColor
                    : seocondColor,
              ),
              const SizedBox(
                width: 5,
              ),
              Expanded(
                child: Container(
                  height: 170.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(5),
                    child: Column(
                      children: [
                        Text(
                          widget.request.title,
                          style: textStyleWithPrimarySemiBold,
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
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
                                    height: 25.h,
                                    width: 120.w,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: widget
                                                  .request.appointment.status ==
                                              'waiting'
                                          ? const Color(0xffD74B7F)
                                              .withOpacity(.2)
                                          : widget.request.appointment.status ==
                                                  'done'
                                              ? const Color(0xff0A84E1)
                                                  .withOpacity(.2)
                                              : const Color(0xff1AA9A0)
                                                  .withOpacity(.2),
                                    ),
                                    child: Text(
                                      getStatus(context),
                                      style:
                                          textStyleWithSecondSemiBold.copyWith(
                                        fontSize: 12.sp,
                                        height: 1,
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    height: 10.h,
                                  ),
                                  Text(
                                    getTitleString(context),
                                    style:
                                        textStyleWithPrimarySemiBold.copyWith(
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
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 10),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          isAr
                                              ? '${context.l10n.ago} ${getAgo(context)}'
                                              : '${getAgo(context)} ${context.l10n.ago}',
                                          //   'Friday',
                                          style: textStyleWithPrimarySemiBold
                                              .copyWith(fontSize: 14.sp),
                                        ),
                                        Text(
                                          DateFormat(
                                            'EEEE',
                                            App.isAr(context) ? 'ar' : 'en',
                                          ).format(
                                            widget.request.appointment.date,
                                          ), //   'Friday',
                                          style: textStyleWithPrimarySemiBold
                                              .copyWith(fontSize: 14.sp),
                                        ),
                                        Text(
                                          DateFormat(
                                            'EEEE, d MMM, yyyy',
                                            App.isAr(context) ? 'ar' : 'en',
                                          ).format(
                                            widget.request.appointment.date,
                                          ),
                                          style: textStyleWithPrimarySemiBold
                                              .copyWith(
                                            fontSize: 12.sp,
                                            color: const Color(0xff5D6C7A),
                                          ),
                                        ),
                                        BlocBuilder<TimeSlotCubit,
                                            TimeSlotCubitState>(
                                          builder: (context, state) {
                                            if (state
                                                is TimeSlotCubitStateLoaded) {
                                              final timeSlots = state.timeSlots;

                                              final timeSlot = widget
                                                  .request.appointment.timeslot;
                                              return Text(
                                                timeSlot.startSting
                                                    .replaceAll(
                                                      'AM',
                                                      context.l10n.morning,
                                                    )
                                                    .replaceAll(
                                                      'PM',
                                                      context.l10n.evening,
                                                    ), //   '0 //   '05:52 PM',
                                                style:
                                                    textStyleWithPrimarySemiBold
                                                        .copyWith(
                                                  fontSize: 12.sp,
                                                  color:
                                                      const Color(0xff5D6C7A),
                                                ),
                                              );
                                            }
                                            return const Text('');
                                          },
                                        ),
                                      ],
                                    ),
                                    getIcon()
                                    // Assets.svg.phone3.svg(
                                    //   color: request.appointment.isOpened
                                    //       ? const Color(0xffD74B7F)
                                    //       : request.appointment.isDone
                                    //           ? null
                                    //           : seocondColor,
                                    // ),
                                  ],
                                ),
                              ),
                            )
                          ],
                        ),
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
