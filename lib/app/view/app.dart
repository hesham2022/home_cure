// Copyright (c) 2022, Very Good Ventures
// https://verygood.ventures
//
// Use of this source code is governed by an MIT-style
// license that can be found in the LICENSE file or at
// https://opensource.org/licenses/MIT.
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:home_cure/core/local_storage/secure_storage_instance.dart';
import 'package:home_cure/core/routing/routing.gr.dart';
import 'package:home_cure/core/utils/fcm_utils.dart';
import 'package:home_cure/core/utils/map_utils/location_service.dart';
import 'package:home_cure/di/get_it.dart';
import 'package:home_cure/features/appointement/presentation/blocs/appointment_params_cubit.dart/appointment_params_cubit.dart';
import 'package:home_cure/features/appointement/presentation/blocs/appointments_creating_bloc/appointments_cubit.dart';
import 'package:home_cure/features/appointement/presentation/blocs/get_appointments_cubit/my_appointments_cubit..dart';
import 'package:home_cure/features/appointement/presentation/pages/create_appointment_second.dart';
import 'package:home_cure/features/authentication/domain/repositories/i_repository.dart';
import 'package:home_cure/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit.dart';
import 'package:home_cure/features/home/presentation/blocs/ads_cubit/ads_cubit.dart';
import 'package:home_cure/features/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:home_cure/features/home/presentation/blocs/timeslot_cubit/timeslot_cubit.dart';
import 'package:home_cure/features/login/presentation/forget_password_bloc/forget_password_cubit.dart';
import 'package:home_cure/features/login/presentation/verify_otp/verify_otp_cubit.dart';
import 'package:home_cure/features/provider/presentation/blocs/notifications_cubit/notifications_cubit.dart';
import 'package:home_cure/l10n/l10n.dart';
import 'package:overlay_support/overlay_support.dart';

class App extends StatefulWidget {
  const App({super.key});
  static bool isAr(BuildContext context) =>
      context.findRootAncestorStateOfType<_AppState>()!._locale == 'ar';
  static void changeLanguage(BuildContext context, String language) =>
      context.findRootAncestorStateOfType<_AppState>()!.setLocale(language);
  static FormState? formState(BuildContext context) =>
      context.findRootAncestorStateOfType<FormState>();
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
  void setLocale(String locale) {
    setState(() {
      _locale = locale;
    });
    print(locale);
    Storage.setLang(locale);
  }

  String _locale = 'en';
  final _appRouter = AppRouter();
  final notificationsBudgeCubit = NotificationsBudgeCubit();
  @override
  void initState() {
    Storage.getLang().then(
      (value) {
        setState(() {
          print(_locale);
          _locale = value!;
        });
      },
    );
    PushNotifications().initToken();
    LocationService().init();
    super.initState();
  }

  final IAuthenticationRepository authenticationRepository = getIt();
  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(428, 926),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (context, cild) {
        return BlocProvider<AuthenticationBloc>(
          create: (context) => getIt<AuthenticationBloc>(),
          child: OverlaySupport.global(
            child: MultiBlocProvider(
              providers: [
                BlocProvider<UserCubit>(create: (_) => getIt()),
                BlocProvider<HomeBloc>(
                  create: (ctx) => getIt<HomeBloc>()..add(GetServicesEvent()),
                ),
                BlocProvider<ForgetPasswordCubit>(create: (ctx) => getIt()),
                BlocProvider<TimeSlotCubit>(
                  create: (ctx) => getIt()..getTimeSlotsFunc(),
                ),
                BlocProvider<AppointmentsParamsCubit>(
                  create: (ctx) => getIt(),
                ),
                BlocProvider<AppointmentsCubit>(
                  create: (ctx) => getIt(),
                ),
                BlocProvider<AdsCubit>(
                  create: (ctx) => getIt(),
                ),
                BlocProvider<MyAppointmentsCubit>(
                  create: (ctx) => getIt(),
                ),
                BlocProvider<NotificationsBudgeCubit>.value(
                  value: notificationsBudgeCubit,
                ),
                BlocProvider<NotificationsCubit>(
                  create: (_) => NotificationsCubit(),
                ),
                BlocProvider<VerifyOtpCubit>(
                  create: (_) => getIt(),
                ),
              ],
              child: MaterialApp.router(
                locale: Locale(_locale),
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
                builder: EasyLoading.init(
                  builder: (context, child) {
                    // return const Call(
                    //   token:
                    //       '00628e8f388feda4fdc998971a43e355b81IACJ7diqOI9kzzynJRlFKwW8rl/MUBr4+Tt3xmbWAzHC84p+Kioddm3/IgDKMgtCh9UpYwQAAQCH1SljAgCH1SljAwCH1SljBACH1Slj',
                    //   channelName: 'flutter',
                    // );

                    return BlocListener<AuthenticationBloc,
                        AuthenticationState>(
                      listener: (context, state) async {
                        switch (state.status) {
                          case AuthenticationStatus.authenticated:
                            print(state.user.id);
                            context.read<UserCubit>().addNewUser(state.user);
                            await PushNotifications()
                                .init(context, notificationsBudgeCubit);
                            if (state.user.role == 'user') {
                              if (!state.user.isOtpVerified) {
                                await _appRouter.pushAndPopUntil(
                                  const SendOtpPageRoute(),
                                  predicate: (d) => false,
                                );
                              } else {
                                await _appRouter.pushAndPopUntil(
                                  const MainScaffold(),
                                  predicate: (d) => false,
                                );
                              }
                            } else {
                              print('I am Provider ${state.user.id}');
                              await _appRouter.pushAndPopUntil(
                                const MainProviderRouter(),
                                predicate: (d) => false,
                              );
                            }
                            await Storage.setIsFirst();
                            break;
                          case AuthenticationStatus.unauthenticated:
                            final isFirst = await Storage.isFirst();

                            await _appRouter.pushAndPopUntil(
                              isFirst
                                  ? const ChooseLanguagePageRouter()
                                  : const LoginPagePageRouter(),
                              predicate: (d) => false,
                            );
                            await Storage.setIsFirst();
                            break;
                          case AuthenticationStatus.unknown:
                            await _appRouter.pushAndPopUntil(
                              const SplashScreen(),
                              predicate: (d) => false,
                            );
                            await Storage.setIsFirst();
                            break;
                          case AuthenticationStatus.signUpSucess:
                            print('*' * 1000);
                            await _appRouter.pushAndPopUntil(
                              const VaricationOtpPageRoute(),
                              predicate: (d) => false,
                            );
                            await Storage.setIsFirst();
                            break;
                        }
                      },
                      child:
                          // MapWidget(
                          //   mapHelper: MapHelper(),
                          // ),
                          Directionality(
                        textDirection: _locale == 'ar'
                            ? TextDirection.rtl
                            : TextDirection.ltr,
                        child: child!,
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
