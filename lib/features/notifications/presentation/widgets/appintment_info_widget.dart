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
import 'package:intl/intl.dart';

// class AppointmentsStatus  {
//  static const  opened= 'opened';
//   WAITING: 'waiting',
//   ONPROCESSING: 'onprocessing',
//   DONE: 'done',
// };
class AppointmentInfoWidget extends StatelessWidget {
  const AppointmentInfoWidget({
    super.key,
    required this.request,
  });
  final Appointment request;
  String getStatus() {
    if (request.isWaiting) {
      return 'Accepted';
    }
    if (request.isOnPeocessing) {
      return 'On Processing';
    }
    if (request.isDone) {
      return 'Completed';
    }
    return 'Pending';
  }

  Color getColor() {
    if (request.isOpened) return seocondColor;
    if (request.isWaiting) return seocondColor;
    if (request.isOnPeocessing) return seocondColor;

    return primaryColor;
  }

  Widget getIcon() {
    if (request.isVideo) {
      return Icon(
        Icons.video_call,
        size: 25,
        color: getColor(),
      );
    }
    if (request.isTele) {
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

  String getTitleString() {
    if (request.isVideo) {
      return 'Video Request';
    }
    if (request.isTele) {
      return 'Call Request';
    }
    return 'Appointment Request';
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
              .push(AppointmentDetailsPageRoute(appointment: request));
        } else {
          context.router
              .push(AppointmentDetailsPageAdpterRoute(appointment: request));
        }
      },
      child: LayoutBuilder(
        builder: (c, s) {
          return Row(
            children: [
              Container(
                height: 100.h,
                width: 6,
                color: request.isDone ? primaryColor : seocondColor,
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
                                height: 25.h,
                                width: 120.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: request.status == 'waiting'
                                      ? const Color(0xffD74B7F).withOpacity(.2)
                                      : request.status == 'done'
                                          ? const Color(0xff0A84E1)
                                              .withOpacity(.2)
                                          : const Color(0xff1AA9A0)
                                              .withOpacity(.2),
                                ),
                                child: Text(
                                  'On Processing',
                                  // getStatus(),
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
                                getTitleString(), //  'Call Request',
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
                                      DateFormat('EEEE')
                                          .format(request.date), //   'Friday',
                                      style: textStyleWithPrimarySemiBold
                                          .copyWith(fontSize: 14.sp),
                                    ),
                                    Text(
                                      DateFormat('EEEE, d MMM, yyyy')
                                          .format(request.date),
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

                                          final timeSlot = timeSlots.firstWhere(
                                            (element) =>
                                                element.id == request.timeslot,
                                          );
                                          return Text(
                                            timeSlot
                                                .startSting, //   '05:52 PM',
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
