import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_container.dart';
import 'package:home_cure/features/appointement/presentation/blocs/appointment_params_cubit.dart/appointment_params_cubit.dart';
import 'package:home_cure/features/appointement/presentation/pages/create_appointment_second.dart';
import 'package:home_cure/features/home/domain/entities/service.dart';
import 'package:home_cure/features/home/domain/entities/timeslot.dart';
import 'package:home_cure/features/home/presentation/blocs/timeslot_cubit/timeslot_cubit.dart';
import 'package:home_cure/features/home/presentation/pages/home.dart';
import 'package:home_cure/gen/assets.gen.dart';
import 'package:home_cure/l10n/l10n.dart';
import 'package:overlay_support/overlay_support.dart';

class CreateAppointementThirdPage extends StatefulWidget {
  const CreateAppointementThirdPage({
    super.key,
    required this.service,
    this.period,
  });
  final ServiceEntity service;
  final EveningMorning? period;
  @override
  State<CreateAppointementThirdPage> createState() =>
      _CreateAppointementThirdPageState();
}

class _CreateAppointementThirdPageState
    extends State<CreateAppointementThirdPage> {
  List<TimeSlot> timeSlosts = [];
  late EveningMorning _period;

  @override
  void initState() {
    _period = context.read<AppointmentsParamsCubit>().state.period!;

    super.initState();
  }

  String fromTextFormat(TimeSlot timeslot) {
    if (appLn10.localeName == 'ar') {
      return '''${timeslot.startHour % 12}:${timeslot.startMinute.toString().padLeft(2, '0')} ${timeslot.startHour < 12 ? appLn10.morning : appLn10.evening}''';
    }
    return '''${timeslot.startHour % 12}:${timeslot.startMinute.toString().padLeft(2, '0')} ${timeslot.startHour < 12 ? 'am' : 'pm'}''';
  }

  String toTextFormat(TimeSlot timeslot) {
    if (appLn10.localeName == 'ar') {
      return '''${timeslot.endHour % 12}:${timeslot.endMinute.toString().padLeft(2, '0')} ${timeslot.endHour < 12 ? appLn10.morning : appLn10.evening}''';
    }
    return '''${timeslot.endHour % 12}:${timeslot.endMinute.toString().padLeft(2, '0')} ${timeslot.endHour < 12 ? 'am' : 'pm'}''';
  }

  @override
  int? selectedIndex;
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<TimeSlotCubit, TimeSlotCubitState>(
        builder: (context, state) {
          if (state is TimeSlotCubitStateLoaded) {
            timeSlosts = state.timeSlots
                .where(
                  (element) =>
                      widget.service.timeSlots.contains(element.id) &&
                      (_period == EveningMorning.morning
                          ? element.startHour < 12
                          : element.startHour > 12),
                )
                .toList();

            if (DateTime(
                  context.read<AppointmentsParamsCubit>().state.date!.year,
                  context.read<AppointmentsParamsCubit>().state.date!.month,
                  context.read<AppointmentsParamsCubit>().state.date!.day,
                ) ==
                DateTime(
                  DateTime.now().year,
                  DateTime.now().month,
                  DateTime.now().day,
                )) {
              timeSlosts = [...timeSlosts]
                  .where(
                    (element) =>
                        (DateTime.now().hour + 2 < 24) &&
                        element.startHour >
                            (DateTime.now().add(const Duration(hours: 2)).hour),
                  )
                  .toList();
            }
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 35.h,
                      ),
                      Row(
                        children: [
                          const MyBackButton(),
                          const SizedBox(
                            width: 20,
                          ),
                          Expanded(
                            child: CommonContainer(
                              height: 55,
                              br: 23,
                              child: Padding(
                                padding:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Assets.svg.sun.svg(
                                      height: 40,
                                      width: 40,
                                    ),
                                    Text(
                                      _period == EveningMorning.morning
                                          ? context.l10n.morning
                                          : context.l10n.evening,
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        height: 1,
                                      ),
                                      textAlign: TextAlign.center,
                                    ),
                                    SizedBox(
                                      width: 20.sp,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),

                      SizedBox(
                        height: 40.h,
                      ),

                      ///
                    ],
                  ),
                ),
                Center(
                  child: Text(
                    context.l10n.selectTime,
                    style: TextStyle(
                      fontSize: 20.sp,
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      height: 1,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 50),
                  child: timeSlosts.isEmpty
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Center(
                              child: Text(context.l10n.notAvaialableAtThatDy),
                            ),
                          ],
                        )
                      : ListView.builder(
                          padding: EdgeInsets.symmetric(
                            vertical: 20.h,
                          ),
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          itemCount: timeSlosts.length,
                          itemBuilder: (ctx, index) {
                            final indexedTimeSlot = timeSlosts[index];
                            return InkWell(
                              onTap: () => setState(() {
                                selectedIndex = index;
                                context
                                    .read<AppointmentsParamsCubit>()
                                    .addTimeSlot(timeSlosts[index].id);
                              }),
                              child: Container(
                                margin: EdgeInsets.only(bottom: 25.h),
                                height: 77.h,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(23),
                                  boxShadow: [
                                    BoxShadow(
                                      offset: const Offset(0, 3),
                                      color: Colors.black.withOpacity(
                                        (context
                                                        .read<
                                                            AppointmentsParamsCubit>()
                                                        .state
                                                        .timeslot ==
                                                    indexedTimeSlot.id ||
                                                selectedIndex == index)
                                            ? .5
                                            : .1,
                                      ),
                                      spreadRadius: 2,
                                      blurRadius: 6,
                                    )
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                    horizontal: 20,
                                  ),
                                  child: Row(
                                    children: [
                                      Row(
                                        children: [
                                          Text(
                                            '${context.l10n.from} :',
                                            style: textStyleWithSecondBold(),
                                          ),
                                          Text(
                                            fromTextFormat(indexedTimeSlot),
                                            //   ' 10 am',
                                            style: textStyleWithPrimaryBold
                                                .copyWith(
                                              color: const Color(0xff31ADE0),
                                            ),
                                          ),
                                        ],
                                      ),
                                      const Spacer(),
                                      Row(
                                        children: [
                                          Text(
                                            '${context.l10n.to} :',
                                            style: textStyleWithSecondBold(),
                                          ),
                                          Text(
                                            toTextFormat(indexedTimeSlot),

                                            // ' 10 pm',
                                            style: textStyleWithPrimaryBold
                                                .copyWith(
                                              color: const Color(0xff31ADE0),
                                            ),
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ),
                              ),
                            );
                          },
                        ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30.sp),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Button1(
                        onPressed: () {
                          backFunc(context);
                        },
                        title: context.l10n.back,
                      ),
                      Button1(
                        onPressed: () {
                          if (context
                                  .read<AppointmentsParamsCubit>()
                                  .state
                                  .timeslot ==
                              null) {
                            showSimpleNotification(
                              Text(context.l10n.pleaseselecttheperiod),
                              background: Colors.red,
                            );
                            // ScaffoldMessenger.of(context)
                            //   ..clearSnackBars()
                            //   ..showSnackBar(
                            //     SnackBar(
                            //       content:
                            //           Text(context.l10n.pleaseselecttheperiod),
                            //     ),
                            //   );
                            return;
                          }
                          if (widget.service.isVideo || widget.service.isTele) {
                            context.router.push(
                              CreateAppointmentPayment(
                                service: widget.service,
                              ),
                            );
                            return;
                          }
                          context.router.push(
                            CreateAppointementFourthRoute(
                              service: widget.service,
                            ),
                          );
                        },
                        title: context.l10n.next, // 'Next',
                      )
                    ],
                  ),
                ),
                SizedBox(
                  height: 100.h,
                ),
              ],
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}
