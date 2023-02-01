import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/utils/validation_regx.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/features/authentication/domain/entities/reset_password_params.dart';
import 'package:home_cure/features/login/presentation/forget_password_bloc/forget_password_cubit.dart';
import 'package:home_cure/features/login/presentation/forget_password_bloc/forget_password_state.dart';
import 'package:home_cure/features/login/presentation/widgets/register_field.dart';
import 'package:home_cure/gen/assets.gen.dart';
import 'package:home_cure/l10n/l10n.dart';
import 'package:overlay_support/overlay_support.dart';

class ReserPhoneNumberPage extends StatefulWidget {
  const ReserPhoneNumberPage({super.key});

  @override
  State<ReserPhoneNumberPage> createState() => _ReserPhoneNumberPageState();
}

class _ReserPhoneNumberPageState extends State<ReserPhoneNumberPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  final _formKey = GlobalKey<FormState>();
  final passwordController = TextEditingController();
  final confirmCasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) => Scaffold(
        body: BlocConsumer<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state is ForgetPasswordStateError) {
                 showSimpleNotification(
                Text(state.error.errorMessege),
                background: Colors.red,
              );
              // ScaffoldMessenger.of(context).showSnackBar(
              //   SnackBar(content: Text(state.error.errorMessege)),
              // );
            }
            if (state is ForgetPasswordStateResetPasswordSuccess) {
              context.router.pushAndPopUntil(
                const LoginPagePageRouter(),
                predicate: (v) => false,
              );
            }
          },
          builder: (context, state) {
            return Form(
              key: _formKey,
              child: SafeArea(
                child: SingleChildScrollView(
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      children: [
                        SizedBox(
                          height: 50.h,
                        ),
                        Center(child: Assets.img.logo.image()),
                        SizedBox(
                          height: 50.h,
                        ),
                        Text(
                         context.l10n.passwordReset,
                          style: textStyleWithPrimaryBold,
                          textAlign: TextAlign.center,
                        ),
                        SizedBox(
                          height: 20.h,
                        ),
                        RegisterField(
                          controller: passwordController,
                          isPassword: true,
                          hint: 'phoneNumber',
                          validator: (value) {
                            if (value!.isEmpty) {
                              return context.l10n.phoneNumberShoildNotBeEmpty;
                            }
                            if (value.length < 8) {
                              return 'pasword should be at least 8 characters';
                            }
                            if (!ValidationsPatterns.conCharacter
                                .hasMatch(value)) {
                              return '''password should contain at least one letter''';
                            }
                            if (!ValidationsPatterns.contDigit
                                .hasMatch(value)) {
                              return '''password should contain at least one number''';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 12.h,
                        ),
                        RegisterField(
                          isPassword: true,
                          hint: context.l10n.confirmPassword,
                          controller: confirmCasswordController,
                          validator: (value) {
                            if (value != passwordController.text) {
                              return 'not identical password';
                            }
                            return null;
                          },
                        ),
                        SizedBox(
                          height: 35.h,
                        ),
                        BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                          builder: (context, state) {
                            if (state is ForgetPasswordStateLoading) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            }
                            return Button1(
                              size: Size(120.w, 30),
                              title: 'Confirm',
                              onPressed: () {
                                if (_formKey.currentState!.validate()) {
                                  if (state
                                      is ForgetPasswordStateResetTokenLoaded) {
                                    context
                                        .read<ForgetPasswordCubit>()
                                        .resetPassword(
                                          ResetPasswordParams(
                                            password: passwordController.text,
                                            token: state.token,
                                          ),
                                        );
                                  }
                                }
                              },
                            );
                          },
                        )
                      ],
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      );
}
