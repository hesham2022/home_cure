import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/utils/validation_regx.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_scaffold.dart';
import 'package:home_cure/features/authentication/domain/entities/forget_password_params.dart';
import 'package:home_cure/features/login/presentation/forget_password_bloc/forget_password_cubit.dart';
import 'package:home_cure/features/login/presentation/forget_password_bloc/forget_password_state.dart';
import 'package:home_cure/features/login/presentation/widgets/register_field.dart';
import 'package:home_cure/gen/assets.gen.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({super.key});

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
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
        child: BlocListener<ForgetPasswordCubit, ForgetPasswordState>(
          listener: (context, state) {
            if (state is ForgetPasswordStateError) {
              Future.delayed(Duration.zero, () {
                ScaffoldMessenger.of(context)
                  ..clearSnackBars()
                  ..showSnackBar(
                    SnackBar(content: Text(state.error.errorMessege)),
                  );
              });
            }
            if (state is ForgetPasswordStateForgetPasswordTokenLoaded) {
              context.router.push(const VaricationCodePageRouter());
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
                        // hint: 'Phone number',
                        hint: 'Email',
                        controller: controller,
                        validator: (v) {
                          if (v!.isEmpty) {
                            return 'please enter your email';
                          }
                          return ValidationsPatterns.emailValidate.hasMatch(v)
                              ? null
                              : 'invalid email';
                        },
                      ),
                      SizedBox(
                        height: 24.h,
                      ),
                      BlocBuilder<ForgetPasswordCubit, ForgetPasswordState>(
                        builder: (context, state) {
                          if (state is ForgetPasswordStateLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return Button1(
                            size: Size(120.h, 36.h),
                            title: 'Send',
                            onPressed: () async {
                              if (_formKey.currentState!.validate()) {
                                await context
                                    .read<ForgetPasswordCubit>()
                                    .forgetPassword(
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
