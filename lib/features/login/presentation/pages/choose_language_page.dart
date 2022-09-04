import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_container.dart';
import 'package:home_cure/core/widgets/common_scaffold.dart';
import 'package:home_cure/features/appointement/presentation/pages/create_appointement.dart';
import 'package:home_cure/gen/assets.gen.dart';

class ChooseLanguagePage extends StatefulWidget {
  const ChooseLanguagePage({super.key});

  @override
  State<ChooseLanguagePage> createState() => _ChooseLanguagePageState();
}

class _ChooseLanguagePageState extends State<ChooseLanguagePage> {
  bool english = true;

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: Padding(
        padding: const EdgeInsets.all(30),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            // const SizedBox(
            //   height: 100,
            // ),
            Center(
              child: Assets.svg.logo.svg(),
            ),
            // const SizedBox(
            //   height: 100,
            // ),
            Column(
              children: [
                Row(
                  children: [
                    Text(
                      'please choose your language',
                      style: textStyleWithSecondBold(),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                Center(
                  child: CommonContainer(
                    height: 82.h,
                    child: Row(
                      children: [
                        Expanded(
                          child: InkWell(
                            onTap: () => setState(() {
                              english = false;
                            }),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: english == true
                                    ? Colors.white
                                    : primaryColor,
                                borderRadius: const BorderRadius.only(
                                  bottomLeft: Radius.circular(20),
                                  topLeft: Radius.circular(20),
                                ),
                              ),
                              child: Text(
                                'عربي',
                                style: textStyleWithPrimarySemiBold.copyWith(
                                  color: english == true
                                      ? primaryColor
                                      : Colors.white,
                                ),
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: InkWell(
                            onTap: () => setState(() {
                              english = true;
                            }),
                            child: Container(
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                color: english ? primaryColor : Colors.white,
                                borderRadius: const BorderRadius.only(
                                  bottomRight: Radius.circular(20),
                                  topRight: Radius.circular(20),
                                ),
                              ),
                              child: Text(
                                'English',
                                style: textStyleWithPrimarySemiBold.copyWith(
                                  color: english ? Colors.white : primaryColor,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Button1(
              title: 'Done',
              size: const Size(380, 40),
              onPressed: () => context.router.pushAndPopUntil(
                const LoginPagePageRouter(),
                predicate: (r) => false,
              ),
            )
          ],
        ),
      ),
    );
  }
}
