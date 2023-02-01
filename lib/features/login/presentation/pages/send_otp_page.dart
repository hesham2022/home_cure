import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_scaffold.dart';
import 'package:home_cure/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:home_cure/features/login/presentation/verify_otp/verify_otp_cubit.dart';
import 'package:home_cure/features/login/presentation/verify_otp/verify_otp_state.dart';
import 'package:home_cure/l10n/l10n.dart';

class SendOtpPage extends StatefulWidget {
  const SendOtpPage({super.key});

  @override
  State<SendOtpPage> createState() => _SendOtpPageState();
}

class _SendOtpPageState extends State<SendOtpPage> {
  @override
  void initState() {
    context.read<VerifyOtpCubit>().sendOtp();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return BlocListener<VerifyOtpCubit, VerifyOtpState>(
      listener: (context, state) {
        if (state is VerifyOtpStateTokenLoaded) {
          context.router.push(const VaricationOtpPageRoute());
        }
      },
      child: BlocBuilder<VerifyOtpCubit, VerifyOtpState>(
        builder: (context, state) {
          if (state is VerifyOtpStateLoading) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return CommonScaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Center(
                  child: Column(
                    children: [
                      Text(
                        'You Phone Number Not Verified',
                        style: textStyleWithPrimaryBold.copyWith(
                          color: Colors.black,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      BlocBuilder<VerifyOtpCubit, VerifyOtpState>(
                        builder: (context, state) {
                          if (state is VerifyOtpStateLoading) {
                            return const Center(
                              child: CircularProgressIndicator(),
                            );
                          }
                          return Button1(
                            onPressed: () {
                              context.read<VerifyOtpCubit>().sendOtp();
                            },
                            title: '${context.l10n.sendOTP} ',
                          );
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      InkWell(
                        onTap: () {
                          context
                              .read<AuthenticationBloc>()
                              .add(AuthenticationLogoutRequested());
                        },
                        child: Text(
                          'OR Log Out',
                          style: textStyleWithPrimarySemiBold,
                        ),
                      ),
                      // Button1(
                      //   onPressed: () {
                      //     context
                      //         .read<AuthenticationBloc>()
                      //         .add(AuthenticationLogoutRequested());
                      //     // context.router.pushAndPopUntil(
                      //     //   const LoginPagePageRouter(),
                      //     //   predicate: (predicate) => false,
                      //     // );
                      //   },
                      //   color: seocondColor,
                      //   title: 'Log out',
                      //   size: const Size(120, 40),
                      // ),
                    ],
                  ),
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
