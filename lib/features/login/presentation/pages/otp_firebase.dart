import 'package:auto_route/auto_route.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/utils/phone_auth.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_scaffold.dart';
import 'package:home_cure/core/widgets/resend_timer.dart';
import 'package:home_cure/di/get_it.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit_state.dart';
import 'package:home_cure/features/login/presentation/verify_otp%20_firebase/verify_otp_fiebase_cubit.dart';
import 'package:home_cure/features/login/presentation/verify_otp%20_firebase/verify_otp_firebase_state.dart';
import 'package:home_cure/gen/assets.gen.dart';
import 'package:home_cure/l10n/l10n.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:pin_code_fields/pin_code_fields.dart';

class OtpFirebasePage extends StatefulWidget {
  const OtpFirebasePage({super.key});

  @override
  State<OtpFirebasePage> createState() => _OtpFirebasePageState();
}

class _OtpFirebasePageState extends State<OtpFirebasePage> {
  final phoneAuthService = getIt<PhoneAuthService>();
  int c = 0;
  final _timerController = TimeController(seconds: 60);
  bool showResend = false;

  @override
  void initState() {
    // print('phone number is $phoneNumber');

    _timerController.addListener(() {
      if (_timerController.enableResend) {
        setState(() {
          showResend = false;
        });
      }
    });

    context.read<UserCubit>().stream.listen((event) {
      if (c == 0) {
        if (event is UserCubitStateLoaded) {
          phoneAuthService.verifyPhone(event.user.phoneNumber, context, () {
            setState(() {
              showResend = true;
              _timerController.inint();
            });
          });
          c++;
        }
      }
    });
    if (context.read<UserCubit>().state is UserCubitStateLoaded) {
      phoneAuthService.verifyPhone(
          (context.read<UserCubit>().state as UserCubitStateLoaded)
              .user
              .phoneNumber,
          context, () {
        setState(() {
          showResend = true;
          _timerController.inint();
        });
      });
    }
    // Future.delayed(Duration.zero, () {
    //   final user =
    //       (context.read<UserCubit>().state as UserCubitStateLoaded).user;
    //   phoneAuthService.verifyPhone(user.phoneNumber, context);
    // });

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
    return BlocConsumer<VerifyOtpFirebaseCubit, VerifyOtpFirebaseState>(
      listener: (context, state) {
        if (state is VerifyOtpFirebaseStateLoading) {
          EasyLoading.show();
        }
        if (state is VerifyOtpFirebaseStatedSuccess) {
          EasyLoading.dismiss();
          context.router.pushAndPopUntil(
            const MainScaffold(),
            predicate: (d) => false,
          );
        }
        if (state is VerifyOtpFirebaseStateError) {
          EasyLoading.dismiss();
          showSimpleNotification(
            Text(state.error.errorMessege),
            background: Colors.red,
          );
          // ScaffoldMessenger.of(context)
          //     .showSnackBar(SnackBar(content: Text(state.error.errorMessege)));
        }
      },
      builder: (context, state) {
        return CommonScaffold(
          body: SingleChildScrollView(
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
                      context.l10n.confirmOtpMsg,
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
                          try {
                            await FirebaseAuth.instance
                                .signInWithCredential(
                              PhoneAuthProvider.credential(
                                verificationId:
                                    phoneAuthService.verificationCode!,
                                smsCode: code,
                              ),
                            )
                                .then((value) async {
                              print(value);
                              if (value.user != null) {
                                await context
                                    .read<VerifyOtpFirebaseCubit>()
                                    .verifyOtpFirebase();
                              }
                            });
                          } catch (e) {
                            if (e is FirebaseAuthException) {
                              if (e.message ==
                                  'The sms verification code used to create the phone auth credential is invalid. Please resend the verification code sms and be sure use the verification code provided by the user.') {
                                showSimpleNotification(
                                  Text(appLn10.invalidcode),
                                  background: Colors.red,
                                );
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //   SnackBar(
                                //     content: Text(appLn10.invalidcode),
                                //   ),
                                // );
                              } else {
                                showSimpleNotification(
                                  Text(appLn10.invalidcode),
                                  background: Colors.red,
                                );
                                // ScaffoldMessenger.of(context).showSnackBar(
                                //   SnackBar(
                                //     content: Text(appLn10.invalidcode),
                                //   ),
                                // );
                              }
                            }
                            // ScaffoldMessenger.of(context).showSnackBar(
                            //   const SnackBar(content: Text('May be invalid otp')),
                            // );
                          }
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
                          return true;
                        },
                      ),
                    ),
                    SizedBox(
                      height: 50.h,
                    ),
                    Button1(
                      title: context.l10n.send,
                      onPressed: () async {
                        try {
                          await FirebaseAuth.instance
                              .signInWithCredential(
                            PhoneAuthProvider.credential(
                              verificationId:
                                  phoneAuthService.verificationCode!,
                              smsCode: code,
                            ),
                          )
                              .then((value) async {
                            if (value.user != null) {
                              await context
                                  .read<VerifyOtpFirebaseCubit>()
                                  .verifyOtpFirebase();
                            }
                          });
                        } catch (e) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text(e.toString())),
                          );
                        }
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
                            // text: "Didn't receive a message?",
                            recognizer: TapGestureRecognizer()
                              ..onTap = () {
                                if (showResend != true) {
                                  if (context.read<UserCubit>().state
                                      is UserCubitStateLoaded) {
                                    phoneAuthService.verifyPhone(
                                        (context.read<UserCubit>().state
                                                as UserCubitStateLoaded)
                                            .user
                                            .phoneNumber,
                                        context, () {
                                      setState(() {
                                        showResend = true;
                                        _timerController.inint();
                                      });
                                    });
                                  }
                                  // setState(() {
                                  //   showResend = true;
                                  //   _timerController.inint();
                                  // });
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
          ),
        );
      },
    );
  }
}
