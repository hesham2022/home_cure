import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
import 'package:home_cure/features/appointement/presentation/blocs/agora_token_cubit/agora_token_cubit.dart';
import 'package:home_cure/features/appointement/presentation/blocs/appointments_creating_bloc/appointments_cubit.dart';
import 'package:home_cure/features/appointement/presentation/blocs/get_appointments_cubit/my_appointments_cubit..dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit_state.dart';
import 'package:home_cure/features/home/domain/entities/service.dart';
import 'package:home_cure/features/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:home_cure/features/home/presentation/blocs/timeslot_cubit/timeslot_cubit.dart';
import 'package:home_cure/features/notifications/presentation/widgets/appointement_attach_widget.dart';
import 'package:home_cure/features/notifications/presentation/widgets/appointment_action_dialouge.dart';
import 'package:home_cure/features/notifications/presentation/widgets/map_widget.dart';
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
    super.initState();
  }

  String getButtonTitle() {
    if (_appointment.isWaiting) return 'Start';
    if (_appointment.isOnPeocessing) return 'Done';

    return 'Accept';
  }

  void getAcction(BuildContext context) {
    showDialog<void>(
      context: context,
      builder: (_) => ApppointmentActionDiaouge(
        appointment: _appointment,
        title: 'Are You Sure  ',
        validator: (value) {
          if (value!.isEmpty) {
            return 'feddback is empty';
          }
          if (value.length < 2) {
            return 'feddback is too short';
          }
          return null;
        },
        onDone: (value) {
          final cubit = context.read<AppointmentsCubit>();
          if (_appointment.isOpened) {
            cubit.acceptFunc(_appointment.id);
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
                        EasyLoading.showInfo('Payment Failed');
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
                            height: 60,
                          ),

                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: const Color(0xff218FE4),
                            ),
                            child: Center(
                              child: Text(
                                ancestors.first.title,
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  height: 1,
                                ),
                              ),
                            ),
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Clipboard.setData(
                                    ClipboardData(text: _appointment.id),
                                  ).then((_) {
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      const SnackBar(
                                        content: Text(
                                          'Id copied to clipboard',
                                        ),
                                      ),
                                    );
                                  });
                                },
                                icon: const Icon(Icons.copy_all),
                              ),
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
                                  const Text('Appointmnet'),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Status',
                                        style: textStyleWithPrimarySemiBold
                                            .copyWith(color: Colors.black),
                                      ),
                                      Chip(
                                        backgroundColor: primaryColor,
                                        label: Text(
                                          _appointment.isOpened
                                              ? 'Requested'
                                              : _appointment.isWaiting
                                                  ? 'Pending'
                                                  : _appointment.isOnPeocessing
                                                      ? 'On Proccesing'
                                                      : 'Done',
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
                                          'Service',
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
                                        .map((e) => e.title)
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
                                  const Text('Payment Info'),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Price ',
                                        style: textStyleWithPrimarySemiBold
                                            .copyWith(
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        '${_appointment.price ?? leafService.price} LE',
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
                                        'Payment Method',
                                        style: textStyleWithPrimarySemiBold
                                            .copyWith(color: Colors.black),
                                      ),
                                      Text(
                                        _appointment.paymentMethod.replaceRange(
                                          0,
                                          1,
                                          _appointment
                                              .paymentMethod.characters.first
                                              .toUpperCase(),
                                        ),
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
                                        'Payed',
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
                                      _appointment.isCredifCard)
                                    Column(
                                      children: [
                                        const SizedBox(
                                          height: 10,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            const Text(
                                              'Please try to pay your appointment',
                                            ),
                                            InkWell(
                                              child: const Text(
                                                'Pay Now',
                                                style: TextStyle(
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
                                  const Text('Date'),
                                  const SizedBox(
                                    height: 15,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        'Date ',
                                        style: textStyleWithPrimarySemiBold
                                            .copyWith(
                                          fontSize: 20,
                                          color: Colors.black,
                                        ),
                                      ),
                                      Text(
                                        DateFormat.yMMMMd()
                                            .format(_appointment.date),
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
                                        'From',
                                        style: textStyleWithPrimarySemiBold
                                            .copyWith(color: Colors.black),
                                      ),
                                      BlocBuilder<TimeSlotCubit,
                                          TimeSlotCubitState>(
                                        builder: (context, state) {
                                          if (state
                                              is TimeSlotCubitStateLoaded) {
                                            final timeSlot =
                                                state.timeSlots.firstWhere(
                                              (element) =>
                                                  element.id ==
                                                  _appointment.timeslot,
                                            );
                                            return Text(
                                              timeSlot.startSting,
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
                                        'To',
                                        style: textStyleWithPrimarySemiBold
                                            .copyWith(color: Colors.black),
                                      ),
                                      BlocBuilder<TimeSlotCubit,
                                          TimeSlotCubitState>(
                                        builder: (context, state) {
                                          if (state
                                              is TimeSlotCubitStateLoaded) {
                                            final timeSlot =
                                                state.timeSlots.firstWhere(
                                              (element) =>
                                                  element.id ==
                                                  _appointment.timeslot,
                                            );
                                            return Text(
                                              timeSlot.endSting,
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
                                              'Days',
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
                                            user: user,
                                          ),
                                        );
                                      },
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          // if (inProviderApp)
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Row(
                          //       children: [
                          //         Text(
                          //           'Pateient Name: :',
                          //           style: textStyleWithPrimarySemiBold,
                          //         ),
                          //         Text(
                          //           user.name,
                          //           style: textStyleWithSecondBold(),
                          //         )
                          //       ],
                          //     ),

                          //     /// More
                          //     InkWell(
                          //       child: Text(
                          //         'More ',
                          //         style: TextStyle(
                          //           color: Colors.blue,
                          //           fontSize: 20.sp,
                          //           fontWeight: FontWeight.bold,
                          //           fontStyle: FontStyle.italic,
                          //           decoration: TextDecoration.underline,
                          //           decorationStyle:
                          //               TextDecorationStyle.double,
                          //         ),
                          //       ),
                          //       onTap: () {
                          //         context.router.push(
                          //           UserInformationPageRoute(
                          //             user: user,
                          //           ),
                          //         );
                          //       },
                          //     )
                          //   ],
                          // ),

                          // const SizedBox(height: 30),
                          // Payment Tap
                          // Row(
                          //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          //   children: [
                          //     Row(
                          //       children: [
                          //         Text(
                          //           'Payed :',
                          //           style: textStyleWithPrimarySemiBold,
                          //         ),
                          //         if (_appointment.payed)
                          //           const Icon(
                          //             Icons.check,
                          //             color: seocondColor,
                          //             size: 30,
                          //           )
                          //         else
                          //           const Icon(
                          //             Icons.close,
                          //             color: seocondColor,
                          //             size: 30,
                          //           ),
                          //       ],
                          //     ),
                          //     if (!_appointment.payed &&
                          //         _appointment.isCredifCard)
                          //       Row(
                          //         children: [
                          //           const SizedBox(
                          //             width: 20,
                          //           ),
                          //           InkWell(
                          //             child: Text(
                          //               'Pay Now',
                          //               style: TextStyle(
                          //                 color: Colors.blue,
                          //                 fontSize: 20.sp,
                          //                 fontWeight: FontWeight.bold,
                          //                 fontStyle: FontStyle.italic,
                          //                 decoration: TextDecoration.underline,
                          //                 decorationStyle:
                          //                     TextDecorationStyle.double,
                          //               ),
                          //             ),
                          //             onTap: () {
                          //               context
                          //                   .read<AppointmentsCubit>()
                          //                   .cratePaymentLinkFunc(
                          //                     _appointment.id,
                          //                   );
                          //             },
                          //           )
                          //         ],
                          //       ),
                          //   ],
                          // ),

                          if (_appointment.hasSessions)
                            Column(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Sessions :',
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

                          // Row(
                          //   children: [
                          //     Text(
                          //       'Date :',
                          //       style: textStyleWithPrimarySemiBold,
                          //     ),
                          //     Text(
                          //       DateFormat.yMMMMd().format(_appointment.date),
                          //       style: textStyleWithSecondBold(),
                          //     )
                          //   ],
                          // ),

                          // const SizedBox(
                          //   height: 30,
                          // ),
                          // Row(
                          //   children: [
                          //     Text(
                          //       'Time :',
                          //       style: textStyleWithPrimarySemiBold,
                          //     ),
                          //     BlocBuilder<TimeSlotCubit, TimeSlotCubitState>(
                          //       builder: (context, state) {
                          //         if (state is TimeSlotCubitStateLoaded) {
                          //           final timeSlot = state.timeSlots.firstWhere(
                          //             (element) =>
                          //                 element.id == _appointment.timeslot,
                          //           );
                          //           return Text(
                          //             '''${timeSlot.startSting} To ${timeSlot.endSting}''',
                          //             style: textStyleWithSecondBold(),
                          //           );
                          //         }
                          //         if (state is TimeSlotCubitStateLoading) {
                          //           return const Text('Loading...');
                          //         }
                          //         return const SizedBox();
                          //       },
                          //     )
                          //   ],
                          // ),
                          const SizedBox(
                            height: 30,
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          if (_appointment.isVideo && !_appointment.isDone)
                            StartVideoButton(appointment: _appointment),
                          if (widget.appointment.attachments.isNotEmpty)
                            Column(
                              children: [
                                const SizedBox(height: 30),
                                Row(
                                  children: [
                                    Text(
                                      'Attcahments:',
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
                                    const Text('Address'),
                                    const SizedBox(
                                      height: 15,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Address',
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
                          // Row(
                          //   children: [
                          //     Text(
                          //       'Adress :',
                          //       style: textStyleWithPrimarySemiBold,
                          //     ),
                          //     Text(_appointment.location!.address)
                          //   ],
                          // ),
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
                                      'Your Note:',
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
                            Button1(
                              title: getButtonTitle(),
                              size: const Size(330, 40),
                              onPressed: () {
                                getAcction(context);
                              },
                            ),
                          const SizedBox(height: 30),
                          if (_appointment.isDone &&
                              inProviderApp &&
                              !_appointment.payed &&
                              _appointment.isCash)
                            Button1(
                              title: 'Pay',
                              size: const Size(330, 40),
                              onPressed: () {
                                context
                                    .read<AppointmentsCubit>()
                                    .providerPayFunc(_appointment.id);
                              },
                            )
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
                    'Start Vedio Now',
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
