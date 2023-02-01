import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/features/appointement/domain/entities/appointment.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit_state.dart';
import 'package:home_cure/features/home/presentation/blocs/timeslot_cubit/timeslot_cubit.dart';
import 'package:home_cure/gen/assets.gen.dart';
import 'package:home_cure/l10n/l10n.dart';
import 'package:intl/intl.dart';

// class AppointmentsStatus  {
//  static const  opened= 'opened';
//   WAITING: 'waiting',
//   ONPROCESSING: 'onprocessing',
//   DONE: 'done',
// };
class AppointmentInfoWidget extends StatefulWidget {
  const AppointmentInfoWidget({
    super.key,
    required this.request,
  });
  final Appointment request;

  @override
  State<AppointmentInfoWidget> createState() => _AppointmentInfoWidgetState();
}

class _AppointmentInfoWidgetState extends State<AppointmentInfoWidget> {
  String getStatus(BuildContext context) {
    if (widget.request.isWaiting) {
      return context.l10n.accepted;
    }
    if (widget.request.isOnPeocessing) {
      return context.l10n.onProccessing;
    }
    if (widget.request.isDone) {
      return context.l10n.completed;
    }
    return context.l10n.pending;
  }

  String? local;
  String getAgo(DateTime date) {
    final duration = DateTime.now().difference(date);
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

  Color getColor() {
    if (widget.request.isOpened) return seocondColor;
    if (widget.request.isWaiting) return seocondColor;
    if (widget.request.isOnPeocessing) return seocondColor;

    return primaryColor;
  }

  Widget getIcon() {
    if (widget.request.isVideo) {
      return Icon(
        Icons.video_call,
        size: 25,
        color: getColor(),
      );
    }
    if (widget.request.isTele) {
      return Assets.svg.phone3.svg(
        height: 25,
        color: getColor(),
      );
    }
    return Icon(
      Icons.location_pin,
      size: 25,
      color: getColor(),
    );
  }

  String getTitleString(BuildContext context) {
    if (widget.request.isVideo) {
      return context.l10n.videoRequest;
    }
    if (widget.request.isTele) {
      return context.l10n.callRequest;
    }
    return context.l10n.appointmentRequest;
  }

  @override
  void initState() {
    Future.delayed(Duration.zero, () {
      setState(() {
        local = context.l10n.localeName;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        final isUser = (context.read<UserCubit>().state as UserCubitStateLoaded)
            .user
            .isUser;
        if (isUser) {
          context.router
              .push(AppointmentDetailsPageRoute(appointment: widget.request));
        } else {
          context.router.push(
            AppointmentDetailsPageAdpterRoute(appointment: widget.request),
          );
        }
      },
      child: LayoutBuilder(
        builder: (c, s) {
          return Row(
            children: [
              Container(
                height: 100.h,
                width: 6,
                color: widget.request.isDone ? primaryColor : seocondColor,
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
                                width: 120.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: widget.request.status == 'waiting'
                                      ? const Color(0xffD74B7F).withOpacity(.2)
                                      : widget.request.status == 'done'
                                          ? const Color(0xff0A84E1)
                                              .withOpacity(.2)
                                          : const Color(0xff1AA9A0)
                                              .withOpacity(.2),
                                ),
                                child: Text(
                                  //'On Processing',
                                  getStatus(context),
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
                                getTitleString(context), //  'Call Request',
                                style: textStyleWithPrimarySemiBold.copyWith(
                                  fontSize: 14.sp,
                                  height: 1,
                                  color: const Color(0xff5D6C7A),
                                ),
                              ),
                              if (widget.request.createdAt != null)
                                Column(
                                  children: [
                                    SizedBox(
                                      height: 10.h,
                                    ),
                                    Text(
                                      context.l10n.localeName == 'ar'
                                          ? '${context.l10n.ago} ${getAgo(
                                              widget.request.createdAt!,
                                            )}'
                                          : '${getAgo(
                                              widget.request.createdAt!,
                                            )} ${context.l10n.ago}', //  'Call Request',
                                      style:
                                          textStyleWithPrimarySemiBold.copyWith(
                                        fontSize: 14.sp,
                                        height: 1,
                                        color: const Color(0xff5D6C7A),
                                      ),
                                    ),
                                  ],
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
                                      DateFormat(
                                        'EEEE',
                                        App.isAr(context) ? 'ar' : 'en',
                                      ).format(
                                        widget.request.date,
                                      ), //   'Friday',
                                      style: textStyleWithPrimarySemiBold
                                          .copyWith(fontSize: 14.sp),
                                    ),
                                    Text(
                                      DateFormat(
                                        'EEEE, d MMM, yyyy',
                                        App.isAr(context) ? 'ar' : 'en',
                                      ).format(widget.request.date),
                                      style:
                                          textStyleWithPrimarySemiBold.copyWith(
                                        fontSize: 12.sp,
                                        color: const Color(0xff5D6C7A),
                                      ),
                                    ),
                                    BlocBuilder<TimeSlotCubit,
                                        TimeSlotCubitState>(
                                      builder: (context, state) {
                                        if (state is TimeSlotCubitStateLoaded) {
                                          final timeSlots = state.timeSlots;

                                          final timeSlot =
                                              widget.request.timeslot;
                                          return Text(
                                            timeSlot.startSting
                                                .replaceAll(
                                                  'AM',
                                                  context.l10n.morning,
                                                )
                                                .replaceAll(
                                                  'PM',
                                                  context.l10n.evening,
                                                ), //   '05:52 PM',
                                            style: textStyleWithPrimarySemiBold
                                                .copyWith(
                                              fontSize: 12.sp,
                                              color: const Color(0xff5D6C7A),
                                            ),
                                          );
                                        }
                                        return const Text('');
                                      },
                                    ),
                                  ],
                                ),
                                getIcon(),
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
