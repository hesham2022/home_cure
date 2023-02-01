import 'package:auto_route/auto_route.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:home_cure/app/app.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_scaffold.dart';
import 'package:home_cure/di/get_it.dart';
import 'package:home_cure/features/login/domain/entities/fb_response.dart';
import 'package:home_cure/features/login/presentation/bloc/login_bloc.dart';
import 'package:home_cure/features/login/presentation/bloc/login_event.dart';
import 'package:home_cure/features/login/presentation/bloc/login_state.dart';
import 'package:home_cure/features/login/presentation/widgets/register_field.dart';
import 'package:home_cure/gen/assets.gen.dart';
import 'package:home_cure/l10n/l10n.dart';
import 'package:intl/intl.dart';
import 'package:overlay_support/overlay_support.dart';
import 'package:url_launcher/url_launcher.dart';

class RegisterPage extends StatefulWidget {
  const RegisterPage({super.key});

  @override
  State<RegisterPage> createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  bool agreed = false;
  late TextEditingController dateOfBirthController;
  late SingUpBloc _bloc;
  @override
  void initState() {
    isLogin = false;

    _bloc = getIt();
    _bloc.add(const LoginGenderhanged('male'));
    super.initState();
    dateOfBirthController = TextEditingController();
  }

  final nameController = TextEditingController();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  final rePasswordController = TextEditingController();
  bool enableFields = true;

  Future<void> _handleSignIn(BuildContext context) async {
    try {
      final _googleSignIn = GoogleSignIn();
      await _googleSignIn.signOut();
      final user = await _googleSignIn.signIn();
      nameController.text = user!.displayName!;

      emailController.text = user.email;
      passwordController.text = user.id + user.email;
      rePasswordController.text = user.id + user.email;
      await Future.delayed(Duration.zero, () {
        context.read<SingUpBloc>().add(
              LoginNameChanged(user.displayName!),
            );
        context.read<SingUpBloc>().add(
              LoginUsernameChanged(user.email),
            );
        context.read<SingUpBloc>().add(
              LoginPasswordChanged(
                user.id + user.email,
              ),
            );
        context.read<SingUpBloc>().add(
              LoginConfirmPasswordChanged(
                user.id + user.email,
              ),
            );
      });
      setState(() {
        enableFields = false;
      });
    } catch (error) {
      await EasyLoading.showError('Something Go Wrong');
    }
  }

  Future<void> _handlleFb(BuildContext context) async {
    try {
      final fb = FacebookAuth.instance;
      await fb.logOut();
      await fb.login();

      final userData = await FacebookAuth.instance.getUserData();
      final user = FbResponse.fromJson(userData);
      nameController.text = user.name;

      emailController.text = user.email;
      passwordController.text = user.id + user.email;
      rePasswordController.text = user.id + user.email;
      await Future.delayed(Duration.zero, () {
        context.read<SingUpBloc>().add(
              LoginNameChanged(user.name),
            );
        context.read<SingUpBloc>().add(
              LoginUsernameChanged(user.email),
            );
        context.read<SingUpBloc>().add(
              LoginPasswordChanged(
                user.id + user.email,
              ),
            );
        context.read<SingUpBloc>().add(
              LoginConfirmPasswordChanged(
                user.id + user.email,
              ),
            );
      });
      setState(() {
        enableFields = false;
      });
    } catch (error) {
      await EasyLoading.showError('Something Go Wrong');
    }
  }

  void resret(BuildContext context) {
    setState(() {
      enableFields = true;
    });
    nameController.text = '';
    emailController.text = '';
    passwordController.text = '';
    rePasswordController.text = '';
    context.read<SingUpBloc>().add(
          ResetFields(),
        );
  }

