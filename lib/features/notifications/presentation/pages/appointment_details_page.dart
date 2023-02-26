import 'package:auto_route/auto_route.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_cure/app/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/utils/request_agora_permissions.dart';
import 'package:home_cure/core/widgets/big_form_field.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_container.dart';
import 'package:home_cure/di/get_it.dart';
import 'package:home_cure/features/appointement/domain/entities/appointment.dart';
import 'package:home_cure/features/appointement/domain/entities/done_params.dart';
import 'package:home_cure/features/appointement/domain/entities/rate_params.dart';
import 'package:home_cure/features/appointement/presentation/blocs/agora_token_cubit/agora_token_cubit.dart';
import 'package:home_cure/features/appointement/presentation/blocs/appointments_creating_bloc/appointments_cubit.dart';
import 'package:home_cure/features/appointement/presentation/blocs/get_appointments_cubit/my_appointments_cubit..dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit_state.dart';
import 'package:home_cure/features/home/domain/entities/service.dart';
import 'package:home_cure/features/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:home_cure/features/home/presentation/blocs/our_doctors_cubit/our_doctors_cubit.dart';
import 'package:home_cure/features/home/presentation/blocs/timeslot_cubit/timeslot_cubit.dart';
import 'package:home_cure/features/home/presentation/pages/home.dart';
import 'package:home_cure/features/notifications/presentation/widgets/appointement_attach_widget.dart';
import 'package:home_cure/features/notifications/presentation/widgets/appointment_action_dialouge.dart';
import 'package:home_cure/features/notifications/presentation/widgets/map_widget.dart';
import 'package:home_cure/l10n/l10n.dart';
import 'package:intl/date_symbol_data_local.dart';
import 'package:intl/intl.dart';
import 'package:url_launcher/url_launcher.dart';

class AppointmentDetailsPage extends StatefulWidget {
  const AppointmentDetailsPage({super.key, required this.appointment});
  final Appointment appointment;
  @override
  AppointmentDetailsPageState createState() => AppointmentDetailsPageState();
}

class AppointmentDetailsPageState extends State<AppointmentDetailsPage> {
  final List<ServiceEntity> list = [];
  late Appointment _appointment;

  bool inProviderApp = false;
  String? tag;

  @override
  void initState() {
    if (context.read<MyAppointmentsCubit>().state
        is MyAppointmentsCubitStateLoaded) {
      if ((context.read<MyAppointmentsCubit>().state
              as MyAppointmentsCubitStateLoaded)
          .appointments
          .map((e) => e.id)
          .contains(widget.appointment.id)) {
        _appointment = (context.read<MyAppointmentsCubit>().state
                as MyAppointmentsCubitStateLoaded)
            .appointments
            .firstWhere((element) => element.id == widget.appointment.id);
      }
    } else {
      _appointment = widget.appointment;
    }
    if (UserCubit.get(context).state is UserCubitStateInitil) {
      UserCubit.get(context).getUserFuc(_appointment.user);
      inProviderApp = true;
    }
    context.read<MyAppointmentsCubit>().stream.listen((state) {
      if (state is MyAppointmentsCubitStateLoaded) {
        if (state.appointments
            .map((e) => e.id)
            .toList()
            .contains(_appointment.id)) {
          setState(() {
            _appointment = state.appointments
                .firstWhere((element) => element.id == _appointment.id);
          });
        }
      }
    });
    Future.delayed(Duration.zero, () {
      setState(() {
        tag = Localizations.maybeLocaleOf(context)?.toLanguageTag();
      });
    });

    initializeDateFormatting();

    super.initState();
  }

  String getButtonTitle(BuildContext context) {
    if (_appointment.isWaiting) return context.l10n.start;
    // if (_appointment.isOnPeocessing &&
    //     inProviderApp &&
    //     !_appointment.payed &&
    //     _appointment.isCash) return context.l10n.payNow;

    if (_appointment.isOnPeocessing) return context.l10n.done;

    return context.l10n.accept;
  }

