import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_scaffold.dart';
import 'package:home_cure/features/authentication/domain/entities/forget_password_params.dart';
import 'package:home_cure/features/home/presentation/pages/home.dart';
import 'package:home_cure/features/login/presentation/forget_password_firebase_bloc/forget_password_firebase_cubit.dart';
import 'package:home_cure/features/login/presentation/forget_password_firebase_bloc/forget_password_firebase_state.dart';
import 'package:home_cure/features/login/presentation/widgets/register_field.dart';
import 'package:home_cure/gen/assets.gen.dart';
import 'package:home_cure/l10n/l10n.dart';
import 'package:overlay_support/overlay_support.dart';

class ForgetPasswordFirebasePage extends StatefulWidget {
  const ForgetPasswordFirebasePage({super.key});

  @override
  State<ForgetPasswordFirebasePage> createState() =>
      _ForgetPasswordFirebasePageState();
}

class _ForgetPasswordFirebasePageState
    extends State<ForgetPasswordFirebasePage> {
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
        child: BlocListener<ForgetPasswordFirebaseCubit,
            ForgetPasswordFirebaseState>(
          listener: (context, state) {
            if (state is ForgetPasswordFirebaseStateError) {
              EasyLoading.dismiss();

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
            if (state
                is ForgetPasswordFirebaseStateForgetPasswordFirebaseTokenLoaded) {
              // context.router.push(const VaricationCodeFirebasePageRouter());
              EasyLoading.dismiss();
              EasyLoading.show();
            }
            if (state is CodeSentState) {
              EasyLoading.dismiss();

              context.router.push(const VaricationCodeFirebasePageRouter());
            }
          },
          child: SafeArea(
            child: Column(
              children: [
                const MyBackButton(),
                Padding(
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
                          Text(
                            context.l10n.forgotPassword,
                            style: textStyleWithPrimaryBold,
                          ),
                          SizedBox(
                            height: 22.h,
                          ),
                          Text(
                            context.l10n.resetPhoneNimbermsg,
                            style: textStyleWithPrimaryBold,
                            textAlign: TextAlign.center,
                          ),
                          SizedBox(
                            height: 22.h,
                          ),
                          RegisterField(
                            isPhoneNumber: true,
                            // hint: 'Phone number',
                            hint: context.l10n.phoneNumber,
                            controller: controller,
                            validator: (v) {
                              const patttern = r'(^(?:[+0]9)?[0-9]{10,12}$)';
                              final regExp = RegExp(patttern);
                              if (v!.isEmpty) {
                                return context.l10n.plEnterPhone;
                              }
                              return regExp.hasMatch(v)
                                  ? null
                                  : context.l10n.inavlidPhonenumber;
                            },
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          BlocBuilder<ForgetPasswordFirebaseCubit,
                              ForgetPasswordFirebaseState>(
                            builder: (context, state) {
                              if (state is ForgetPasswordFirebaseStateLoading) {
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
                                        .read<ForgetPasswordFirebaseCubit>()
                                        .forgetPasswordFirebase(
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
