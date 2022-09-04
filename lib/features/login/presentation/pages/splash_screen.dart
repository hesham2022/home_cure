import 'package:flutter/material.dart';
import 'package:home_cure/core/widgets/common_scaffold.dart';
import 'package:home_cure/gen/assets.gen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Assets.svg.logo.svg(
                height: 200,
                width: 200,
              ),
            )
          ],
        ),
      ),
    );
  }
}
