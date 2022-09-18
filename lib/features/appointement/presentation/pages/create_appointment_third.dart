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
import 'package:home_cure/gen/assets.gen.dart';

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
    return '''${timeslot.startHour % 12}:${timeslot.startMinute} ${timeslot.startHour < 12 ? 'am' : 'pm'}''';
  }

  String toTextFormat(TimeSlot timeslot) {
    return '''${timeslot.endHour % 12}:${timeslot.endMinute} ${timeslot.endHour < 12 ? 'am' : 'pm'}''';
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
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 40, right: 40, top: 40),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 35.h,
                      ),
                      CommonContainer(
                        height: 77.h,
                        br: 23,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Assets.svg.sun.svg(),
                              const Spacer(),
                              Text(
                                _period == EveningMorning.morning
                                    ? 'Morning'
                                    : 'Evening',
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
                              const Spacer(),
                            ],
                          ),
                        ),
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
                    'Select Time',
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
                  child: ListView.builder(
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
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: Row(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'From :',
                                      style: textStyleWithSecondBold(),
                                    ),
                                    Text(
                                      fromTextFormat(indexedTimeSlot),
                                      //   ' 10 am',
                                      style: textStyleWithPrimaryBold.copyWith(
                                        color: const Color(0xff31ADE0),
                                      ),
                                    ),
                                  ],
                                ),
                                const Spacer(),
                                Row(
                                  children: [
                                    Text(
                                      'To :',
                                      style: textStyleWithSecondBold(),
                                    ),
                                    Text(
                                      toTextFormat(indexedTimeSlot),

                                      // ' 10 pm',
                                      style: textStyleWithPrimaryBold.copyWith(
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
                          context.router.pop();
                        },
                        title: 'Back',
                      ),
                      Button1(
                        onPressed: () {
                          if (context
                                  .read<AppointmentsParamsCubit>()
                                  .state
                                  .timeslot ==
                              null) {
                            ScaffoldMessenger.of(context)
                              ..clearSnackBars()
                              ..showSnackBar(
                                const SnackBar(
                                  content: Text('Please select period'),
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
                        title: 'Next',
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
