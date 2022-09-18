import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:home_cure/app/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/widgets/big_form_field.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/features/appointement/domain/entities/appointment.dart';
import 'package:home_cure/features/appointement/domain/entities/done_params.dart';
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
    _appointment = widget.appointment;
    if (UserCubit.get(context).state is UserCubitStateInitil) {
      UserCubit.get(context).getUserFuc(_appointment.user);
      inProviderApp = true;
    }

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
    // context.router.push(const DoneRoute());
  }

  @override
  Widget build(BuildContext context) {
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
                    padding: const EdgeInsets.all(40),
                    child: SingleChildScrollView(
                      child: Column(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(30),
                              color: const Color(0xff218FE4),
                            ),
                            child: Center(
                              child: Text(
                                ancestors
                                    .map((e) => e.title)
                                    .toList()
                                    .join('/'),
                                style: TextStyle(
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                  color: Colors.white,
                                  height: 1,
                                ),
                              ),
                            ),
                          ),

                          const SizedBox(
                            height: 60,
                          ),
                          if (inProviderApp)
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Pateient Name: :',
                                      style: textStyleWithPrimaryBold,
                                    ),
                                    Text(
                                      user.name,
                                      style: textStyleWithSecondBold(),
                                    )
                                  ],
                                ),

                                /// More
                                InkWell(
                                  child: Text(
                                    'More ',
                                    style: TextStyle(
                                      color: Colors.blue,
                                      fontSize: 20.sp,
                                      fontWeight: FontWeight.bold,
                                      fontStyle: FontStyle.italic,
                                      decoration: TextDecoration.underline,
                                      decorationStyle:
                                          TextDecorationStyle.double,
                                    ),
                                  ),
                                  onTap: () {
                                    context.router.push(
                                      UserInformationPageRoute(
                                        user: user,
                                      ),
                                    );
                                  },
                                )
                              ],
                            ),
                          const SizedBox(height: 30),
                          // Payment Tap
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Text(
                                    'Payed :',
                                    style: textStyleWithPrimaryBold,
                                  ),
                                  if (_appointment.payed)
                                    const Icon(
                                      Icons.check,
                                      color: seocondColor,
                                      size: 30,
                                    )
                                  else
                                    const Icon(
                                      Icons.close,
                                      color: seocondColor,
                                      size: 30,
                                    ),
                                ],
                              ),
                              if (!_appointment.payed)
                                Row(
                                  children: [
                                    const SizedBox(
                                      width: 20,
                                    ),
                                    InkWell(
                                      child: Text(
                                        'Pay Now',
                                        style: TextStyle(
                                          color: Colors.blue,
                                          fontSize: 20.sp,
                                          fontWeight: FontWeight.bold,
                                          fontStyle: FontStyle.italic,
                                          decoration: TextDecoration.underline,
                                          decorationStyle:
                                              TextDecorationStyle.double,
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
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Text(
                                'Price :',
                                style: textStyleWithPrimaryBold,
                              ),
                              Text(
                                '${leafService.price} LE',
                                style: textStyleWithSecondBold(),
                              )
                            ],
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
                                      'Sessions :',
                                      style: textStyleWithPrimaryBold,
                                    ),
                                    Text(
                                      '${_appointment.sessions} ',
                                      style: textStyleWithSecondBold(),
                                    )
                                  ],
                                ),
                              ],
                            ),

                          if (_appointment.hasDays)
                            Column(
                              children: [
                                const SizedBox(
                                  height: 30,
                                ),
                                Row(
                                  children: [
                                    Text(
                                      'Days :',
                                      style: textStyleWithPrimaryBold,
                                    ),
                                    Text(
                                      '${_appointment.days} ',
                                      style: textStyleWithSecondBold(),
                                    )
                                  ],
                                ),
                              ],
                            ),
                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Text(
                                'Date :',
                                style: textStyleWithPrimaryBold,
                              ),
                              Text(
                                DateFormat.yMMMMd().format(_appointment.date),
                                style: textStyleWithSecondBold(),
                              )
                            ],
                          ),

                          const SizedBox(
                            height: 30,
                          ),
                          Row(
                            children: [
                              Text(
                                'Time :',
                                style: textStyleWithPrimaryBold,
                              ),
                              BlocBuilder<TimeSlotCubit, TimeSlotCubitState>(
                                builder: (context, state) {
                                  if (state is TimeSlotCubitStateLoaded) {
                                    final timeSlot = state.timeSlots.firstWhere(
                                      (element) =>
                                          element.id == _appointment.timeslot,
                                    );
                                    return Text(
                                      '''${timeSlot.startSting} To ${timeSlot.endSting}''',
                                      style: textStyleWithSecondBold(),
                                    );
                                  }
                                  if (state is TimeSlotCubitStateLoading) {
                                    return const Text('Loading...');
                                  }
                                  return const SizedBox();
                                },
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 30,
                          ),

                          const SizedBox(
                            height: 20,
                          ),

                          if (_appointment.isVideo)
                            Button1(
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
                          if (widget.appointment.attachments.isNotEmpty)
                            Column(
                              children: [
                                const SizedBox(height: 30),
                                Row(
                                  children: [
                                    Text(
                                      'Attcahments:',
                                      style: textStyleWithPrimaryBold,
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
                          if (_appointment.location != null)
                            Row(
                              children: [
                                Text(
                                  'Adress :',
                                  style: textStyleWithPrimaryBold,
                                ),
                                Text(_appointment.location!.address)
                              ],
                            ),
                          const SizedBox(height: 30),
                          if (_appointment.location != null &&
                              _appointment.location!.coordinates.isNotEmpty)
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
                          if (_appointment.providerComment != null)
                            Column(
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      'Your Note:',
                                      style: textStyleWithPrimaryBold,
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
                          if (!_appointment.isDone)
                            Button1(
                              title: getButtonTitle(),
                              size: const Size(330, 40),
                              onPressed: () {
                                getAcction(context);
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
