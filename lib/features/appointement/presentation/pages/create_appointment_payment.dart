// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:auto_route/auto_route.dart';
import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/features/appointement/domain/entities/appointment.dart';
import 'package:home_cure/features/appointement/presentation/blocs/appointment_params_cubit.dart/appointment_params_cubit.dart';
import 'package:home_cure/features/appointement/presentation/blocs/appointments_creating_bloc/appointments_cubit.dart';
import 'package:home_cure/features/appointement/presentation/blocs/get_appointments_cubit/my_appointments_cubit..dart';
import 'package:home_cure/features/appointement/presentation/widgets/fees_widget.dart';
import 'package:home_cure/features/appointement/presentation/widgets/payment_stipper.dart';
import 'package:home_cure/features/home/domain/entities/service.dart';
import 'package:home_cure/features/home/presentation/blocs/timeslot_cubit/timeslot_cubit.dart';
import 'package:home_cure/gen/assets.gen.dart';
import 'package:home_cure/l10n/l10n.dart';

class CreateAppointmentPayment extends StatefulWidget {
  const CreateAppointmentPayment({
    super.key,
    required this.service,
  });
  final ServiceEntity service;

  @override
  State<CreateAppointmentPayment> createState() =>
      _CreateAppointmentPaymentState();
}

class _CreateAppointmentPaymentState extends State<CreateAppointmentPayment> {
  Appointment? _appointment;
  String paymentMethod = '';
  @override
  void initState() {
    if (widget.service.priceDiscount != null &&
        widget.service.priceDiscount != 0 &&
        widget.service.hasRangOfDays() == true) {
      context.read<AppointmentsParamsCubit>().addDiscount(
            widget.service.priceDiscount! *
                context.read<AppointmentsParamsCubit>().state.days!,
          );
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: BlocListener<AppointmentsCubit, AppointmentsCubitState>(
        listener: (context, state) {
          if (state is AppointmentsCubitStateLoading) {
            EasyLoading.show();
          }
          if (state is AppointmentsCubitStateError) {
            EasyLoading.showError(state.error.errorMessege);
          }
          if (state is AppointmentsCubitStateCreatedWithPayLink) {
            context.read<MyAppointmentsCubit>().addFromFcm(state.appointment);
            setState(() {
              _appointment = state.appointment;
            });

            EasyLoading.dismiss();
            context.router.push(
              WebViewPaymentRoute(
                callbackPayment: (url) {
                  if (url.contains('success=true')) {
                    context
                        .read<AppointmentsCubit>()
                        .userPayFunc(state.appointment.id);
                    // context.router.push(const DoneRoute());
                  } else {
                    EasyLoading.showInfo(
                      App.isAr(context) ? 'عملية الدفع فشلت' : 'Payment Failed',
                    );
                  }
                },
                url: state.appointment.link!,
                title: 'payment',
              ),
            );
            // EasyLoading.showSuccess('success');
          }
          if (state is AppointmentsCubitStateCreated) {
            EasyLoading.dismiss();
            context.router.pushAndPopUntil(
              const DoneRoute(),
              predicate: (router) => false,
            );
            if (context.read<TimeSlotCubit>().state
                is TimeSlotCubitStateLoaded) {
              final timeSlot = state.appointment.timeslot;

              AwesomeNotifications().createNotification(
                content: NotificationContent(
                  channelKey: 'basic_channel',
                  id: DateTime(
                    state.appointment.date.year,
                    state.appointment.date.month,
                    state.appointment.date.day,
                    timeSlot.startHour,
                    timeSlot.startMinute,
                  ).millisecond,
                  title: App.isAr(context)
                      ? 'يجب أن تبدأ الموعد بعد 15 دقيقة'
                      : 'You Should Start Appointment After 15 Minutes',
                ),
                schedule: NotificationCalendar.fromDate(
                  date: DateTime(
                    state.appointment.date.year,
                    state.appointment.date.month,
                    state.appointment.date.day,
                    timeSlot.startHour,
                    timeSlot.startMinute,
                  ).subtract(const Duration(minutes: 15)),
                ),
              );
            }
          }
          if (state is AppointmentsCubitStateCancelled) {
            EasyLoading.dismiss();
            context.read<MyAppointmentsCubit>().delete(_appointment!);
            context.router.pushAndPopUntil(
              const DoneRoute(),
              predicate: (route) => false,
            );
          }

          if (state is AppointmentsCubitStatePayed) {
            EasyLoading.dismiss();
            EasyLoading.dismiss();
            context.router.pushAndPopUntil(
              const DoneRoute(),
              predicate: (router) => false,
            );
            if (context.read<TimeSlotCubit>().state
                is TimeSlotCubitStateLoaded) {
              final timeSlot = state.appointment.timeslot;

              AwesomeNotifications().createNotification(
                content: NotificationContent(
                  channelKey: 'basic_channel',
                  id: DateTime(
                    state.appointment.date.year,
                    state.appointment.date.month,
                    state.appointment.date.day,
                    timeSlot.startHour,
                    timeSlot.startMinute,
                  ).millisecond,
                  title: App.isAr(context)
                      ? 'يجب أن تبدأ الموعد بعد 15 دقيقة'
                      : 'You Should Start Appointment After 15 Minutes',
                ),
                schedule: NotificationCalendar.fromDate(
                  date: DateTime(
                    state.appointment.date.year,
                    state.appointment.date.month,
                    state.appointment.date.day,
                    timeSlot.startHour,
                    timeSlot.startMinute,
                  ).subtract(const Duration(minutes: 15)),
                ),
              );
            }
          }
        },
        child: Column(
          children: [
            const PaymentStipper(),
            Padding(
              padding: const EdgeInsets.all(40).copyWith(bottom: 20),
              child: Column(
                children: [
                  if (widget.service.hasRangOfDays())
                    FessContainerForDays(
                      discount: context
                          .read<AppointmentsParamsCubit>()
                          .state
                          .discount,
                      price: widget.service.price.toDouble(),
                      days: AppointmentsParamsCubit.get(context).state.days!,
                    )
                  else
                    FessContainer(
                      price:
                          (AppointmentsParamsCubit.get(context).state.price ??
                                  widget.service.price)
                              .toDouble(),
                      discount:
                          AppointmentsParamsCubit.get(context).state.discount,
                    ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    height: 160.h,
                    decoration: BoxDecoration(
                      color: const Color(0xffFFFFFF),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            context.l10n.paymentMethod,
                            // 'Payment method',
                            style: textStyleWithPrimarySemiBold.copyWith(
                              color: const Color(0xff1AA9A0),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                if (!widget.service.isVideo &&
                                    !widget.service.isTele)
                                  Expanded(
                                    child: InkWell(
                                      onTap: () {
                                        setState(() {
                                          paymentMethod = 'vodafone cash';
                                        });
                                        context
                                            .read<AppointmentsParamsCubit>()
                                            .addPaymentMethod(paymentMethod);
                                      },
                                      child: Container(
                                        decoration:
                                            paymentMethod != 'vodafone cash'
                                                ? null
                                                : BoxDecoration(
                                                    border: Border.all(
                                                      color: Colors.red,
                                                    ),
                                                  ),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Column(
                                              children: [
                                                Assets.img.vf.image(height: 30),
                                                Text(
                                                  context.l10n.vf,
                                                  style:
                                                      textStyleWithSecondBold()
                                                          .copyWith(),
                                                )
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                if (!widget.service.isVideo &&
                                    !widget.service.isTele)
                                  Container(
                                    color: const Color(0xff1AA9A0),
                                    width: 1,
                                    margin: const EdgeInsets.only(top: 10),
                                  ),
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        paymentMethod = 'credit card';
                                      });
                                      context
                                          .read<AppointmentsParamsCubit>()
                                          .addPaymentMethod(paymentMethod);
                                    },
                                    child: Container(
                                      decoration: paymentMethod != 'credit card'
                                          ? null
                                          : BoxDecoration(
                                              border:
                                                  Border.all(color: Colors.red),
                                            ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Column(
                                            children: [
                                              Assets.img.visa.image(height: 30),
                                              Text(
                                                context.l10n.visa,
                                                style:
                                                    textStyleWithSecondBold(),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  InkWell(
                    onTap: () {
                      showBottomSheet<void>(
                        shape: const RoundedRectangleBorder(
                          borderRadius: BorderRadius.only(
                            topLeft: Radius.circular(40),
                            topRight: Radius.circular(40),
                          ),
                        ),
                        context: context,
                        builder: (_) => const AddCopunWidget(),
                      );
                    },
                    child: Container(
                      height: 90.h,
                      decoration: BoxDecoration(
                        color: const Color(0xffFFFFFF),
                        borderRadius: BorderRadius.circular(16),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(12),
                        child: Row(
                          children: [
                            Row(
                              children: [
                                Assets.svg.promo.svg(),
                                const SizedBox(
                                  width: 15,
                                ),
                                Text(
                                  context.l10n.addPromoCode,
                                  style: textStyleWithPrimarySemiBold.copyWith(
                                    color: const Color(0xff1AA9A0),
                                  ),
                                ),
                              ],
                            ),
                            const Spacer(),
                            const Icon(
                              Icons.arrow_forward_ios_outlined,
                              color: primaryColor,
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 40, top: 20),
                    child: Row(
                      children: [
                        Text(
                          context.l10n.transportaions,
                          style: textStyleWithPrimarySemiBold,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            // const SizedBox(
            //   height: 40,
            // ),
            Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: 30.sp).copyWith(bottom: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button1(
                    onPressed: () {
                      if (_appointment != null) {
                        context.read<AppointmentsCubit>().cancelFunc(
                              _appointment!.id,
                            );
                      } else {
                        context.router.popUntil((route) => route.isFirst);
                      }
                    },
                    title: context.l10n.cancel,
                    color: const Color(0xff1AA9A0),
                  ),
                  if (_appointment == null)
                    Button1(
                      onPressed: () {
                        if (paymentMethod.isEmpty) {
                          EasyLoading.showInfo(
                            context.l10n.pleaseselecpaymentMethin,
                          );
                          return;
                        }
                        final appointmentParamsSatet =
                            context.read<AppointmentsParamsCubit>().state;
                        context
                            .read<AppointmentsCubit>()
                            .createAppointementFunc(
                              appointmentParamsSatet
                                  .toCreateAppointmentParams(),
                            );
                        // context.router.push(const DoneRoute());
                      },
                      title: context.l10n.done,
                    )
                  else
                    Button1(
                      onPressed: () async {
                        final appointment =
                            await context.router.push<Appointment>(
                          AppointmenCompletePayPageRoute(
                            appointment: _appointment!,
                          ),
                        );
                        setState(() {
                          _appointment = appointment;
                        });
                        // AppointmentDetailsPageRoute
                        // context.router.pushAndPopUntil(
                        //   const MainScaffold(),
                        //   predicate: (r) => false,
                        // );
                      },
                      title: context.l10n.completePayment,
                    )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class AddCopunWidget extends StatelessWidget {
  const AddCopunWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 300,
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(30),
      ),
      child: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          children: [
            Center(
              child: Text(
                context.l10n.promoCode,
                style: textStyleWithSecondSemiBold,
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              decoration: InputDecoration(
                contentPadding: const EdgeInsets.all(5),
                hintStyle: TextStyle(
                  fontSize: 12.sp,
                  color: const Color(0xff1AA9A0),
                  fontWeight: FontWeight.w400,
                ),
                fillColor: const Color(0xff1AA9A0).withOpacity(.1),
                filled: true,
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xff3636364d),
                    width: 0,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                disabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xff3636364d),
                    width: 0,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xff3636364d),
                    width: 0,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
                errorBorder: OutlineInputBorder(
                  borderSide: const BorderSide(
                    color: Color(0xff3636364d),
                    width: 0,
                  ),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Button1(
              title: context.l10n.ok,
              br: 16,
              onPressed: () {
                context.router.pop();
              },
            )
          ],
        ),
      ),
    );
  }
}
