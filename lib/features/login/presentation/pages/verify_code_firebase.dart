import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_scaffold.dart';
import 'package:home_cure/core/widgets/resend_timer.dart';
import 'package:home_cure/features/authentication/domain/entities/forget_password_params.dart';
import 'package:home_cure/features/authentication/domain/entities/verify_password_params.dart';
import 'package:home_cure/features/login/presentation/forget_password_firebase_bloc/forget_password_firebase_cubit.dart';
import 'package:home_cure/features/login/presentation/forget_password_firebase_bloc/forget_password_firebase_state.dart';
import 'package:home_cure/gen/assets.gen.dart';
import 'package:home_cure/l10n/l10n.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class VaricationCodeFirebasePage extends StatefulWidget {
  const VaricationCodeFirebasePage({super.key});

  @override
  State<VaricationCodeFirebasePage> createState() =>
      _VaricationCodeFirebasePageState();
}

class _VaricationCodeFirebasePageState
    extends State<VaricationCodeFirebasePage> {
  final _timerController = TimeController(seconds: 60);
  bool showResend = false;
  late CodeSentState successState;
  @override
  void initState() {
    _timerController.addListener(() {
      if (_timerController.enableResend) {
        setState(() {
          showResend = false;
        });
      }
    });
    successState =
        context.read<ForgetPasswordFirebaseCubit>().state as CodeSentState;
    super.initState();
  }

  @override
  void dispose() {
    _timerController.close();
    super.dispose();
  }

  String code = '';

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: BlocConsumer<ForgetPasswordFirebaseCubit,
          ForgetPasswordFirebaseState>(
        listener: (context, state) {
          if (state is ForgetPasswordFirebaseStateError) {
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

          if (state is ForgetPasswordFirebaseStateResetTokenLoaded) {
            context.router.push(const ReserPasswordFirebasePageRouter());
          }
        },
        builder: (context, state) {
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
                      context.l10n.resetPaswordmsg,
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
                        onCompleted: (v) {
                          print(v);

                          if (state is CodeSentState) {
                            successState = state;
                          }
                          context
                              .read<ForgetPasswordFirebaseCubit>()
                              .verifyForgetPasswordFirebaseOtp(
                                VerifyForgetPasswordParam(
                                  token: successState.token,
                                  code: v,
                                ),
                              );
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
                        if (code.isEmpty) {
                          showSimpleNotification(
                            Text(App.isAr(context)
                                ? 'من فضلك ادخل الكود'
                                : 'Please Enter Code '),
                            background: Colors.red,
                          );
                          return;
                        }
                        if (state is CodeSentState) {
                          successState = state;
                        }
                        context
                            .read<ForgetPasswordFirebaseCubit>()
                            .verifyForgetPasswordFirebaseOtp(
                              VerifyForgetPasswordParam(
                                token: successState.token,
                                code: code,
                              ),
                            );
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
                                context
                                    .read<ForgetPasswordFirebaseCubit>()
                                    .resendCode(
                                      ForgetPasswordParam(
                                        email: context
                                            .read<ForgetPasswordFirebaseCubit>()
                                            .phoneNumber!,
                                      ),
                                    );
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
