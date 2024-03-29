import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/utils/fcm_utils.dart';
import 'package:home_cure/core/widgets/common_scaffold.dart';
import 'package:home_cure/core/widgets/main_scaffold.dart';
import 'package:home_cure/gen/assets.gen.dart';
import 'package:home_cure/l10n/l10n.dart';

class MainProviderPage extends StatefulWidget {
  const MainProviderPage({super.key});

  @override
  State<MainProviderPage> createState() => _MainProviderPageState();
}

class _MainProviderPageState extends State<MainProviderPage> {
  int currentIndex = 1;
  final icons = <HomeIcon>[
    HomeIcon(path: Assets.svg.setting.path, title: 'Setting'),
    // HomeIcon(path: Assets.svg.heart.path, title: 'About Us'),
    HomeIcon(path: Assets.svg.home.path, title: 'Home'),
    HomeIcon(path: Assets.svg.ring.path, title: 'Notification'),
    // HomeIcon(path: Assets.svg.phone.path, title: 'Contact Us'),
  ];

  @override
  Widget build(BuildContext context) {
    return CommonScaffold(
      body: Container(),
      customScaffold: AutoTabsScaffold(
        homeIndex: 1,
        routes: const [
          ProviderHomeRouter(),
          ProviderSettingRouter(),
          ProviderNotificationsRouter(),
        ],
        backgroundColor: Colors.transparent,
        bottomNavigationBuilder: (c, tabsRouter) {
          // Future.delayed(Duration.zero,(){

          // });
          // tabsRouter.setActiveIndex(1);
          return Container(
            margin: const EdgeInsets.only(
              left: 20,
              right: 20,
              bottom: 20,
            ),
            height: kBottomNavigationBarHeight,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23),
              color: Colors.white,
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: List.generate(
                icons.length,
                (index) => InkWell(
                  onTap: () => setState(() {
                    currentIndex = index;
                    if (context.read<NotificationsBudgeCubit>().state > 0 &&
                        currentIndex == 2) {
                      context.read<NotificationsBudgeCubit>().read();
                    }

                    /// ! this is ver danegrous
                    /// you can di it sempily like this
                    /// `` tabsRouter.setActiveIndex(index)
                    /// ``` ;
                    /// i did this because intial page is the
                    /// first route;
                    /// so i put HomeRoute as the first route
                    /// to be intial ;
                    ///its temporatu solution

                    switch (index) {
                      case 0:
                        tabsRouter.setActiveIndex(1);
                        break;
                      case 1:
                        tabsRouter.setActiveIndex(0);
                        break;
                      case 2:
                        tabsRouter.setActiveIndex(2);
                        break;
                    }
                  }),
                  child: currentIndex == index
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Stack(
                              children: [
                                SvgPicture.asset(
                                  height: 28,
                                  icons[index].path,
                                  color: currentIndex == index
                                      ? null
                                      : const Color(
                                          0xff1AA9A0,
                                        ),
                                ),
                              ],
                            ),
                            Text(
                              icons[index].title,
                              style: context.l10n.localeName == 'en'
                                  ? textStyleWithSecondBold()
                                      .copyWith(fontSize: 12)
                                  : textStyleWithSecondBold()
                                      .copyWith(fontSize: 10),
                            )
                          ],
                        )
                      : BlocBuilder<NotificationsBudgeCubit, int>(
                          buildWhen: (previous, current) => index == 2,
                          builder: (context, state) {
                            return Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Stack(
                                  clipBehavior: Clip.none,
                                  children: [
                                    SvgPicture.asset(
                                      height: 28,
                                      icons[index].path,
                                      color: currentIndex == index
                                          ? null
                                          : const Color(
                                              0xff1AA9A0,
                                            ),
                                    ),
                                    if (state > 0 && index == 2)
                                      Positioned(
                                        top: 0,
                                        right: -4,
                                        child: CircleAvatar(
                                          radius: 9,
                                          child: Text(
                                            state.toString(),
                                            style: textStyleWithPrimaryBold
                                                .copyWith(
                                              fontSize: 12,
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ),
                                      )
                                  ],
                                ),
                                Text(
                                  icons[index].title,
                                  style: context.l10n.localeName == 'en'
                                      ? textStyleWithSecondBold()
                                          .copyWith(fontSize: 12)
                                      : textStyleWithSecondBold()
                                          .copyWith(fontSize: 10),
                                )
                              ],
                            );
                          },
                        ),
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
