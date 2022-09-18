// ignore_for_file: use_full_hex_values_for_flutter_colors

import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/features/appointement/presentation/blocs/appointment_params_cubit.dart/appointment_params_cubit.dart';
import 'package:home_cure/features/appointement/presentation/blocs/appointments_creating_bloc/appointments_cubit.dart';
import 'package:home_cure/features/appointement/presentation/widgets/fees_widget.dart';
import 'package:home_cure/features/appointement/presentation/widgets/payment_stipper.dart';
import 'package:home_cure/features/home/domain/entities/service.dart';
import 'package:home_cure/gen/assets.gen.dart';

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
  String paymentMethod = '';
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
          if (state is AppointmentsCubitStateCreated) {
            EasyLoading.dismiss();
            context.router.push(const DoneRoute());
          }

          if (state is AppointmentsCubitStatePayed) {
            EasyLoading.dismiss();
            context.router.push(const DoneRoute());
          }
        },
        child: Column(
          children: [
            const PaymentStipper(),
            Padding(
              padding: const EdgeInsets.all(40),
              child: Column(
                children: [
                  if (widget.service.price != null)
                    FessContainer(
                      price: widget.service.price.toDouble(),
                    ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Container(
                    height: 135.h,
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
                            'Payment method',
                            style: textStyleWithPrimarySemiBold.copyWith(
                              color: const Color(0xff1AA9A0),
                            ),
                          ),
                          Expanded(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Expanded(
                                  child: InkWell(
                                    onTap: () {
                                      setState(() {
                                        paymentMethod = 'cash';
                                      });
                                      context
                                          .read<AppointmentsParamsCubit>()
                                          .addPaymentMethod(paymentMethod);
                                    },
                                    child: Container(
                                      decoration: paymentMethod != 'cash'
                                          ? null
                                          : BoxDecoration(
                                              border:
                                                  Border.all(color: Colors.red),
                                            ),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Assets.img.currency.image(),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
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
                                          Assets.img.visa.image(),
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
                                  'Add PromoCode',
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
                  )
                ],
              ),
            ),
            const SizedBox(
              height: 40,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 30.sp),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Button1(
                    onPressed: () {},
                    title: 'Cancel',
                    color: const Color(0xff1AA9A0),
                  ),
                  Button1(
                    onPressed: () {
                      final appointmentParamsSatet =
                          context.read<AppointmentsParamsCubit>().state;
                      context.read<AppointmentsCubit>().createAppointementFunc(
                            appointmentParamsSatet.toCreateAppointmentParams(),
                          );
                      // context.router.push(const DoneRoute());
                    },
                    title: 'Done',
                  ),
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
                'PromoCode',
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
              title: 'oK',
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
