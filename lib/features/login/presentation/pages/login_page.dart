import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:formz/formz.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_scaffold.dart';
import 'package:home_cure/di/get_it.dart';
import 'package:home_cure/features/login/presentation/bloc/login_bloc.dart';
import 'package:home_cure/features/login/presentation/bloc/login_event.dart';
import 'package:home_cure/features/login/presentation/bloc/login_state.dart';
import 'package:home_cure/features/login/presentation/widgets/login_field.dart';
import 'package:home_cure/features/login/presentation/widgets/social_media_button.dart';
import 'package:home_cure/gen/assets.gen.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: BlocProvider<LoginBloc>(
        create: (context) => getIt<LoginBloc>(),
        child: SingleChildScrollView(
          child: BlocListener<LoginBloc, LoginState>(
            listener: (context, state) {
              if (state.status == FormzStatus.submissionFailure) {
                ScaffoldMessenger.of(context)
                  ..clearSnackBars()
                  ..showSnackBar(
                    SnackBar(content: Text(state.failureMessege)),
                  );
              }
            },
            child: Padding(
              padding: const EdgeInsets.all(30),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 50.h,
                  ),
                  SizedBox(
                    height: 30.h,
                  ),
                  Center(child: Assets.img.logo.image()),
                  SizedBox(
                    height: 50.h,
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return LoginField(
                        errorText: state.username.invalid
                            ? state.username.errorText(state.username.error)
                            : null,
                        onChanged: (p0) => context
                            .read<LoginBloc>()
                            .add(LoginUsernameChanged(p0)),
                      );
                    },
                  ),
                  SizedBox(
                    height: 40.h,
                  ),
                  BlocBuilder<LoginBloc, LoginState>(
                    builder: (context, state) {
                      return LoginField(
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
                        onTap: () =>
                            context.router.push(const RegisterPagePageRouter()),
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
                        return state.status == FormzStatus.submissionInProgress
                            ? const Center(child: CircularProgressIndicator())
                            : Button1(
                                onPressed: state.status == FormzStatus.invalid
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
                      onTap: () =>
                          context.router.push(const ForgotPasswordPageRouter()),
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
                      const SocialMediaButton(
                        title: 'Login with Facebook',
                        child: Icon(
                          Icons.facebook,
                          color: Colors.white,
                          size: 40,
                        ),
                      ),
                      SizedBox(
                        height: 20.h,
                      ),
                      SocialMediaButton(
                        color: Colors.white,
                        titleColor: primaryColor,
                        title: 'Login with Google',
                        child: Assets.svg.gogle.svg(
                          height: 40,
                          width: 40,
                        ),
                      ),
                    ],
                  )
                ],
              ),
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
