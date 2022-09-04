import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:home_cure/app/app.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/gen/assets.gen.dart';

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
  final icons = <HomeIcon>[
    HomeIcon(path: Assets.svg.setting.path, title: 'Setting'),
    HomeIcon(path: Assets.svg.heart.path, title: 'About Us'),
    HomeIcon(path: Assets.svg.home.path, title: 'Home'),
    HomeIcon(path: Assets.svg.ring.path, title: 'Notification'),
    HomeIcon(path: Assets.svg.phone.path, title: 'Contact Us'),
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
                    homeIndex: 2,
                    routes: const [
                      HomeRouter(),
                      SettingPagePageRouter(),
                      AboutUsPageRouter(),
                      NotificationsRouter(),
                      CallingRouter(),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                crossAxisAlignment: CrossAxisAlignment.end,
                                children: List.generate(
                                  icons.length,
                                  (index) => InkWell(
                                    onTap: () => setState(() {
                                      currentIndex = index;

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
                                            children: [
                                              Transform.scale(
                                                scale: .85,
                                                child: SvgPicture.asset(
                                                  icons[index].path,
                                                  height: currentIndex == index
                                                      ? kBottomNavigationBarHeight *
                                                          1
                                                      : null,
                                                  color: currentIndex == index
                                                      ? null
                                                      : const Color(0xff1AA9A0),
                                                ),
                                              ),
                                              Text(
                                                icons[index].title,
                                                style:
                                                    textStyleWithSecondBold(),
                                              )
                                            ],
                                          )
                                        : SvgPicture.asset(
                                            icons[index].path,
                                            height: currentIndex == index
                                                ? kBottomNavigationBarHeight *
                                                    1.2
                                                : null,
                                            color: currentIndex == index
                                                ? null
                                                : const Color(0xff1AA9A0),
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
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
