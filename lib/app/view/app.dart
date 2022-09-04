// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/core/local_storage/secure_storage_instance.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/l10n/l10n.dart';
import 'package:overlay_support/overlay_support.dart';

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

const primaryColor = Color(0xff0A84E1);
const seocondColor = Color(0xff1AA9A0);
final textStyleWithPrimaryBold = TextStyle(
  fontSize: 20.sp,
  fontWeight: FontWeight.bold,
  color: primaryColor,
);
final textStyleWithPrimarySemiBold = TextStyle(
  fontSize: 20.sp,
  fontWeight: FontWeight.w400,
  color: primaryColor,
);
TextStyle textStyleWithSecondBold({double? s}) => TextStyle(
      fontSize: s ?? 20.sp,
      fontWeight: FontWeight.bold,
      color: seocondColor,
    );
final textStyleWithSecondSemiBold = TextStyle(
  fontSize: 20.sp,
  fontWeight: FontWeight.w400,
  color: seocondColor,
);

//#
class _AppState extends State<App> {
  final _appRouter = AppRouter();
  @override
  void initState() {
    Storage.setIsFirst();
    Storage.isFirst().then((value) {
      if (value == true) {
        _appRouter.push(const ChooseLanguagePageRouter());
      } else {
        _appRouter.push(const LoginPagePageRouter());
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, cild) {
        return OverlaySupport.global(
          child: MaterialApp.router(
            theme: ThemeData(
              fontFamily: 'Segoe UI',
              appBarTheme: const AppBarTheme(color: Color(0xFF13B9FF)),
              primaryColor: primaryColor,
            ),
            localizationsDelegates: const [
              AppLocalizations.delegate,
              GlobalMaterialLocalizations.delegate,
            ],
            supportedLocales: AppLocalizations.supportedLocales,
            routerDelegate: _appRouter.delegate(),
            routeInformationParser: _appRouter.defaultRouteParser(),
            builder: (context, child) {
              return child!;
            },
          ),
        );
      },
    );
  }
}
