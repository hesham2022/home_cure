import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_facebook_auth/flutter_facebook_auth.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_scaffold.dart';
import 'package:home_cure/di/get_it.dart';
import 'package:home_cure/features/login/domain/entities/fb_response.dart';
import 'package:home_cure/features/login/presentation/bloc/login_bloc.dart';
import 'package:home_cure/features/login/presentation/bloc/login_event.dart';
import 'package:home_cure/features/login/presentation/bloc/login_state.dart';
import 'package:home_cure/features/login/presentation/widgets/login_field.dart';
import 'package:home_cure/features/login/presentation/widgets/social_media_button.dart';
import 'package:home_cure/gen/assets.gen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool isSocialLoign = false;
  final emilController = TextEditingController();
  final phoneController = TextEditingController();

  final passwordController = TextEditingController();
  void resret(BuildContext context) {
    isSocialLoign = false;
    emilController.text = '';
    passwordController.text = '';
    context.read<LoginBloc>().add(
          ResetFields(),
        );
    EasyLoading.showError('Login Failed');
  }

  Future<void> _handleSignIn(BuildContext context) async {
    isSocialLoign = true;
    try {
      final _googleSignIn = GoogleSignIn();
      await _googleSignIn.signOut();
      final user = await _googleSignIn.signIn();

      emilController.text = user!.email;
      passwordController.text = user.id + user.email;
      await Future.delayed(Duration.zero, () {
        context.read<LoginBloc>().add(
              LoginUsernameChanged(user.email),
            );
        context.read<LoginBloc>().add(
              LoginPasswordChanged(
                user.id + user.email,
              ),
            );
        context.read<LoginBloc>().add(
              const LoginSubmitted(),
            );
      });
    } catch (e) {
      resret(context);
    }
  }

  Future<void> _handlleFb(BuildContext context) async {
    isSocialLoign = true;

    try {
      final fb = FacebookAuth.instance;
      await fb.logOut();
      await fb.login();

      final userData = await FacebookAuth.instance.getUserData();
      final user = FbResponse.fromJson(userData);

      emilController.text = user.email;
      passwordController.text = user.id + user.email;
      await Future.delayed(Duration.zero, () {
        context.read<LoginBloc>().add(
              LoginUsernameChanged(user.email),
            );
        context.read<LoginBloc>().add(
              LoginPasswordChanged(
                user.id + user.email,
              ),
            );
        context.read<LoginBloc>().add(
              const LoginSubmitted(),
            );
      });
    } catch (error) {
      resret(context);
    }
  }

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: BlocProvider<LoginBloc>(
        create: (context) => getIt<LoginBloc>(),
        child: SingleChildScrollView(
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) async {
              // if (state.loginWithEmail) {
              //   context
              //       .read<LoginBloc>()
              //       .add(LoginUsernameChanged(emilController.text));
              // } else {
              //   context
              //       .read<LoginBloc>()
              //       .add(LoginPhoneNumberChanged(phoneController.text));
              // }
              if (state.status == FormzStatus.submissionFailure) {
                // await EasyLoading.showError(state.failureMessege);
                if (isSocialLoign) {
                  resret(context);
                } else {
                  await EasyLoading.showError(state.failureMessege);
                  // ScaffoldMessenger.of(context)
                  //   ..clearSnackBars()
                  //   ..showSnackBar(
                  //     SnackBar(content: Text(state.failureMessege)),
                  //   );
                }
              }
            },
            child: BlocBuilder<LoginBloc, LoginState>(
              builder: (context, state) {
                return Padding(
                  padding: const EdgeInsets.all(30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 50.h,
                      ),
                      Center(child: Assets.img.logo.image()),
                      SizedBox(
                        height: 30.h,
                      ),
                      // if (state.loginWithEmail)
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return LoginField(
                            hint: 'E-mail Or Phone Number',
                            controller: emilController,
                            errorText: state.username.invalid
                                ? state.username.errorText(state.username.error)
                                : null,
                            onChanged: (p0) => context
                                .read<LoginBloc>()
                                .add(LoginEmailOrPhoneChanged(p0)),
                          );
                        },
                      ),
                      // else
                      //   BlocBuilder<LoginBloc, LoginState>(
                      //     builder: (context, state) {
                      //       return LoginField(
                      //         hint: 'Phone Number',
                      //         controller: phoneController,
                      //         errorText: state.phoneNumber.invalid
                      //             ? state.phoneNumber
                      //                 .errorText(state.phoneNumber.error)
                      //             : null,
                      //         onChanged: (p0) => context
                      //             .read<LoginBloc>()
                      //             .add(LoginPhoneNumberChanged(p0)),
                      //       );
                      //     },
                      //   ),
                      // SizedBox(
                      //   height: 10.h,
                      // ),
                      // if (state.loginWithEmail)
                      //   InkWell(
                      //     onTap: () => context
                      //         .read<LoginBloc>()
                      //         .add(const LoginWithEmail(loginWithEmail: false)),
                      //     child: Text(
                      //       'Login With Phone Number',
                      //       style: textStyleWithPrimarySemiBold.copyWith(
                      //         fontSize: 14,
                      //       ),
                      //     ),
                      //   )
                      // else
                      //   InkWell(
                      //     onTap: () => context
                      //         .read<LoginBloc>()
                      //         .add(const LoginWithEmail(loginWithEmail: true)),
                      //     child: Text(
                      //       'Login With Email',
                      //       style: textStyleWithPrimarySemiBold.copyWith(
                      //         fontSize: 14,
                      //       ),
                      //     ),
                      //   ),
                      SizedBox(
                        height: 30.h,
                      ),
                      BlocBuilder<LoginBloc, LoginState>(
                        builder: (context, state) {
                          return LoginField(
                            controller: passwordController,
                            errorText: state.password.invalid
                                ? state.password.errorText(state.password.error)
                                : null,
                            onChanged: (p0) => context
                                .read<LoginBloc>()
                                .add(LoginPasswordChanged(p0)),
                            isPassword: true,
                            hint: 'Password',
                            icon: Icon(
                              Icons.lock_outlined,
                              color: primaryColor.withOpacity(.5),
                            ),
                          );
                        },
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          InkWell(
                            onTap: () => context.router
                                .push(const RegisterPagePageRouter()),
                            child: Text(
                              'you don’t have an account',
                              style: TextStyle(
                                fontSize: 16.sp,
                                color: const Color(0xffD74B7F),
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 60.h,
                      ),
                      Center(
                        child: BlocConsumer<LoginBloc, LoginState>(
                          listener: (context, state) {},
                          buildWhen: (previous, current) =>
                              previous.status != current.status,
                          builder: (context, state) {
                            return state.status ==
                                    FormzStatus.submissionInProgress
                                ? const Center(
                                    child: CircularProgressIndicator(),
                                  )
                                : Button1(
                                    onPressed: state.status ==
                                            FormzStatus.invalid
                                        ? null
                                        : () {
                                            context
                                                .read<LoginBloc>()
                                                .add(const LoginSubmitted());
                                          },
                                    titelStyle: TextStyle(
                                      fontSize: 23.sp,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w400,
                                    ),
                                    size: const Size(170, 50),
                                    title: 'Login',
                                  );
                          },
                        ),
                      ),
                      SizedBox(
                        height: 15.h,
                      ),
                      Center(
                        child: InkWell(
                          onTap: () => context.router
                              .push(const ForgotPasswordPageRouter()),
                          child: Text(
                            'forget password',
                            style: TextStyle(
                              fontSize: 23.sp,
                              color: const Color(0xffD74B7F),
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 40.h,
                      ),
                      Column(
                        children: [
                          Builder(
                            builder: (context) {
                              return InkWell(
                                onTap: () => _handlleFb(context),
                                child: const SocialMediaButton(
                                  title: 'Login with Facebook',
                                  child: Icon(
                                    Icons.facebook,
                                    color: Colors.white,
                                    size: 40,
                                  ),
                                ),
                              );
                            },
                          ),
                          SizedBox(
                            height: 20.h,
                          ),
                          Builder(
                            builder: (context) {
                              return InkWell(
                                onTap: () => _handleSignIn(context),
                                child: SocialMediaButton(
                                  color: Colors.white,
                                  titleColor: primaryColor,
                                  title: 'Login with Google',
                                  child: Assets.svg.gogle.svg(
                                    height: 40,
                                    width: 40,
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      )
                    ],
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}

String getName(String name) =>
    name.startsWith('name:') ? name : throw Exception('invalid enail');
// 7alal
