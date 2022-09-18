import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_container.dart';
import 'package:home_cure/core/widgets/common_header.dart';
import 'package:home_cure/features/appointement/presentation/blocs/appointment_params_cubit.dart/appointment_params_cubit.dart';
import 'package:home_cure/features/home/domain/entities/service.dart';
import 'package:home_cure/features/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:home_cure/gen/assets.gen.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

enum EveningMorning { evening, morning }

class CreateAppointementSecondPage extends StatefulWidget {
  const CreateAppointementSecondPage({super.key, required this.service});
  final ServiceEntity service;
  @override
  State<CreateAppointementSecondPage> createState() =>
      _CreateAppointementSecondPageState();
}

class _CreateAppointementSecondPageState
    extends State<CreateAppointementSecondPage> {
  EveningMorning? period;
  DateTime? first;
  DateTime? _firstDate;

  DateTime? last;
  @override
  void initState() {
    period = context.read<AppointmentsParamsCubit>().state.period;
    _firstDate = context.read<AppointmentsParamsCubit>().state.date;
    if (_firstDate == null) {
      context.read<AppointmentsParamsCubit>().addDate(
            DateTime.now().add(
              const Duration(
                days: 1,
              ),
            ),
          );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          if (state is HomeServicesLoaded) {
            final mainService = widget.service.ancestors.isEmpty
                ? widget.service
                : state.services.firstWhere(
                    (element) => element.id == widget.service.ancestors.first,
                  );
            return BlocBuilder<AppointmentsParamsCubit,
                AppointmentsParamsState>(
              builder: (context, appointementState) {
                return Column(
                  children: [
                    Padding(
                      padding:
                          const EdgeInsets.only(left: 40, right: 40, top: 40),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CommonHeader(title: 'Doctor Home'),
                          SizedBox(
                            height: 35.h,
                          ),
                          CommonContainer(
                            height: 50.h,
                            child: Center(
                              child: Text(
                                'Select appropriate visit date',
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  height: 1,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                          ),
                          if (mainService.title == 'Eldery Care')
                            SizedBox(
                              height: 300,
                              child: MultiSelectCalender(
                                onChange: (range) {
                                  if (range != null) {
                                    first = range.startDate;
                                    last = range.endDate;
                                    context
                                        .read<AppointmentsParamsCubit>()
                                        .addDate(
                                          first!,
                                        );
                                  }
                                },
                              ),
                            )
                          else
                            SizedBox(
                              height: 300.h,
                              child: CalendarDatePicker(
                                initialDate: _firstDate ??
                                    DateTime.now().add(
                                      const Duration(
                                        days: 1,
                                      ),
                                    ),
                                firstDate: DateTime.now().add(
                                  const Duration(
                                    days: 1,
                                  ),
                                ),
                                lastDate: DateTime.now().add(
                                  const Duration(
                                    days: 365,
                                  ),
                                ),
                                onDateChanged: (d) {
                                  context
                                      .read<AppointmentsParamsCubit>()
                                      .addDate(d);
                                },
                              ),
                            ),
                          SizedBox(
                            height: 50.h,
                          ),
                          Center(
                            child: Text(
                              'Select appropriate visit date',
                              style: TextStyle(
                                fontSize: 20.sp,
                                color: primaryColor,
                                fontWeight: FontWeight.bold,
                                height: 1,
                              ),
                              textAlign: TextAlign.center,
                            ),
                          ),

                          ///
                        ],
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(30.sp),
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              height: 77.h,
                              width: 184.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(23),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 3),
                                    color: Colors.black.withOpacity(.1),
                                    spreadRadius: 2,
                                    blurRadius: 6,
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Assets.svg.moon.svg(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          height: 20.h,
                                          child: Theme(
                                            data: ThemeData(
                                              primarySwatch: Colors.blue,
                                              unselectedWidgetColor:
                                                  Colors.red, // Your color
                                            ),
                                            child: Checkbox(
                                              side: const BorderSide(
                                                width: .5,
                                              ),
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(50),
                                                ),
                                              ),
                                              value: period ==
                                                  EveningMorning.evening,
                                              onChanged: (_) {
                                                setState(() {
                                                  period =
                                                      EveningMorning.evening;
                                                });
                                                context
                                                    .read<
                                                        AppointmentsParamsCubit>()
                                                    .addPeriod(period!);
                                              },
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Evening',
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                            color: const Color(0xff1AA9A0),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Expanded(
                            child: Container(
                              height: 77.h,
                              width: 184.w,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(23),
                                boxShadow: [
                                  BoxShadow(
                                    offset: const Offset(0, 3),
                                    color: Colors.black.withOpacity(.1),
                                    spreadRadius: 2,
                                    blurRadius: 6,
                                  )
                                ],
                              ),
                              child: Padding(
                                padding: const EdgeInsets.all(12),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Assets.svg.sun.svg(),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.end,
                                      children: [
                                        SizedBox(
                                          height: 20.h,
                                          child: Theme(
                                            data: ThemeData(
                                              primarySwatch: Colors.blue,
                                              unselectedWidgetColor:
                                                  Colors.red, // Your color
                                            ),
                                            child: Checkbox(
                                              side: const BorderSide(
                                                width: .5,
                                              ),
                                              shape:
                                                  const RoundedRectangleBorder(
                                                borderRadius: BorderRadius.all(
                                                  Radius.circular(50),
                                                ),
                                              ),
                                              value: period ==
                                                  EveningMorning.morning,
                                              onChanged: (_) {
                                                setState(() {
                                                  period =
                                                      EveningMorning.morning;
                                                });
                                                context
                                                    .read<
                                                        AppointmentsParamsCubit>()
                                                    .addPeriod(period!);
                                              },
                                            ),
                                          ),
                                        ),
                                        Text(
                                          'Morning',
                                          style: TextStyle(
                                            fontSize: 20.sp,
                                            fontWeight: FontWeight.bold,
                                            color: const Color(0xff1AA9A0),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
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
                              if (mainService.title == 'Eldery Care') {
                                if (first != null && last != null) {
                                  var finalPrice = 0.0;
                                  final days = last!.difference(first!).inDays;
                                  final daysPackages = widget.service.children
                                      .map((e) => e.days)
                                      .toList();
                                  if (daysPackages.contains(days)) {
                                    finalPrice = widget.service.children
                                        .firstWhere(
                                          (element) => element.days == days,
                                        )
                                        .price
                                        .toDouble();
                                  } else {
                                    print('Ok');
                                    finalPrice = widget
                                            .service.children[0].price
                                            .toDouble() *
                                        days;
                                    context.read<AppointmentsParamsCubit>()
                                      ..addDyas(
                                        days,
                                      )
                                      ..addPrice(finalPrice.toInt());
                                  }
                                  context.router.push(
                                    CreateAppointementRoute(
                                      service: widget.service,
                                      customPrice: finalPrice,
                                    ),
                                  );
                                } else {
                                  showSimpleNotification(
                                    const Text('please select range of date'),
                                    background: primaryColor,
                                  );
                                }
                                return;
                              }
                              if (appointementState.period != null) {
                                context.router.push(
                                  CreateAppointementThirdRoute(
                                    service: widget.service,
                                    period: period,
                                  ),
                                );
                              } else {
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(
                                    content: Text('please select the period'),
                                  ),
                                );
                              }
                            },
                            title: 'Next',
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 100.h,
                    ),
                  ],
                );
              },
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class MultiSelectCalender extends StatefulWidget {
  const MultiSelectCalender({
    super.key,
    this.onChange,
  });
  final void Function(PickerDateRange? range)? onChange;
  @override
  State<MultiSelectCalender> createState() => _MultiSelectCalenderState();
}

class _MultiSelectCalenderState extends State<MultiSelectCalender> {
  final controller = DateRangePickerController();
  @override
  void initState() {
    controller.addPropertyChangedListener((p0) {
      if (widget.onChange != null) {
        widget.onChange?.call(controller.selectedRange);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    if (controller.selectedRange != null) {
      print(
        controller.selectedRange!.startDate,
      );
      print(
        controller.selectedRange!.endDate,
      );
    }
    return SfDateRangePicker(
      selectionMode: DateRangePickerSelectionMode.range,
      enablePastDates: false,
      onViewChanged: (dateRangePickerViewChangedArgs) {
        print('sad');
      },
      controller: controller,
    );
  }
}
