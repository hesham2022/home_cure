import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/features/appointement/presentation/pages/create_appointement.dart';
import 'package:home_cure/features/login/presentation/widgets/register_field.dart';
import 'package:home_cure/gen/assets.gen.dart';

class ReserPasswordPage extends StatefulWidget {
  const ReserPasswordPage({super.key});

  @override
  State<ReserPasswordPage> createState() => _ReserPasswordPageState();
}

class _ReserPasswordPageState extends State<ReserPasswordPage>
    with SingleTickerProviderStateMixin {
  late AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this);
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) => Scaffold(
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(40),
            child: Column(
              children: [
                SizedBox(
                  height: 50.h,
                ),
                Center(child: Assets.img.logo.image()),
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  'PASSWORD RESET',
                  style: textStyleWithPrimaryBold,
                  textAlign: TextAlign.center,
                ),
                SizedBox(
                  height: 20.h,
                ),
                const RegisterField(
                  isPassword: true,
                  hint: 'password',
                ),
                SizedBox(
                  height: 12.h,
                ),
                const RegisterField(
                  isPassword: true,
                  hint: 'confirm password',
                ),
                SizedBox(
                  height: 35.h,
                ),
                Button1(
                  size: Size(120.w, 30),
                  title: 'Confirm',
                  onPressed: () {
                    context.router.pushAndPopUntil(
                      const LoginPagePageRouter(),
                      predicate: (route) => false,
                    );
                  },
                )
              ],
            ),
          ),
        ),
      );
}
