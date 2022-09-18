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
            height: kBottomNavigationBarHeight - 10,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(23),
              color: Colors.white,
            ),
            child: Stack(
              clipBehavior: Clip.none,
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: 10,
                  left: 0,
                  right: 0,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: List.generate(
                      icons.length,
                      (index) => InkWell(
                        onTap: () => setState(() {
                          currentIndex = index;
                          if (context.read<NotificationsBudgeCubit>().state) {
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
                                children: [
                                  Transform.scale(
                                    scale: .85,
                                    child: SvgPicture.asset(
                                      icons[index].path,
                                      height: currentIndex == index
                                          ? kBottomNavigationBarHeight * 1
                                          : null,
                                      color: currentIndex == index
                                          ? null
                                          : const Color(0xff1AA9A0),
                                    ),
                                  ),
                                  Text(
                                    icons[index].title,
                                    style: textStyleWithSecondBold(),
                                  )
                                ],
                              )
                            : BlocBuilder<NotificationsBudgeCubit, bool>(
                                buildWhen: (previous, current) => index == 2,
                                builder: (context, state) {
                                  return Stack(
                                    clipBehavior: Clip.none,
                                    children: [
                                      SvgPicture.asset(
                                        icons[index].path,
                                        height: currentIndex == index
                                            ? kBottomNavigationBarHeight * 1.2
                                            : null,
                                        color: currentIndex == index
                                            ? null
                                            : const Color(0xff1AA9A0),
                                      ),
                                      if (state == true && index == 2)
                                        const Positioned(
                                          top: 0,
                                          right: 0,
                                          child: CircleAvatar(
                                            radius: 5,
                                          ),
                                        )
                                    ],
                                  );
                                },
                              ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
