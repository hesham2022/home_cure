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
import 'package:home_cure/di/get_it.dart';
import 'package:home_cure/features/appointement/presentation/blocs/appointment_params_cubit.dart/appointment_params_cubit.dart';
import 'package:home_cure/features/appointement/presentation/blocs/appointments_creating_bloc/appointments_cubit.dart';
import 'package:home_cure/features/appointement/presentation/blocs/get_appointments_cubit/my_appointments_cubit..dart';
import 'package:home_cure/features/authentication/domain/repositories/i_repository.dart';
import 'package:home_cure/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit.dart';
import 'package:home_cure/features/home/presentation/blocs/ads_cubit/ads_cubit.dart';
import 'package:home_cure/features/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:home_cure/features/home/presentation/blocs/timeslot_cubit/timeslot_cubit.dart';
import 'package:home_cure/features/login/presentation/forget_password_bloc/forget_password_cubit.dart';
import 'package:home_cure/features/provider/presentation/blocs/notifications_cubit/notifications_cubit.dart';
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
  final notificationsBudgeCubit = NotificationsBudgeCubit();
  @override
  void initState() {
    Storage.setIsFirst();

    PushNotifications().initToken();
  
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
              ],
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
                builder: EasyLoading.init(
                  builder: (context, child) {
                    return BlocListener<AuthenticationBloc,
                        AuthenticationState>(
                      listener: (context, state) async {
                        switch (state.status) {
                          case AuthenticationStatus.authenticated:
                            context.read<UserCubit>().addNewUser(state.user);
                            await PushNotifications()
                                .init(context, notificationsBudgeCubit);
                            if (state.user.role == 'user') {
                              await _appRouter.pushAndPopUntil(
                                const MainScaffold(),
                                predicate: (d) => false,
                              );
                            } else {
                              await _appRouter.pushAndPopUntil(
                                const MainProviderRouter(),
                                predicate: (d) => false,
                              );
                            }

                            break;
                          case AuthenticationStatus.unauthenticated:
                            final isFirst = await Storage.isFirst();

                            await _appRouter.pushAndPopUntil(
                              isFirst
                                  ? const ChooseLanguagePageRouter()
                                  : const LoginPagePageRouter(),
                              predicate: (d) => false,
                            );

                            break;
                          case AuthenticationStatus.unknown:
                            await _appRouter.pushAndPopUntil(
                              const SplashScreen(),
                              predicate: (d) => false,
                            );

                            break;
                        }
                      },
                      child: child,
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
