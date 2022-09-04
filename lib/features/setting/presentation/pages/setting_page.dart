import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/widgets/common_button.dart';
import 'package:home_cure/core/widgets/common_container.dart';
import 'package:home_cure/features/appointement/presentation/pages/create_appointement.dart';
import 'package:home_cure/features/setting/presentation/widgets/change_dialouge.dart';
import 'package:home_cure/features/setting/presentation/widgets/setting_tap.dart';
import 'package:home_cure/features/user_details/presentation/widgets/profile_header.dart';
import 'package:home_cure/gen/assets.gen.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({super.key});

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  bool english = true;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          const ProfileHeader(),
          Padding(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const SizedBox(
                  height: 10,
                ),
                SettingTap(
                  lastPart: false,
                  onTap: () {
                    showDialog<void>(
                      context: context,
                      builder: (_) => const ChangeDialouge(),
                    );
                  },
                  icon: Assets.svg.personAvatar.svg(color: Colors.white),
                  title: 'Ahmed Mohamed',
                ),
                SizedBox(
                  height: 30.h,
                ),
                SettingTap(
                  lastPart: false,
                  icon: Assets.svg.noteSvg.svg(color: Colors.white),
                  title: 'Usage And Provacy Policy',
                ),
                SizedBox(
                  height: 30.h,
                ),
                CommonContainer(
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
                              color:
                                  english == true ? Colors.white : primaryColor,
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
                SizedBox(
                  height: 30.h,
                ),
                SettingTap(
                  icon: Assets.svg.phone.svg(color: Colors.white),
                  title: '01066072879',
                ),
                SizedBox(
                  height: 30.h,
                ),
                SettingTap(
                  onTap: () =>
                      context.router.push(const UserDetailsPageRouter()),
                  icon: Column(
                    children: const [
                      Expanded(
                        child: Icon(
                          Icons.health_and_safety_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ],
                  ),
                  title: 'Medical Details',
                  lastPart: false,
                  tail: const Icon(
                    Icons.arrow_forward_ios_outlined,
                    color: primaryColor,
                  ),
                ),
                SizedBox(
                  height: 30.h,
                ),
                Button1(
                  onPressed: () {
                    context.router.pushAndPopUntil(
                      const LoginPagePageRouter(),
                      predicate: (predicate) => false,
                    );
                  },
                  color: seocondColor,
                  title: 'Log out',
                  size: const Size(120, 40),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
