import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_scaffold.dart';
import 'package:home_cure/features/authentication/domain/entities/forget_password_params.dart';
import 'package:home_cure/features/login/presentation/change_phone_number_cubit/change_phone_number_cubit.dart';
import 'package:home_cure/features/login/presentation/change_phone_number_cubit/change_phone_number_state.dart';
import 'package:home_cure/features/login/presentation/widgets/register_field.dart';
import 'package:home_cure/gen/assets.gen.dart';
import 'package:home_cure/l10n/l10n.dart';
import 'package:overlay_support/overlay_support.dart';

class ChangePhoneNumberPage extends StatefulWidget {
  const ChangePhoneNumberPage({super.key});

  @override
  State<ChangePhoneNumberPage> createState() => _ChangePhoneNumberPageState();
}

class _ChangePhoneNumberPageState extends State<ChangePhoneNumberPage> {
  @override
  void initState() {
    // Future.delayed(const Duration(), showOverly);

    super.initState();
  }

  final controller = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: SingleChildScrollView(
        child: BlocListener<ChangePhoneNumberCubit, ChangePhoneNumberState>(
          listener: (context, state) {
            if (state is ChangePhoneNumberStateError) {
              Future.delayed(Duration.zero, () {
                   showSimpleNotification(
                  Text(state.error.errorMessege),
                  background: Colors.red,
                );
                // ScaffoldMessenger.of(context)
                //   ..clearSnackBars()
                //   ..showSnackBar(
                //     SnackBar(content: Text(state.error.errorMessege)),
                //   );
              });
            }
            if (state is ChangePhoneNumberStateChangePhoneNumberTokenLoaded) {
              context.router.push(const VerifyChangePhoneNumberPageRouter());
            }
          },
          child: SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(40),
              child: Center(
                child: Form(
                  autovalidateMode: AutovalidateMode.always,
                  key: _formKey,
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 50,
                      ),
                      Center(child: Assets.img.logo.image()),
                      const SizedBox(
                        height: 50,
                      ),
                      Text('Forget Password?', style: textStyleWithPrimaryBold),
                      SizedBox(
                        height: 22.h,
                      ),
                      Text(
                        '''Please enter your phone number to send a 4-digit code to reset your password''',
                        style: textStyleWithPrimaryBold,
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(
                        height: 22.h,
                      ),
                      RegisterField(
                        isPhoneNumber: true,
                        // hint: 'Phone number',
                        hint: 'Phone Number',
                        controller: controller,
                        validator: (v) {
                          const patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                          final regExp = RegExp(patttern);
                          if (v!.isEmpty) {
                            return context.l10n.plEnterPhone;
                          }
                          return regExp.hasMatch(v)
                              ? null
                              : context.l10n.plEnterPhone;
                        },
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      BlocBuilder<ChangePhoneNumberCubit,
                          ChangePhoneNumberState>(
                        builder: (context, state) {
                          if (state is ChangePhoneNumberStateLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return Button1(
                            size: Size(120.h, 36.h),
                            title: context.l10n.send,
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await context
                                    .read<ChangePhoneNumberCubit>()
                                    .changePhoneNumber(
                                      ForgetPasswordParam(
                                        email: controller.text,
                                      ),
                                    );
                              }
                            },
                          );
                        },
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
