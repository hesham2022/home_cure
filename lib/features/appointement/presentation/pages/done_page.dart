import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/widgets/check_circle.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/l10n/l10n.dart';

class DonePage extends StatelessWidget {
  const DonePage({super.key});

  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.all(40),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                Container(
                  // height: 430.h,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(30),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(40),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Text(
                          context.l10n.orderPlaced,
                          style: textStyleWithPrimaryBold.copyWith(
                            fontSize: 30,
                          ),
                        ),
                        const CeckCircl(),
                        Text(
                          context.l10n.thankyou,
                          style: textStyleWithPrimarySemiBold.copyWith(
                            fontSize: 22,
                            fontWeight: FontWeight.w200,
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Button1(
                  onPressed: () => context.router.pushAndPopUntil(
                    const MainScaffold(),
                    predicate: (Route<dynamic> r) => false,
                  ),
                  title: context.l10n.done,
                  size: const Size(142, 40),
                  titelStyle: textStyleWithPrimarySemiBold.copyWith(
                    color: Colors.white,
                  ),
                )
              ],
            ),
          ],
        ),
      );
}
