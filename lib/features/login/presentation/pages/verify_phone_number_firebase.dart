import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_scaffold.dart';
import 'package:home_cure/core/widgets/resend_timer.dart';
import 'package:home_cure/features/authentication/domain/entities/reset_password_params.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit_state.dart';
import 'package:home_cure/features/login/presentation/change_phone_number_fiebase_cubit/change_phone_number_firebase_cubit.dart';
import 'package:home_cure/features/login/presentation/change_phone_number_fiebase_cubit/change_phone_number_firebase_state.dart';
import 'package:home_cure/gen/assets.gen.dart';
import 'package:home_cure/l10n/l10n.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VerifyChangePhoneNumberFirebasePage extends StatefulWidget {
  const VerifyChangePhoneNumberFirebasePage({super.key});

  @override
  State<VerifyChangePhoneNumberFirebasePage> createState() =>
      _VerifyChangePhoneNumberFirebasePageState();
}

class _VerifyChangePhoneNumberFirebasePageState
    extends State<VerifyChangePhoneNumberFirebasePage> {
  final _timerController = TimeController(seconds: 60);
  bool showResend = false;
  late ChangePhoneNumberFirebaseStateChangePhoneNumberFirebaseTokenLoaded
      successState;
  late String phoneNumberFirebase;
  @override
  void initState() {
    successState = context.read<ChangePhoneNumberFirebaseCubit>().state
        as ChangePhoneNumberFirebaseStateChangePhoneNumberFirebaseTokenLoaded;
    phoneNumberFirebase = successState.phoneNumberFirebase;
    print('phone number is $phoneNumberFirebase');

    // _timerController.addListener(() {
    //   if (_timerController.enableResend) {
    //     setState(() {
    //       showResend = false;
    //     });
    //   }
    // });

    super.initState();
  }

  // @override
  // void dispose() {
  //   _timerController.close();
  //   super.dispose();
  // }

  String code = '';
  late ScaffoldMessengerState messenger;
  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: BlocConsumer<ChangePhoneNumberFirebaseCubit,
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
            EasyLoading.dismiss();
          }

          if (state is ChangePhoneNumberFirebaseStateLoading) {
            // context.router.push(const ReserPasswordPageRouter());
            EasyLoading.show();
          }
          if (state is ChangePhoneNumberFirebaseStateResetTokenLoaded) {
            // context.router.push(const ReserPasswordPageRouter());
            context.read<ChangePhoneNumberFirebaseCubit>().resetPassword(
                  ResetPasswordParams(
                    password: phoneNumberFirebase,
                    token: state.token,
                  ),
                );
            EasyLoading.dismiss();
          }

          if (state is ChangePhoneNumberFirebaseStateResetPasswordSuccess) {
            EasyLoading.dismiss();
            context.router.pushAndPopUntil(
              const MainScaffold(),
              predicate: (v) => false,
            );

            context.read<UserCubit>().getUserFuc(
                  (context.read<UserCubit>().state as UserCubitStateLoaded)
                      .user
                      .id,
                );
            EasyLoading.dismiss();
          }
        },
        builder: (context2, state) {
          return SingleChildScrollView(
            child: Center(
              child: Padding(
                padding: EdgeInsets.all(40.sp),
                child: Column(
                  children: [
                    const SizedBox(height: 50),
                    Center(child: Assets.img.logo.image()),
                    const SizedBox(height: 50),
                    // otp
                    Text(
                      context.l10n.confirmPhonenumberOtp,
                      textAlign: TextAlign.center,
                      style: textStyleWithPrimaryBold.copyWith(
                        fontSize: 16.sp,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    Directionality(
                      textDirection: TextDirection.ltr,
                      child: PinCodeTextField(
                        appContext: context,

                        length: 6,
                        animationType: AnimationType.fade,
                        pinTheme: PinTheme(
                          shape: PinCodeFieldShape.box,
                          borderRadius: BorderRadius.circular(8),
                          fieldHeight: 60.h,
                          fieldWidth: 60.h,
                          activeColor: const Color(0xffE5E5E5),
                          inactiveColor: const Color(0xffE5E5E5),
                          activeFillColor: const Color(0xffF5F5F5),
                          selectedColor: const Color(0xffE5E5E5),
                          selectedFillColor: Colors.white,
                          inactiveFillColor: Colors.white,
                        ),
                        animationDuration: const Duration(milliseconds: 300),
                        // backgroundColor: Colors.blue.shade50,
                        enableActiveFill: true,
                        // errorAnimationController: errorController,
                        //    controller: textEditingController,
                        onCompleted: (v) async {
                          print(v);

                          if (state
                              is ChangePhoneNumberFirebaseStateChangePhoneNumberFirebaseTokenLoaded) {
                            successState = state;
                          }
                          try {
                            await FirebaseAuth.instance
                                .signInWithCredential(
                              PhoneAuthProvider.credential(
                                verificationId: context
                                    .read<ChangePhoneNumberFirebaseCubit>()
                                    .verificationCode!,
                                smsCode: code,
                              ),
                            )
                                .then((value) async {
                              if (value.user != null) {
                                await context
                                    .read<ChangePhoneNumberFirebaseCubit>()
                                    .resetPassword(
                                      ResetPasswordParams(
                                        password: phoneNumberFirebase,
                                        token: 'state.token',
                                      ),
                                    );
                              }
                            });
                          } catch (e) {
                            await Future<void>.delayed(Duration.zero, () {
                              showSimpleNotification(
                                Text(appLn10.invalidcode),
                                background: Colors.red,
                              );
                              // scaffoldMessengerKey.currentState!.showSnackBar(
                              //   SnackBar(
                              //     content: Text(appLn10.invalidcode),
                              //   ),
                              // );
                            });
                          }
                          // context
                          //     .read<ChangePhoneNumberFirebaseCubit>()
                          //     .resetPassword(
                          //       ResetPasswordParams(
                          //         password: phoneNumberFirebase,
                          //         token: 'state.token',
                          //       ),
                          //     );
                          // context
                          //     .read<ChangePhoneNumberFirebaseCubit>()
                          //     .VerifyChangePhoneNumberFirebaseOtp(
                          //       VerifyForgetPasswordParam(
                          //         token: successState.token,
                          //         code: v,
                          //       ),
                          //     );
                          // if (v == '1234') {
                          //   context.router.push(const ReserPasswordPageRouter());
                          // }
                        },
                        onChanged: (value) {
                          code = value;

                          // print(value);
                          // setState(() {
                          //   currentText = value;
                          // });
                        },
                        //1234
                        beforeTextPaste: (text) {
                          print('Allowing to paste $text');
                          //if you return true then it will show the paste confirmation dialog. Otherwise if false, then nothing will happen.
                          //but you can show anything you want here, like your pop up saying wrong paste format or etc
                          return true;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Button1(
                      title: context.l10n.send,
                      onPressed: () {
                        if (state
                            is ChangePhoneNumberFirebaseStateChangePhoneNumberFirebaseTokenLoaded) {
                          successState = state;
                        }
                        // context
                        //     .read<ChangePhoneNumberFirebaseCubit>()
                        //     .verifyChangePhoneNumberFirebaseOtp(
                        //       VerifyForgetPasswordParam(
                        //         token: successState.token,
                        //         code: code,
                        //       ),
                        //     );
                        // context.router.push(const ReserPasswordPageRouter());
                      },
                      size: Size(120.w, 36.h),
                    ),
                    SizedBox(
                      height: 15.h,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        RichText(
                          text: TextSpan(
                            text: context.l10n.dontRecieveMessege,
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                if (showResend != true) {
                                  setState(() {
                                    showResend = true;
                                    _timerController.inint();
                                  });
                                }
                              },
                            style: textStyleWithPrimaryBold,
                          ),
                        ),
                        if (showResend)
                          SizedBox(
                            width: 5.h,
                          ),
                        if (showResend)
                          ResendTime(
                            controller: _timerController,
                          )
                      ],
                    )
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