  bool agrreError = false;
  @override
  Widget build(BuildContext context) {
    final tr = context.l10n;
    return BlocProvider<SingUpBloc>(
      create: (context) => _bloc,
      child: CommonScaffold(
        body: Padding(
          padding: const EdgeInsets.all(30),
          child: SingleChildScrollView(
            child: BlocListener<SingUpBloc, LoginState>(
              listener: (context, state) {
                // if (state.status.isSubmissionSuccess) {
                //   context.read<VerifyOtpCubit>().sendOtp();
                // }
                if (state.status.isSubmissionFailure) {
                  showSimpleNotification(
                    Text(state.failureMessege),
                    background: Colors.red,
                  );
                  // EasyLoading.showError(state.failureMessege);
                  // ScaffoldMessenger.of(context)
                  //   ..hideCurrentSnackBar()
                  //   ..showSnackBar(
                  //     SnackBar(content: Text(state.failureMessege)),
                  //   );
                }
              },
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 50,
                  ),

                  Center(child: Assets.img.logoPng.image()),
                  const SizedBox(
                    height: 50,
                  ),
                  BlocBuilder<SingUpBloc, LoginState>(
                    builder: (context, state) {
                      return RegisterField(
                        hint: context.l10n.name,
                        enabled: enableFields,
                        controller: nameController,
                        errorText: state.name.invalid
                            ? state.name.errorText(state.name.error)
                            : null,
                        onChanged: (p0) => context
                            .read<SingUpBloc>()
                            .add(LoginNameChanged(p0)),
                      );
                    },
                  ),
                  // const RegisterField(),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<SingUpBloc, LoginState>(
                    builder: (context, state) {
                      return RegisterField(
                        enabled: enableFields,
                        hint: context.l10n.email,
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        errorText: state.username.invalid
                            ? state.username.errorText(state.username.error)
                            : null,
                        onChanged: (p0) => context
                            .read<SingUpBloc>()
                            .add(LoginUsernameChanged(p0)),
                      );
                    },
                  ),

                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<SingUpBloc, LoginState>(
                    builder: (context, state) {
                      return RegisterField(
                        isPhoneNumber: true,
                        hint: tr.mobileNumber,
                        keyboardType: TextInputType.phone,
                        errorText: state.phoneNumber.invalid
                            ? state.phoneNumber
                                .errorText(state.phoneNumber.error)
                            : null,
                        onChanged: (p0) => context
                            .read<SingUpBloc>()
                            .add(LoginPhoneNumberChanged(p0)),
                      );
                    },
                  ),
                  if (enableFields)
                    Column(
                      children: [
                        const SizedBox(
                          height: 20,
                        ),
                        BlocBuilder<SingUpBloc, LoginState>(
                          builder: (context, state) {
                            return RegisterField(
                              enabled: enableFields,
                              isPassword: true,
                              controller: passwordController,
                              hint: tr.password,
                              icon: Icon(
                                Icons.lock_outlined,
                                color: primaryColor.withOpacity(.5),
                              ),
                              errorText: state.password.invalid
                                  ? state.password
                                      .errorText(state.password.error)
                                  : null,
                              onChanged: (p0) => context
                                  .read<SingUpBloc>()
                                  .add(LoginPasswordChanged(p0)),
                            );
                          },
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Center(
                          child: Text(
                            tr.passwordShouldContain1Letter1Chatacter,
                            style: TextStyle(
                              color: const Color(0xffD74B7F),
                              fontSize: 16.sp,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        BlocBuilder<SingUpBloc, LoginState>(
                          builder: (context, state) {
                            return RegisterField(
                              enabled: enableFields,
                              controller: rePasswordController,
                              isPassword: true,
                              hint: tr.rePassword,
                              icon: Icon(
                                Icons.lock_outlined,
                                color: primaryColor.withOpacity(.5),
                              ),
                              errorText: state.confirmPassword.invalid
                                  ? state.confirmPassword
                                      .errorText(state.confirmPassword.error)
                                  : null,
                              onChanged: (p0) => context
                                  .read<SingUpBloc>()
                                  .add(LoginConfirmPasswordChanged(p0)),
                            );
                          },
                        ),
                      ],
                    ),
                  const SizedBox(
                    height: 20,
                  ),
                  BlocBuilder<SingUpBloc, LoginState>(
                    builder: (context, state) {
                      return RegisterField(
                        hint: tr.dateOfBirth,
                        errorText: state.birth.invalid
                            ? state.birth.errorText(state.birth.error)
                            : null,
                        readOnly: true,
                        controller: dateOfBirthController,
                        onTap: () async {
                          final pickedDate = await showDatePicker(
                            context: context, initialDate: DateTime.now(),
                            firstDate: DateTime(
                              1900,
                            ), //DateTime.now() - not to allow to choose before today.
                            lastDate: DateTime.now(),
                          );

                          if (pickedDate != null) {
                            final formattedDate =
                                DateFormat('yyyy-MM-dd').format(pickedDate);

                            setState(() {
                              dateOfBirthController.text =
                                  formattedDate; //set output date to TextField value.
                            });
                            Future.delayed(Duration.zero, () {
                              context
                                  .read<SingUpBloc>()
                                  .add(LoginBirthChanged(pickedDate));
                            });

                            // Future.delayed(Duration.zero, () {});
                          } else {}
                        },
                      );
                    },
                  ),

                  Builder(
                    builder: (context) {
                      return GenderWidget(
                        onChange: (value) {
                          context
                              .read<SingUpBloc>()
                              .add(LoginGenderhanged(value));
                        },
                      );
                    },
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(
                      vertical: 10,
                      horizontal: 20,
                    ),
                    child: Column(
                      children: [
                        Row(
                          children: [
                            Checkbox(
                              value: agreed,
                              onChanged: (v) {
                                setState(() {
                                  agreed = v!;
                                });
                              },
                            ),
                            InkWell(
                              onTap: () {
                                launchUrl(
                                  Uri.parse(
                                    'https://homecure.vercel.app/privacy',
                                  ),
                                );
                              },
                              child: App.isAr(context)
                                  ? RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: ' اوافق علي',
                                            style: agrreError
                                                ? TextStyle(
                                                    fontSize: 15.sp,
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.w700,
                                                  )
                                                : TextStyle(
                                                    fontSize: 15.sp,
                                                    color:
                                                        const Color(0xffD74B7F),
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                          ),
                                          TextSpan(
                                            text:
                                                ' سياسه الاستخدام والخصوصيه  ',
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                launchUrl(
                                                  Uri.parse(
                                                    'https://homecure.vercel.app/privacy',
                                                  ),
                                                );
                                              },
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              color: primaryColor,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          )
                                        ],
                                      ),
                                    )
                                  : RichText(
                                      text: TextSpan(
                                        children: [
                                          TextSpan(
                                            text: 'I agree to ',
                                            style: agrreError
                                                ? TextStyle(
                                                    fontSize: 15.sp,
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.w700,
                                                  )
                                                : TextStyle(
                                                    fontSize: 15.sp,
                                                    color:
                                                        const Color(0xffD74B7F),
                                                    fontWeight: FontWeight.w400,
                                                  ),
                                          ),
                                          TextSpan(
                                            text: 'terms and conditions',
                                            recognizer: TapGestureRecognizer()
                                              ..onTap = () {
                                                launchUrl(
                                                  Uri.parse(
                                                    'https://homecure.vercel.app/privacy',
                                                  ),
                                                );
                                              },
                                            style: TextStyle(
                                              fontSize: 15.sp,
                                              color: primaryColor,
                                              fontWeight: FontWeight.w700,
                                            ),
                                          )
                                        ],
                                      ),
                                    ),
                              // Text(
                              //   tr.iAgreeToTermsCondtions,
                              //   style: agrreError
                              //       ? TextStyle(
                              //           fontSize: 15.sp,
                              //           color: Colors.red,
                              //           fontWeight: FontWeight.w700,
                              //         )
                              //       : TextStyle(
                              //           fontSize: 15.sp,
                              //           color: const Color(0xffD74B7F),
                              //           fontWeight: FontWeight.w400,
                              //         ),
                              // ),
                            ),
                            // Text(
                            //   tr.iAgreeToTermsCondtions2,
                            //   style: agrreError
                            //       ? TextStyle(
                            //           fontSize: 15.sp,
                            //           color: Colors.red,
                            //           fontWeight: FontWeight.w700,
                            //         )
                            //       : TextStyle(
                            //           fontSize: 15.sp,
                            //           color: const Color(0xffD74B7F),
                            //           fontWeight: FontWeight.w400,
                            //         ),
                            // )
                          ],
                        ),

                        // if(agrreError)Text('you nee')
                      ],
                    ),
                  ),
                  Center(
                    child: BlocBuilder<SingUpBloc, LoginState>(
                      buildWhen: (previous, current) =>
                          previous.status != current.status,
                      builder: (context, state) {
                        return state.status == FormzStatus.submissionInProgress
                            ? const Center(child: CircularProgressIndicator())
                            : Button1(
                                onPressed: () {
                                  context.read<SingUpBloc>().add(
                                        Validate(),
                                      );
                                  if (agreed == false) {
                                    setState(() {
                                      agrreError = true;
                                      context.read<SingUpBloc>().add(
                                            Validate(),
                                          );
                                    });
                                    if (state.status == FormzStatus.invalid) {
                                      context.read<SingUpBloc>().add(
                                            Validate(),
                                          );

                                      return;
                                    }
                                    return;
                                  } else {
                                    setState(() {
                                      agrreError = false;
                                    });
                                  }

                                  // ? null
                                  // :
                                  context.read<SingUpBloc>().add(
                                        const LoginRegisterSubmitted(),
                                      );
                                },
                                titelStyle: TextStyle(
                                  fontSize: 19.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w400,
                                ),
                                size: const Size(200, 50),
                                title: tr.createNewAccount,
                              );
                      },
                    ),
                  ),

                  const SizedBox(
                    height: 15,
                  ),
                  Center(
                    child: InkWell(
                      onTap: context.router.pop,
                      child: Text(
                        tr.youHaveAccount,
                        style: TextStyle(
                          fontSize: 19.sp,
                          color: primaryColor,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  // if (enableFields)
                  //   Column(
                  //     children: [
                  //       Builder(
                  //         builder: (context) {
                  //           return InkWell(
                  //             onTap: () => _handlleFb(context),
                  //             child: SocialMediaButton(
                  //               title: tr.loginwithfacebookaccount,
                  //               child: const Icon(
                  //                 Icons.facebook,
                  //                 color: Colors.white,
                  //                 size: 40,
                  //               ),
                  //             ),
                  //           );
                  //         },
                  //       ),
                  //       SizedBox(
                  //         height: 20.h,
                  //       ),
                  //       Builder(
                  //         builder: (context) {
                  //           return InkWell(
                  //             onTap: () => _handleSignIn(context),
                  //             child: SocialMediaButton(
                  //               color: Colors.white,
                  //               titleColor: primaryColor,
                  //               title: tr.loginwithgoogleaccount,
                  //               child: Assets.svg.gogle.svg(
                  //                 height: 40,
                  //                 width: 40,
                  //               ),
                  //             ),
                  //           );
                  //         },
                  //       ),
                  //     ],
                  //   )
                  // else
                  //   Builder(
                  //     builder: (context) {
                  //       return InkWell(
                  //         onTap: () {
                  //           resret(context);
                  //         },
                  //         child: SocialMediaButton(
                  //           color: Colors.white,
                  //           titleColor: primaryColor,
                  //           title: tr.signWithPasswordAndEmal,
                  //           child: const SizedBox(
                  //             height: 40,
                  //           ),
                  //         ),
                  //       );
                  //     },
                  //   )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

class GenderWidget extends StatefulWidget {
  const GenderWidget({super.key, required this.onChange});
  final Function(String value) onChange;
  @override
  State<GenderWidget> createState() => _GenderWidgetState();
}

enum GenderEnum { male, femal }

class _GenderWidgetState extends State<GenderWidget> {
  GenderEnum gender = GenderEnum.male;
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(20),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Text(context.l10n.male, style: textStyleWithPrimarySemiBold),
                Transform.scale(
                  scale: 1.5,
                  child: Checkbox(
                    side: const BorderSide(
                      color: Colors.white,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    value: gender == GenderEnum.male,
                    onChanged: (v) {
                      if (v! == true) {
                        setState(() {
                          gender = GenderEnum.male;
                        });
                        widget.onChange('male');
                      }
                    },
                  ),
                )
              ],
            ),
            Row(
              children: [
                Text(context.l10n.female, style: textStyleWithPrimarySemiBold),
                Transform.scale(
                  scale: 1.5,
                  child: Checkbox(
                    side: const BorderSide(
                      color: Colors.white,
                    ),
                    shape: const RoundedRectangleBorder(
                      borderRadius: BorderRadius.all(
                        Radius.circular(50),
                      ),
                    ),
                    value: gender == GenderEnum.femal,
                    onChanged: (v) {
                      if (v! == true) {
                        setState(() {
                          gender = GenderEnum.femal;
                        });
                        widget.onChange('female');
                      }
                    },
                  ),
                )
              ],
            )
          ],
        ),
      );
}
