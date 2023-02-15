import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_scaffold.dart';
import 'package:home_cure/features/authentication/domain/entities/forget_password_params.dart';
import 'package:home_cure/features/home/presentation/pages/home.dart';
import 'package:home_cure/features/login/presentation/change_phone_number_fiebase_cubit/change_phone_number_firebase_cubit.dart';
import 'package:home_cure/features/login/presentation/change_phone_number_fiebase_cubit/change_phone_number_firebase_state.dart';
import 'package:home_cure/features/login/presentation/widgets/register_field.dart';
import 'package:home_cure/gen/assets.gen.dart';
import 'package:home_cure/l10n/l10n.dart';
import 'package:overlay_support/overlay_support.dart';

class ChangePhoneNumberFirebasePage extends StatefulWidget {
  const ChangePhoneNumberFirebasePage({super.key});

  @override
  State<ChangePhoneNumberFirebasePage> createState() =>
      _ChangePhoneNumberFirebasePageState();
}

class _ChangePhoneNumberFirebasePageState
    extends State<ChangePhoneNumberFirebasePage> {
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
        child: BlocListener<ChangePhoneNumberFirebaseCubit,
            ChangePhoneNumberFirebaseState>(
          listener: (context, state) {
            if (state is ChangePhoneNumberFirebaseStateError) {
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
                is ChangePhoneNumberFirebaseStateChangePhoneNumberFirebaseTokenLoaded) {
              context.router
                  .push(const VerifyChangePhoneNumberFirebasePageRoute());
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
                          // const SizedBox(
                          //   height: 50,
                          // ),
                          // Text('Forget Password?', style: textStyleWithPrimaryBold),
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
                                  : context.l10n.invalidPhoneNumber;
                            },
                          ),
                          SizedBox(
                            height: 24.h,
                          ),
                          BlocBuilder<ChangePhoneNumberFirebaseCubit,
                              ChangePhoneNumberFirebaseState>(
                            builder: (context, state) {
                              if (state
                                  is ChangePhoneNumberFirebaseStateLoading) {
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
                                        .read<ChangePhoneNumberFirebaseCubit>()
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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
