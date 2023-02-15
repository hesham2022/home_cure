import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_cure/app/view/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/utils/fcm_utils.dart';
import 'package:home_cure/gen/assets.gen.dart';
import 'package:home_cure/l10n/l10n.dart';

final scaffoldKey = GlobalKey<ScaffoldState>();

class MainScaffold extends StatefulWidget {
  const MainScaffold({
    super.key,
  });

  @override
  State<MainScaffold> createState() => _MainScaffoldState();
}

class HomeIcon {
  HomeIcon({required this.path, required this.title});

  final String path;
  final String title;
}

class _MainScaffoldState extends State<MainScaffold> {
  int currentIndex = 2;
  List<HomeIcon> icons(BuildContext context) => [
        HomeIcon(path: Assets.svg.setting.path, title: context.l10n.settings),
        HomeIcon(path: Assets.svg.heart.path, title: context.l10n.aboutUs),
        HomeIcon(path: Assets.svg.home.path, title: context.l10n.home),
        HomeIcon(path: Assets.svg.ring.path, title: context.l10n.notifications),
        HomeIcon(path: Assets.svg.phone.path, title: context.l10n.contactUs),
      ];

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        Positioned(
          child: Container(
            width: 500,
            decoration: BoxDecoration(
              color: Colors.blue,
              image: DecorationImage(
                fit: BoxFit.cover,
                image: AssetImage(
                  Assets.img.sacffoldimg.path,
                ),
              ),
            ),
            child: DecoratedBox(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: FractionalOffset.bottomRight,
                  end: FractionalOffset.topLeft,
                  colors: [
                    const Color(0xffF8E5E8).withOpacity(.8),
                    const Color(0xffE6DAF5).withOpacity(.8),
                    const Color(0xffE4F0FC).withOpacity(.8),
                    const Color(0xffE8EEF2).withOpacity(.8),
                  ],
                ),
              ),
              child: Stack(
                children: [
                  Positioned(
                    top: -250,
                    right: -300,
                    child: Container(
                      height: 500,
                      width: 500,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        border: Border.all(
                          color: const Color(0xffD74B7F),
                          width: .5,
                        ),
                      ),
                    ),
                  ),
                  Positioned(
                    bottom: -600,
                    left: -300,
                    child: Container(
                      height: 948,
                      width: 422,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(211),
                        border: Border.all(
                          color: const Color(0xffD74B7F),
                          width: .5,
                        ),
                      ),
                    ),
                  ),
                  AutoTabsScaffold(
                    homeIndex: 0,
                    routes: const [
                      HomeRouter(),
                      SettingPagePageRouter(),
                      AboutUsPageRouter(),
                      NotificationsRouter(),
                      CallingRouter(),
                    ],
                    backgroundColor: Colors.transparent,
                    bottomNavigationBuilder: (c, tabsRouter) {
                      tabsRouter.addListener(
                        () {
                          if (tabsRouter.activeIndex == 0 &&
                              currentIndex != 2) {
                            setState(() {
                              currentIndex = 2;
                            });
                          }
                        },
                      );
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
                            icons(context).length,
                            (index) => InkWell(
                              onTap: () => setState(() {
                                currentIndex = index;
                                if (context
                                            .read<NotificationsBudgeCubit>()
                                            .state >
                                        0 &&
                                    currentIndex == 3) {
                                  context
                                      .read<NotificationsBudgeCubit>()
                                      .read();
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
                                    tabsRouter.setActiveIndex(2);
                                    break;
                                  case 2:
                                    tabsRouter.setActiveIndex(0);
                                    break;
                                  case 3:
                                    tabsRouter.setActiveIndex(3);
                                    break;
                                  case 4:
                                    tabsRouter.setActiveIndex(4);
                                    break;
                                }
                              }),
                              child: currentIndex == index
                                  ? Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Stack(
                                          children: [
                                            SvgPicture.asset(
                                              height: 28,
                                              icons(context)[index].path,
                                              color: currentIndex == index
                                                  ? null
                                                  : const Color(
                                                      0xff1AA9A0,
                                                    ),
                                            ),
                                          ],
                                        ),
                                        Text(
                                          icons(context)[index].title,
                                          style: context.l10n.localeName == 'en'
                                              ? textStyleWithSecondBold()
                                                  .copyWith(fontSize: 12)
                                              : textStyleWithSecondBold()
                                                  .copyWith(fontSize: 10),
                                        )
                                      ],
                                    )
                                  : BlocBuilder<NotificationsBudgeCubit, int>(
                                      buildWhen: (previous, current) =>
                                          index == 3,
                                      builder: (context, state) {
                                        return Column(
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            Stack(
                                              clipBehavior: Clip.none,
                                              children: [
                                                SvgPicture.asset(
                                                  height: 28,
                                                  icons(context)[index].path,
                                                  color: currentIndex == index
                                                      ? null
                                                      : const Color(
                                                          0xff1AA9A0,
                                                        ),
                                                ),
                                                if (state > 0 && index == 3)
                                                  Positioned(
                                                    top: 0,
                                                    right: -4,
                                                    child: CircleAvatar(
                                                      radius: 9,
                                                      child: Column(
                                                        children: [
                                                          Center(
                                                            child: Text(
                                                              state.toString(),
                                                              style:
                                                                  textStyleWithPrimaryBold
                                                                      .copyWith(
                                                                fontSize: 12,
                                                                color: Colors
                                                                    .white,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                              ],
                                            ),
                                            Text(
                                              icons(context)[index].title,
                                              style: context.l10n.localeName ==
                                                      'en'
                                                  ? textStyleWithSecondBold()
                                                      .copyWith(fontSize: 12)
                                                  : textStyleWithSecondBold()
                                                      .copyWith(fontSize: 10),
                                            ),
                                          ],
                                        );
                                      },
                                    ),
                            ),
                          ),
                          //  Stack(
                          //   clipBehavior: Clip.none,
                          //   alignment: Alignment.center,
                          //   children: [
                          //     Positioned(
                          //       bottom: 10,
                          //       left: 0,
                          //       right: 0,
                          //       child: Row(
                          //         mainAxisAlignment:
                          //             MainAxisAlignment.spaceAround,
                          //         crossAxisAlignment: CrossAxisAlignment.end,
                          //         children: List.generate(
                          //           icons(context).length,
                          //           (index) => InkWell(
                          //             onTap: () => setState(() {
                          //               currentIndex = index;
                          //               if (context
                          //                           .read<
                          //                               NotificationsBudgeCubit>()
                          //                           .state >
                          //                       0 &&
                          //                   currentIndex == 3) {
                          //                 context
                          //                     .read<NotificationsBudgeCubit>()
                          //                     .read();
                          //               }

                          //               /// ! this is ver danegrous
                          //               /// you can di it sempily like this
                          //               /// `` tabsRouter.setActiveIndex(index)
                          //               /// ``` ;
                          //               /// i did this because intial page is the
                          //               /// first route;
                          //               /// so i put HomeRoute as the first route
                          //               /// to be intial ;
                          //               ///its temporatu solution

                          //               switch (index) {
                          //                 case 0:
                          //                   tabsRouter.setActiveIndex(1);
                          //                   break;
                          //                 case 1:
                          //                   tabsRouter.setActiveIndex(2);
                          //                   break;
                          //                 case 2:
                          //                   tabsRouter.setActiveIndex(0);
                          //                   break;
                          //                 case 3:
                          //                   tabsRouter.setActiveIndex(3);
                          //                   break;
                          //                 case 4:
                          //                   tabsRouter.setActiveIndex(4);
                          //                   break;
                          //               }
                          //             }),
                          //             child: currentIndex == index
                          //                 ? Column(
                          //                     children: [
                          //                       Transform.scale(
                          //                         scale: .85,
                          //                         child: SvgPicture.asset(
                          //                           icons(context)[index].path,
                          //                           height: currentIndex == index
                          //                               ? kBottomNavigationBarHeight *
                          //                                   1
                          //                               : null,
                          //                           color: currentIndex == index
                          //                               ? null
                          //                               : const Color(0xff1AA9A0),
                          //                         ),
                          //                       ),
                          //                       Text(
                          //                         icons(context)[index].title,
                          //                         style: context
                          //                                     .l10n.localeName ==
                          //                                 'en'
                          //                             ? textStyleWithSecondBold()
                          //                             : textStyleWithSecondBold()
                          //                                 .copyWith(fontSize: 16),
                          //                       )
                          //                     ],
                          //                   )
                          //                 :
                          // BlocBuilder<NotificationsBudgeCubit,
                          //                     int>(
                          //                     buildWhen: (previous, current) =>
                          //                         index == 3,
                          //                     builder: (context, state) {
                          //                       return Stack(
                          //                         clipBehavior: Clip.none,
                          //                         children: [
                          //                           SvgPicture.asset(
                          //                             icons(context)[index].path,
                          //                             height: currentIndex ==
                          //                                     index
                          //                                 ? kBottomNavigationBarHeight *
                          //                                     1.2
                          //                                 : null,
                          //                             color: currentIndex == index
                          //                                 ? null
                          //                                 : const Color(
                          //                                     0xff1AA9A0,
                          //                                   ),
                          //                           ),
                          //                           if (state > 0 && index == 3)
                          //                             Positioned(
                          //                               top: 0,
                          //                               right: -4,
                          //                               child: CircleAvatar(
                          //                                 radius: 10,
                          //                                 child: Text(
                          //                                   state.toString(),
                          //                                   style:
                          //                                       textStyleWithPrimaryBold
                          //                                           .copyWith(
                          //                                     color: Colors.white,
                          //                                     fontWeight:
                          //                                         FontWeight.bold,
                          //                                   ),
                          //                                 ),
                          //                               ),
                          //                             )
                          //                         ],
                          //                       );
                          //                     },
                          //                   ),
                          //           ),
                          //         ),
                          //       ),
                          //     ),
                          //   ],
                          // ),
                        ),
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
