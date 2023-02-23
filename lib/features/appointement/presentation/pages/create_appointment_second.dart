import 'dart:io';

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/flags/global_flags.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_container.dart';
import 'package:home_cure/core/widgets/common_header.dart';
import 'package:home_cure/features/Services/presentation/pages/services_page.dart';
import 'package:home_cure/features/appointement/presentation/blocs/appointment_params_cubit.dart/appointment_params_cubit.dart';
import 'package:home_cure/features/home/domain/entities/service.dart';
import 'package:home_cure/features/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:home_cure/features/home/presentation/pages/home.dart';
import 'package:home_cure/gen/assets.gen.dart';
import 'package:home_cure/l10n/l10n.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

const holidays = [
  'Saturday',
  'Sunday',
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
];
const weekDays = [
  'Monday',
  'Tuesday',
  'Wednesday',
  'Thursday',
  'Friday',
  'Saturday',
  'Sunday',
];

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
            DateTime.now(),
          );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        if (Platform.isIOS) {
          return shouldPop;
        } else {
          return true;
        }
      },
      child: SingleChildScrollView(
        child: Column(
          children: [
            BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeServicesLoaded) {
                  final mainService = widget.service.ancestors.isEmpty
                      ? widget.service
                      : state.services.firstWhere(
                          (element) =>
                              element.id == widget.service.ancestors.first,
                        );
                  return BlocBuilder<AppointmentsParamsCubit,
                      AppointmentsParamsState>(
                    builder: (context, appointementState) {
                      return Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(
                              left: 40,
                              right: 40,
                              top: 30,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                const MyBackButton(),
                                Row(
                                  children: [
                                    CommonHeader(
                                      title: widget.service.getTitle(context),
                                    ),
                                    const SizedBox(
                                      width: 10,
                                    ),
                                    InfoButton(
                                      info: App.isAr(context)
                                          ? (widget.service.arDescription ??
                                              widget.service.description)
                                          : widget.service.description,
                                    ),
                                  ],
                                ),
                                Container()
                              ],
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          SizedBox(
                            height: size.height * .45,
                            child: Column(
                              children: [
                                Expanded(
                                  child: SingleChildScrollView(
                                    child: Padding(
                                      padding: const EdgeInsets.only(
                                        left: 30,
                                        right: 30,
                                      ),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 20.h,
                                          ),
                                          CommonContainer(
                                            height: 50.h,
                                            child: Center(
                                              child: Text(
                                                context.l10n.selectAppropait,
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
                                          if (widget.service.hasRangOfDays())
                                            SizedBox(
                                              height: 300,
                                              child: MultiSelectCalender(
                                                onChange: (range) {
                                                  if (range != null) {
                                                    first = range.startDate;
                                                    last = range.endDate;
                                                    context
                                                        .read<
                                                            AppointmentsParamsCubit>()
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
                                                      const Duration(),
                                                    ),
                                                firstDate: DateTime.now().add(
                                                  const Duration(),
                                                ),
                                                lastDate: DateTime.now().add(
                                                  const Duration(
                                                    days: 365,
                                                  ),
                                                ),
                                                onDateChanged: (d) {
                                                  final hol = widget
                                                      .service.holidays
                                                      .map((e) => holidays[e])
                                                      .toList();
                                                  final c = hol.contains(
                                                    weekDays[d.weekday - 1],
                                                  );
                                                  if (c) {
                                                    showSimpleNotification(
                                                      Text(
                                                        appLn10.localeName ==
                                                                'ar'
                                                            ? 'نأسف لكم هذا اليوم اجازه'
                                                            : 'sorry this day is holiday',
                                                      ),
                                                      background: Colors.red,
                                                    );

                                                    throw Exception(
                                                      appLn10.localeName == 'ar'
                                                          ? 'لا يوجدايام متاحه'
                                                          : 'no avalable day',
                                                    );
                                                  }
                                                  context
                                                      .read<
                                                          AppointmentsParamsCubit>()
                                                      .addDate(d);
                                                },
                                              ),
                                            ),
                                          SizedBox(
                                            height: 50.h,
                                          ),
                                          Center(
                                            child: Text(
                                              context.l10n.selectAppropait,
                                              style: TextStyle(
                                                fontSize: 20.sp,
                                                color: primaryColor,
                                                fontWeight: FontWeight.bold,
                                                height: 1,
                                              ),
                                              textAlign: TextAlign.center,
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
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
                                                        Colors.red,
                                                  ),
                                                  child: Checkbox(
                                                    side: const BorderSide(
                                                      width: .5,
                                                    ),
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(50),
                                                      ),
                                                    ),
                                                    value: period ==
                                                        EveningMorning.evening,
                                                    onChanged: (_) {
                                                      setState(() {
                                                        period = EveningMorning
                                                            .evening;
                                                      });
                                                      context
                                                          .read<
                                                              AppointmentsParamsCubit>()
                                                          .addPeriod(
                                                            period!,
                                                          );
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  context.l10n.evening,
                                                  style: TextStyle(
                                                    fontSize: 20.sp,
                                                    fontWeight: FontWeight.bold,
                                                    color: const Color(
                                                      0xff1AA9A0,
                                                    ),
                                                  ),
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
                                                        Colors.red,
                                                  ),
                                                  child: Checkbox(
                                                    side: const BorderSide(
                                                      width: .5,
                                                    ),
                                                    shape:
                                                        const RoundedRectangleBorder(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                        Radius.circular(50),
                                                      ),
                                                    ),
                                                    value: period ==
                                                        EveningMorning.morning,
                                                    onChanged: (_) {
                                                      setState(() {
                                                        period = EveningMorning
                                                            .morning;
                                                      });
                                                      context
                                                          .read<
                                                              AppointmentsParamsCubit>()
                                                          .addPeriod(
                                                            period!,
                                                          );
                                                    },
                                                  ),
                                                ),
                                              ),
                                              Expanded(
                                                child: Text(
                                                  context.l10n.morning,
                                                  style: const TextStyle(
                                                    fontWeight: FontWeight.bold,
                                                    color: Color(0xff1AA9A0),
                                                  ),
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
                                    backFunc(context);
                                  },
                                  title: context.l10n.back,
                                ),
                                Button1(
                                  onPressed: () {
                                    final hol = widget.service.holidays
                                        .map((e) => holidays[e])
                                        .toList();
                                    final c = hol.contains(
                                      weekDays[context
                                              .read<AppointmentsParamsCubit>()
                                              .state
                                              .date!
                                              .weekday -
                                          1],
                                    );
                                    if (c) {
                                      showSimpleNotification(
                                        Text(
                                          appLn10.localeName == 'ar'
                                              ? 'نأسف لكم هذا اليوم اجازه'
                                              : 'sorry this day is holiday',
                                        ),
                                        background: Colors.red,
                                      );

                                      throw Exception(
                                        appLn10.localeName == 'ar'
                                            ? 'لا يوجدايام متاحه'
                                            : 'no avalable day',
                                      );
                                    }

                                    if (widget.service.hasRangOfDays()) {
                                      if (first != null && last != null) {
                                        var finalPrice = 0.0;
                                        final days =
                                            last!.difference(first!).inDays + 1;
                                        print(last);
                                        if (days <
                                            (widget.service.minDays ?? 0)) {
                                          showSimpleNotification(
                                            Text(
                                              '${context.l10n.period5days}${widget.service.minDays ?? 0} ${context.l10n.day}',
                                            ),
                                            background: Colors.red,
                                          );

                                          return;
                                        }

                                        finalPrice =
                                            widget.service.price.toDouble() *
                                                days;
                                        context.read<AppointmentsParamsCubit>()
                                          ..addDyas(
                                            days,
                                          )
                                          ..addPrice(finalPrice.toInt());
                                        print(
                                          context
                                              .read<AppointmentsParamsCubit>()
                                              .state
                                              .price,
                                        );

                                        if (appointementState.period == null) {
                                          showSimpleNotification(
                                            Text(
                                              context
                                                  .l10n.pleaseselecttheperiod,
                                            ),
                                            background: Colors.red,
                                          );

                                          return;
                                        }
                                        context.router.push(
                                          CreateAppointementThirdRoute(
                                            service: widget.service,
                                            period: period,
                                          ),
                                        );
                                      } else {
                                        showSimpleNotification(
                                          Text(
                                            App.isAr(context)
                                                ? 'حدد التاريخ من وإلى'
                                                : 'Select date from and to',
                                          ),
                                          background: Colors.red,
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
                                      showSimpleNotification(
                                        Text(
                                          context.l10n.pleaseselecttheperiod,
                                        ),
                                        background: Colors.red,
                                      );
                                    }
                                  },
                                  title: context.l10n.next,
                                ),
                              ],
                            ),
                          ),
                        ],
                      );
                    },
                  );
                }
                return const SizedBox();
              },
            ),
          ],
        ),
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
      initialDisplayDate: DateTime.now().add(const Duration(days: 6)),
      initialSelectedDate: DateTime.now().add(const Duration(days: 6)),
      selectionMode: DateRangePickerSelectionMode.range,
      enablePastDates: false,
      controller: controller,
    );
  }
}