  void getAcction(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (_) => ApppointmentActionDiaouge(
        appointment: _appointment,
        title: context.l10n.areYouSure,
        validator: (value) {
          if (value!.isEmpty) {
            return context.l10n.feddbackistooshor;
          }
          if (value.length < 2) {
            return context.l10n.feddbackistooshor;
          }
          return null;
        },
        onDone: (value) {
          final cubit = context.read<AppointmentsCubit>();
          if (_appointment.isOpened) {
            cubit.acceptFunc(_appointment.id);
            if (context.read<TimeSlotCubit>().state
                is TimeSlotCubitStateLoaded) {
              final timeSlot = (context.read<TimeSlotCubit>().state
                      as TimeSlotCubitStateLoaded)
                  .timeSlots
                  .firstWhere(
                    (element) => element.id == _appointment.timeslot.id,
                  );

              AwesomeNotifications().createNotification(
                content: NotificationContent(
                  channelKey: 'basic_channel',
                  id: DateTime(
                    _appointment.date.year,
                    _appointment.date.month,
                    _appointment.date.day,
                    timeSlot.startHour,
                    timeSlot.startMinute,
                  ).millisecond,
                  title: 'You Should Start Appointment After 15 Minutes',
                ),
                schedule: NotificationCalendar.fromDate(
                  date: DateTime(
                    _appointment.date.year,
                    _appointment.date.month,
                    _appointment.date.day,
                    timeSlot.startHour,
                    timeSlot.startMinute,
                  ).subtract(const Duration(minutes: 15)),
                ),
              );
            }
          }
          if (_appointment.isWaiting) {
            cubit.onProgressFunc(_appointment.id);
          }

          if (_appointment.isOnPeocessing) {
            cubit.doneFunc(
              DoneParams(id: _appointment.id, providerComment: value),
            );
          }
        },
      ),
    );
    return;
  }

  /// this function to make all app listen to this internal Change;
  void listenToChange(BuildContext context, Appointment appointment) {
    context.read<MyAppointmentsCubit>().addModified(appointment);
  }

  Widget getProviderButton(BuildContext context) {
    final appointDate = DateTime(
      _appointment.date.year,
      _appointment.date.month,
      _appointment.date.day,
      _appointment.timeslot.startHour,
      _appointment.timeslot.startMinute,
    );
    final diff = DateTime.now().difference(appointDate);
    final isValid = diff.inSeconds < 0;
    if (_appointment.isOpened && !isValid) return const SizedBox();
    return Button1(
      title: getButtonTitle(context),
      size: const Size(330, 40),
      onPressed: () {
        getAcction(context);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    // print(_appointment.id);
    return BlocBuilder<UserCubit, UserCubitState>(
      builder: (context, state) {
        if (state is UserCubitStateLoaded) {
          final user = state.user;
          return BlocListener<AppointmentsCubit, AppointmentsCubitState>(
            listener: (context, state) {
              if (state is AppointmentsCubitStateLoading) {
                EasyLoading.show();
              }
              if (state is AppointmentsCubitStateError) {
                EasyLoading.showError(state.error.errorMessege);
              }
              if (state is AppointmentsCubitStateCreatedWithPayLink) {
                EasyLoading.dismiss();
                context.router.push(
                  WebViewPaymentRoute(
                    callbackPayment: (url) {
                      if (url.contains('&success=true&')) {
                        context
                            .read<AppointmentsCubit>()
                            .userPayFunc(state.appointment.id);
                        // context.router.push(const DoneRoute());
                      } else {
                        EasyLoading.showInfo(context.l10n.paymentFailed);
                      }
                    },
                    url: state.appointment.link!,
                    title: 'payment',
                  ),
                );
                // EasyLoading.showSuccess('success');
              }
              if (state is AppointmentsCubitStatePayed) {
                print(_appointment.payed);
                EasyLoading.dismiss();
                setState(() {
                  _appointment = state.appointment;
                });
                listenToChange(context, state.appointment);
              }
              if (state is AppointmentsCubitStateRated) {
                print(_appointment.payed);
                EasyLoading.dismiss();
                setState(() {
                  _appointment = state.appointment;
                });
                listenToChange(context, state.appointment);
              }
              if (state is AppointmentsCubitStateAccepted) {
                EasyLoading.dismiss();
                setState(() {
                  _appointment = state.appointment;
                });
                listenToChange(context, state.appointment);

                // context.router.push(const DoneRoute());
              }
              if (state is AppointmentsCubitStateOnProgress) {
                EasyLoading.dismiss();
                setState(() {
                  _appointment = state.appointment;
                });
                listenToChange(context, state.appointment);

                // context.router.push(const DoneRoute());
              }
              if (state is AppointmentsCubitStateDone) {
                EasyLoading.dismiss();
                setState(() {
                  _appointment = state.appointment;
                });
                listenToChange(context, state.appointment);

                // context.router.push(const DoneRoute());
              }
            },
            child: BlocBuilder<HomeBloc, HomeState>(
              builder: (context, state) {
                if (state is HomeServicesLoaded) {
                  final leafService = state.services.firstWhere(
                    (element) => element.id == _appointment.service,
                  );
                  final ancestors = state.services
                      .where(
                        (element) => leafService.ancestors.contains(element.id),
                      )
                      .toList()
                    ..add(leafService);
                  return Padding(
                    padding: const EdgeInsets.all(20),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          const SizedBox(
                            height: 20,
                          ),

                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              const MyBackButton(),
                              Container(
                                width: 250,
                                padding: const EdgeInsets.all(10),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: const Color(0xff218FE4),
                                ),
                                child: Center(
                                  child: Text(
                                    App.isAr(context)
                                        ? ancestors.first.arTitle ??
                                            ancestors.first.title
                                        : ancestors.first.title,
                                    style: TextStyle(
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.w400,
                                      color: Colors.white,
                                      height: 1,
                                    ),
                                  ),
                                ),
                              ),
                              Container()
                            ],
                          ),

                          const SizedBox(
                            height: 30,
                          ),
                          CommonContainer(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 20,
                              ),
                              child: Column(
                                children: [
                                  Text(context.l10n.appointment),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        context.l10n.status,
                                        style: textStyleWithPrimarySemiBold
                                            .copyWith(color: Colors.black),
                                      ),
                                      Chip(
                                        backgroundColor: primaryColor,
                                        label: Text(
                                          _appointment.isOpened
                                              ? context.l10n.requested
                                              : _appointment.isWaiting
                                                  ? context.l10n.pending
                                                  : _appointment.isOnPeocessing
                                                      ? context
                                                          .l10n.onProccessing
                                                      : context.l10n.done,
                                          style: textStyleWithPrimarySemiBold
                                              .copyWith(color: Colors.white),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Center(
                                        child: Text(
                                          context.l10n.service,
                                          style: textStyleWithPrimarySemiBold
                                              .copyWith(color: Colors.black),
                                        ),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    ancestors
                                        .sublist(1)
                                        .map((e) => e.getTitle(context))
                                        .toList()
                                        .join('/'),
                                    style:
                                        textStyleWithPrimarySemiBold.copyWith(),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          const SizedBox(height: 30),
                          CommonContainer(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 20,
                              ),
                              child: Column(
                                children: [
                                  Text(context.l10n.paymentInfo),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${context.l10n.price} ',
                                        style: textStyleWithPrimarySemiBold
                                            .copyWith(
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        '${_appointment.price ?? leafService.price} ${context.l10n.egp}',
                                        style: textStyleWithSecondBold(),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        context.l10n.paymentMethod,
                                        style: textStyleWithPrimarySemiBold
                                            .copyWith(color: Colors.black),
                                      ),
                                      Text(
                                        _appointment.isCredifCard
                                            ? context.l10n.creditCard
                                            : _appointment.isVf
                                                ? context.l10n.vf
                                                : context.l10n.cash,
                                        style: textStyleWithSecondBold(),
                                      ),
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        context.l10n.payed,
                                        style: textStyleWithPrimarySemiBold
                                            .copyWith(color: Colors.black),
                                      ),
                                      CircleAvatar(
                                        radius: 17,
                                        child: Icon(
                                          _appointment.payed
                                              ? Icons.check
                                              : Icons.close,
                                        ),
                                      )
                                    ],
                                  ),
                                  if (!_appointment.payed &&
                                      // _appointment.isCredifCard &&
                                      !inProviderApp)
                                    Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              context.l10n
                                                  .pleasetrytopayyourappointment,
                                            ),
                                            InkWell(
                                              child: Text(
                                                context.l10n.payNow,
                                                style: const TextStyle(
                                                  color: Colors.blueAccent,
                                                  fontWeight: FontWeight.bold,
                                                  fontStyle: FontStyle.italic,
                                                  decorationStyle:
                                                      TextDecorationStyle
                                                          .double,
                                                ),
                                              ),
                                              onTap: () {
                                                context
                                                    .read<AppointmentsCubit>()
                                                    .cratePaymentLinkFunc(
                                                      _appointment.id,
                                                    );
                                              },
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ),
                          // Section 1
                          const SizedBox(
                            height: 30,
                          ),
                          CommonContainer(
                            color: Colors.white,
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: 20,
                                horizontal: 20,
                              ),
                              child: Column(
                                children: [
                                  Text(context.l10n.date),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        '${context.l10n.date} ',
                                        style: textStyleWithPrimarySemiBold
                                            .copyWith(
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        DateFormat.yMMMMd(appLn10.localeName)
                                            .format(
                                          _appointment.date,
                                        ),
                                        style: textStyleWithSecondBold(),
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        context.l10n.from,
                                        style: textStyleWithPrimarySemiBold
                                            .copyWith(color: Colors.black),
                                      ),
                                      BlocBuilder<TimeSlotCubit,
                                          TimeSlotCubitState>(
                                        builder: (context, state) {
                                          if (state
                                              is TimeSlotCubitStateLoaded) {
                                            final timeSlot =
                                                _appointment.timeslot;
                                            return Text(
                                              timeSlot.startSting
                                                  .replaceAll(
                                                    'AM',
                                                    context.l10n.morning,
                                                  )
                                                  .replaceAll(
                                                    'PM',
                                                    context.l10n.evening,
                                                  ), //   '0
                                              style: textStyleWithSecondBold(),
                                            );
                                          }
                                          if (state
                                              is TimeSlotCubitStateLoading) {
                                            return const Text('Loading...');
                                          }
                                          return const SizedBox();
                                        },
                                      )
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        context.l10n.to,
                                        style: textStyleWithPrimarySemiBold
                                            .copyWith(color: Colors.black),
                                      ),
                                      BlocBuilder<TimeSlotCubit,
                                          TimeSlotCubitState>(
                                        builder: (context, state) {
                                          if (state
                                              is TimeSlotCubitStateLoaded) {
                                            final timeSlot =
                                                _appointment.timeslot;
                                            return Text(
                                              timeSlot.endSting
                                                  .replaceAll(
                                                    'AM',
                                                    context.l10n.morning,
                                                  )
                                                  .replaceAll(
                                                    'PM',
                                                    context.l10n.evening,
                                                  ), //   '0
                                              style: textStyleWithSecondBold(),
                                            );
                                          }
                                          if (state
                                              is TimeSlotCubitStateLoading) {
                                            return const Text('Loading...');
                                          }
                                          return const SizedBox();
                                        },
                                      )
                                    ],
                                  ),
                                  if (_appointment.hasDays)
                                    Column(
                                      children: [
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              context.l10n.days,
                                              style:
                                                  textStyleWithPrimarySemiBold
                                                      .copyWith(
                                                color: Colors.black,
                                              ),
                                            ),
                                            Text(
                                              _appointment.days.toString(),
                                              style: textStyleWithSecondBold(),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                  if (_appointment.hasSessions)
                                    Column(
                                      children: [
                                        const SizedBox(
                                          height: 15,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Text(
                                              'Days',
                                              style:
                                                  textStyleWithPrimarySemiBold
                                                      .copyWith(
                                                color: Colors.black,
                                              ),
                                            ),
                                            Text(
                                              _appointment.sessions.toString(),
                                              style: textStyleWithSecondBold(),
                                            )
                                          ],
                                        ),
                                      ],
                                    ),
                                ],
                              ),
                            ),
                          ),
                          // Row(
                          //   children: [
                          //     Text(
                          //       'Status :',
                          //       style: textStyleWithPrimarySemiBold,
                          //     ),
                          //     Text(
                          //       _appointment.isOpened
                          //           ? 'Requested'
                          //           : _appointment.isWaiting
                          //               ? 'Pending'
                          //               : _appointment.isOnPeocessing
                          //                   ? 'On Proccesing'
                          //                   : 'Done',
                          //       style: textStyleWithSecondBold(),
                          //     )
                          //   ],
                          // ),
                          if (inProviderApp)
                            const SizedBox(
                              height: 20,
                            ),
                          if (!inProviderApp && _appointment.provider != null)
                            Column(
                              children: [
                                const SizedBox(
                                  height: 20,
                                ),
                                ProviderInfo(
                                  providerId: _appointment.provider!,
                                ),
                              ],
                            ),
                          if (inProviderApp)
                            CommonContainer(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 20,
                                ),
                                child: Column(
                                  children: [
                                    const Text('Patient Information'),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Patient Name ',
                                          style: textStyleWithPrimarySemiBold
                                              .copyWith(
                                            fontSize: 20,
                                            color: Colors.black,
                                          ),
                                        ),
                                        Text(
                                          user.name,
                                          style: textStyleWithSecondBold(),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Phone Number',
                                          style: textStyleWithPrimarySemiBold
                                              .copyWith(color: Colors.black),
                                        ),
                                        InkWell(
                                          onTap: () async {
                                            await launchUrl(
                                              Uri.parse(
                                                'tel:${user.phoneNumber}',
                                              ),
                                            );
                                          },
                                          child: Text(
                                            user.phoneNumber,
                                            style: textStyleWithSecondBold()
                                                .copyWith(
                                              color: Colors.blueAccent,
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    const SizedBox(
                                      height: 10,
                                    ),
                                    Button1(
                                      size: const Size(200, 15),
                                      title: 'More ',
                                      onPressed: () {
                                        context.router.push(
                                          UserInformationPageRoute(
                                            user: user.copyWith(
                                              details: _appointment.details,
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          if (_appointment.hasSessions)
                            Column(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      '${context.l10n.sessions} :',
                                      style: textStyleWithPrimarySemiBold,
                                    ),
                                    Text(
                                      '${_appointment.sessions} ',
                                      style: textStyleWithSecondBold(),
                                    )
                                  ],
                                ),
                              ],
                            ),

                          const SizedBox(
                            height: 30,
                          ),
                          Column(
                            children: [
                              Row(
                                children: [
                                  Text(
                                    context.l10n.patientFeeling,
                                    style: textStyleWithPrimarySemiBold,
                                    textAlign: TextAlign.start,
                                  ),
                                ],
                              ),
                              const SizedBox(
                                height: 10,
                              ),
                              BighFormField(
                                enabled: false,
                                fillColor: Colors.white,
                                controller: TextEditingController()
                                  ..text = _appointment.reason,
                                style: textStyleWithSecondBold(),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 20,
                          ),

                          if (_appointment.isVideo &&
                              !_appointment.isOpened &&
                              !_appointment.isWaiting &&
                              !_appointment.isDone &&
                              _appointment.payed == true)
                            StartVideoButton(appointment: _appointment),

                          if (widget.appointment.attachments.isNotEmpty &&
                              inProviderApp)
                            Column(
                              children: [
                                const SizedBox(height: 30),
                                Row(
                                  children: [
                                    Text(
                                      '${context.l10n.attachments}:',
                                      style: textStyleWithPrimarySemiBold,
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 200,
                                  child: AppointmentAttachemntsWidget(
                                    urls: widget.appointment.attachments,
                                  ),
                                ),
                              ],
                            ),

                          if (_appointment.location != null &&
                              !_appointment.isVideo)
                            CommonContainer(
                              color: Colors.white,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(
                                  vertical: 20,
                                  horizontal: 20,
                                ),
                                child: Column(
                                  children: [
                                    Text(context.l10n.address),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          context.l10n.address,
                                          style: textStyleWithPrimarySemiBold
                                              .copyWith(color: Colors.black),
                                        ),
                                        Text(
                                          _appointment.location!.address,
                                          style: textStyleWithPrimarySemiBold
                                              .copyWith(),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),

                          const SizedBox(height: 30),
                          if (_appointment.location != null &&
                              _appointment.location!.coordinates.isNotEmpty &&
                              !_appointment.isVideo)
                            SizedBox(
                              height: 300,
                              child: MapWidget(
                                latLong: LatLng(
                                  _appointment.location!.coordinates[0],
                                  _appointment.location!.coordinates[1],
                                ),
                              ),
                            ),
                          const SizedBox(height: 30),
                          if (_appointment.providerComment != null &&
                              inProviderApp)
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      context.l10n.yourNote,
                                      style: textStyleWithPrimarySemiBold,
                                      textAlign: TextAlign.start,
                                    ),
                                  ],
                                ),
                                const SizedBox(
                                  height: 10,
                                ),
                                BighFormField(
                                  enabled: false,
                                  fillColor: Colors.white,
                                  controller: TextEditingController()
                                    ..text = _appointment.providerComment!,
                                  style: textStyleWithSecondBold(),
                                ),
                              ],
                            ),
                          if (!_appointment.isDone && inProviderApp)
                            getProviderButton(context),
                          if ((!_appointment.rated && _appointment.isDone) &&
                              !inProviderApp)
                            Button1(
                              size: const Size(330, 40),
                              title: context.l10n.addReview,
                              onPressed: () {
                                var rating = 3.0;
                                var review = '';
                                showDialog<void>(
                                  context: context,
                                  builder: (context) => Dialog(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(6),
                                    ),
                                    child: SizedBox(
                                      height: ScreenUtil().setHeight(330),
                                      width: ScreenUtil().setWidth(350),
                                      child: Padding(
                                        padding: const EdgeInsets.all(12),
                                        child: Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Text(
                                                  context.l10n.addReview,
                                                  style:
                                                      textStyleWithPrimaryBold,
                                                  textAlign: TextAlign.center,
                                                ),
                                              ],
                                            ),
                                            const SizedBox(height: 10),
                                            Row(
                                              children: [
                                                SizedBox(
                                                  height: 20.h,
                                                  child: RatingBar.builder(
                                                    itemSize: 30,
                                                    initialRating: 3,
                                                    minRating: 1,
                                                    allowHalfRating: true,
                                                    itemBuilder: (context, _) =>
                                                        const Icon(
                                                      Icons.star,
                                                      color: Colors.amber,
                                                      size: 10,
                                                    ),
                                                    onRatingUpdate: (v) {
                                                      rating = v;
                                                    },
                                                  ),
                                                ),
                                              ],
                                            ),
                                            SizedBox(height: 20.h),
                                            TextFormField(
                                              onChanged: (value) {
                                                review = value;
                                              },
                                              minLines: 4,
                                              maxLines: 5,
                                              decoration: InputDecoration(
                                                hintText:
                                                    context.l10n.writeReview,
                                                contentPadding:
                                                    const EdgeInsets.all(8),
                                                border: OutlineInputBorder(
                                                  borderRadius:
                                                      BorderRadius.circular(6),
                                                ),
                                              ),
                                            ),
                                            SizedBox(height: 10.h),
                                            Button1(
                                              title: context.l10n.addReview,
                                              onPressed: () async {
                                                await context.router.pop();
                                                await Future.delayed(
                                                    Duration.zero, () async {
                                                  await context
                                                      .read<AppointmentsCubit>()
                                                      .rateFunc(
                                                        RatingParams(
                                                          service: _appointment
                                                              .service,
                                                          rating: rating,
                                                          review: review,
                                                          appointmentId:
                                                              _appointment.id,
                                                        ),
                                                      );
                                                });
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          const SizedBox(height: 30),
                          // if (
                          //   _appointment.isOnPeocessing &&
                          //     inProviderApp &&
                          //     !_appointment.payed &&
                          //     _appointment.isCash
                          //     )
                          //   Button1(
                          //     title: context.l10n.payNow,
                          //     size: const Size(330, 40),
                          //     onPressed: () {
                          //       context
                          //           .read<AppointmentsCubit>()
                          //           .providerPayFunc(_appointment.id);
                          //     },
                          //   ),
                        ],
                      ),
                    ),
                  );
                }
                return const SizedBox();
              },
            ),
          );
        }
        if (state is UserCubitStateError) {
          return Center(child: Text(state.error.errorMessege));
        }
        if (state is UserCubitStateLoading) {
          return const Center(child: CircularProgressIndicator());
        }
        return const SizedBox();
      },
    );
  }
}

class StartVideoButton extends StatelessWidget {
  const StartVideoButton({super.key, required this.appointment});
  final Appointment appointment;
  @override
  Widget build(BuildContext context) {
    return BlocProvider<AgoraTokenCubitCubit>(
      create: (context) => getIt(),
      child: Builder(
        builder: (context) {
          return BlocListener<AgoraTokenCubitCubit, AgoraTokenCubitCubitState>(
            listener: (context, state) {
              if (state is AgoraTokenCubitCubitStateLoaded) {
                EasyLoading.dismiss();

                // listenToChange(context, state.appointment);
                requestAgoraPermissions().then((value) {
                  context.router.push(
                    VideoPageeRouter(
                      token: state.appointments.token,
                      uid: state.appointments.uid,
                      channelName: appointment.id,
                    ),
                  );
                });
              }
            },
            child: Button1(
              onPressed: () async {
                await context
                    .read<AgoraTokenCubitCubit>()
                    .stratVideoFunc(appointment.id);
              },
              title: '',
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    context.l10n.startvideoNow,
                    style: TextStyle(
                      fontSize: 16.sp,
                      height: 1,
                      color: Colors.white,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  const Icon(
                    Icons.video_call,
                    color: Colors.white,
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProviderInfo extends StatelessWidget {
  const ProviderInfo({super.key, required this.providerId});
  final String providerId;
  String getRoleTitle(BuildContext context, String role) {
    if (role == 'nurse') return context.l10n.nurseInformation;
    if (role == 'laboratory') return context.l10n.laboratoryInformation;

    return context.l10n.doctorInformation;
  }

  String getRoleName(BuildContext context, String role) {
    if (role == 'nurse') return context.l10n.nurseName;
    if (role == 'laboratory') return context.l10n.laboratopryName;

    return context.l10n.doctorName;
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<OurDoctorsCubit, OurDoctorsCubitState>(
      builder: (context, state) {
        if (state is OurDoctorsCubitStateLoaded) {
          final provider = state.ourDoctors.firstWhere(
            (element) => element.id == providerId,
          );

          return CommonContainer(
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 20,
              ),
              child: Column(
                children: [
                  Text(getRoleTitle(context, provider.role)),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        getRoleName(context, provider.role),
                        style: textStyleWithPrimarySemiBold.copyWith(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        provider.name,
                        style: textStyleWithSecondBold(),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        context.l10n.specialty,
                        style: textStyleWithPrimarySemiBold.copyWith(
                          fontSize: 20,
                          color: Colors.black,
                        ),
                      ),
                      Text(
                        provider.specialization ?? provider.role,
                        style: textStyleWithSecondBold(),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  // Button1(
                  //   size: const Size(200, 15),
                  //   title: 'More ',
                  //   onPressed: () {
                  //     context.router.push(
                  //       UserInformationPageRoute(
                  //         user: user,
                  //       ),
                  //     );
                  //   },
                  // ),
                ],
              ),
            ),
          );
        }
        if (state is OurDoctorsCubitStateLoading) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is OurDoctorsCubitStateError) {
          return Center(child: Text(state.error.errorMessege));
        }
        return const SizedBox();
      },
    );
  }
}
