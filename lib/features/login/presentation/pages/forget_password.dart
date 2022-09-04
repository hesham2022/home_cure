import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_scaffold.dart';
import 'package:home_cure/features/appointement/presentation/pages/create_appointement.dart';
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

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Center(
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
                  const RegisterField(
                    hint: 'Phone number',
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  Button1(
                    size: Size(120.h, 36.h),
                    title: 'Send',
                    onPressed: () {
                      context.router.push(const VaricationCodePageRouter());
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
