// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:auto_route/auto_route.dart' as _i9;
import 'package:flutter/material.dart' as _i32;

import '../../features/aboutus_contactus/presentation/pages/about_us.dart'
    as _i13;
import '../../features/appointement/presentation/pages/create_appointement.dart'
    as _i16;
import '../../features/appointement/presentation/pages/create_appointment_for.dart'
    as _i19;
import '../../features/appointement/presentation/pages/create_appointment_payment.dart'
    as _i20;
import '../../features/appointement/presentation/pages/create_appointment_second.dart'
    as _i17;
import '../../features/appointement/presentation/pages/create_appointment_third.dart'
    as _i18;
import '../../features/appointement/presentation/pages/done_page.dart' as _i21;
import '../../features/calling/presentation/pages/calling_page.dart' as _i11;
import '../../features/home/presentation/pages/home.dart' as _i14;
import '../../features/home/presentation/pages/home_data.dart' as _i33;
import '../../features/login/presentation/pages/choose_language_page.dart'
    as _i8;
import '../../features/login/presentation/pages/forget_password.dart' as _i5;
import '../../features/login/presentation/pages/login_page.dart' as _i3;
import '../../features/login/presentation/pages/reqgister_page.dart' as _i4;
import '../../features/login/presentation/pages/resret_password_page.dart'
    as _i7;
import '../../features/login/presentation/pages/splash_screen.dart' as _i1;
import '../../features/login/presentation/pages/varication_code_page.dart'
    as _i6;
import '../../features/notifications/presentation/pages/notifications_page.dart'
    as _i10;
import '../../features/our_doctors/pages/doctor_profile.dart' as _i23;
import '../../features/our_doctors/pages/doctors_page.dart' as _i22;
import '../../features/Services/presentation/pages/services_page.dart' as _i15;
import '../../features/setting/presentation/pages/setting_page.dart' as _i24;
import '../../features/user_details/presentation/pages/attachments_page.dart'
    as _i29;
import '../../features/user_details/presentation/pages/current_medications.dart'
    as _i26;
import '../../features/user_details/presentation/pages/family_diseases.dart'
    as _i27;
import '../../features/user_details/presentation/pages/medical_history_page.dart'
    as _i25;
import '../../features/user_details/presentation/pages/pdf_viewer_page.dart'
    as _i31;
import '../../features/user_details/presentation/pages/photo_view_page.dart'
    as _i30;
import '../../features/user_details/presentation/pages/user_details_page.dart'
    as _i12;
import '../../features/user_details/presentation/widgets/shared_list.dart'
    as _i28;
import '../widgets/main_scaffold.dart' as _i2;

class AppRouter extends _i9.RootStackRouter {
  AppRouter([_i32.GlobalKey<_i32.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i9.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i9.CustomPage<void>(
          routeData: routeData,
          child: const _i1.SplashScreen(),
          transitionsBuilder: _i9.TransitionsBuilders.noTransition,
          opaque: true,
          barrierDismissible: false);
    },
    MainScaffold.name: (routeData) {
      return _i9.CupertinoPageX<void>(
          routeData: routeData, child: const _i2.MainScaffold());
    },
    LoginPagePageRouter.name: (routeData) {
      return _i9.CupertinoPageX<void>(
          routeData: routeData, child: const _i3.LoginPage());
    },
    RegisterPagePageRouter.name: (routeData) {
      return _i9.CupertinoPageX<void>(
          routeData: routeData, child: const _i4.RegisterPage());
    },
    ForgotPasswordPageRouter.name: (routeData) {
      return _i9.CupertinoPageX<void>(
          routeData: routeData, child: const _i5.ForgotPasswordPage());
    },
    VaricationCodePageRouter.name: (routeData) {
      return _i9.CupertinoPageX<void>(
          routeData: routeData, child: const _i6.VaricationCodePage());
    },
    ReserPasswordPageRouter.name: (routeData) {
      return _i9.CupertinoPageX<void>(
          routeData: routeData, child: const _i7.ReserPasswordPage());
    },
    ChooseLanguagePageRouter.name: (routeData) {
      return _i9.CupertinoPageX<void>(
          routeData: routeData, child: const _i8.ChooseLanguagePage());
    },
    HomeRouter.name: (routeData) {
      return _i9.CustomPage<void>(
          routeData: routeData,
          child: const _i9.EmptyRouterPage(),
          transitionsBuilder: _i9.TransitionsBuilders.slideTop,
          opaque: true,
          barrierDismissible: true);
    },
    NotificationsRouter.name: (routeData) {
      return _i9.CupertinoPageX<void>(
          routeData: routeData, child: const _i10.NotificationsPage());
    },
    CallingRouter.name: (routeData) {
      return _i9.CupertinoPageX<void>(
          routeData: routeData, child: const _i11.CallingPage());
    },
    UserDetailsPageRouter.name: (routeData) {
      return _i9.CupertinoPageX<void>(
          routeData: routeData, child: const _i12.UserDetailsPage());
    },
    AboutUsPageRouter.name: (routeData) {
      return _i9.CupertinoPageX<void>(
          routeData: routeData, child: const _i13.AboutUs());
    },
    SettingPagePageRouter.name: (routeData) {
      return _i9.CustomPage<void>(
          routeData: routeData,
          child: const _i9.EmptyRouterPage(),
          transitionsBuilder: _i9.TransitionsBuilders.slideTop,
          opaque: true,
          barrierDismissible: false);
    },
    HomeScreen.name: (routeData) {
      return _i9.CustomPage<void>(
          routeData: routeData,
          child: const _i14.HomeScreen(),
          transitionsBuilder: _i9.TransitionsBuilders.slideTop,
          opaque: true,
          barrierDismissible: true);
    },
    ServicesRoute.name: (routeData) {
      final args = routeData.argsAs<ServicesRouteArgs>();
      return _i9.CustomPage<void>(
          routeData: routeData,
          child: _i15.ServicesPage(key: args.key, service: args.service),
          transitionsBuilder: _i9.TransitionsBuilders.slideTop,
          opaque: true,
          barrierDismissible: true);
    },
    CreateAppointementRoute.name: (routeData) {
      final args = routeData.argsAs<CreateAppointementRouteArgs>();
      return _i9.CustomPage<void>(
          routeData: routeData,
          child: _i16.CreateAppointementPage(
              key: args.key,
              service: args.service,
              customPrice: args.customPrice),
          transitionsBuilder: _i9.TransitionsBuilders.slideTop,
          opaque: true,
          barrierDismissible: true);
    },
    CreateAppointementSecondRoute.name: (routeData) {
      final args = routeData.argsAs<CreateAppointementSecondRouteArgs>();
      return _i9.CustomPage<void>(
          routeData: routeData,
          child: _i17.CreateAppointementSecondPage(
              key: args.key, service: args.service),
          transitionsBuilder: _i9.TransitionsBuilders.slideTop,
          opaque: true,
          barrierDismissible: true);
    },
    CreateAppointementThirdRoute.name: (routeData) {
      final args = routeData.argsAs<CreateAppointementThirdRouteArgs>();
      return _i9.CustomPage<void>(
          routeData: routeData,
          child: _i18.CreateAppointementThirdPage(
              key: args.key, service: args.service),
          transitionsBuilder: _i9.TransitionsBuilders.slideTop,
          opaque: true,
          barrierDismissible: true);
    },
    CreateAppointementFourthRoute.name: (routeData) {
      final args = routeData.argsAs<CreateAppointementFourthRouteArgs>();
      return _i9.CustomPage<void>(
          routeData: routeData,
          child: _i19.CreateAppointementFourthPage(
              key: args.key, service: args.service),
          transitionsBuilder: _i9.TransitionsBuilders.slideTop,
          opaque: true,
          barrierDismissible: true);
    },
    CreateAppointmentPayment.name: (routeData) {
      final args = routeData.argsAs<CreateAppointmentPaymentArgs>();
      return _i9.CustomPage<void>(
          routeData: routeData,
          child: _i20.CreateAppointmentPayment(
              key: args.key, service: args.service),
          transitionsBuilder: _i9.TransitionsBuilders.slideTop,
          opaque: true,
          barrierDismissible: true);
    },
    DoneRoute.name: (routeData) {
      return _i9.CustomPage<void>(
          routeData: routeData,
          child: const _i21.DonePage(),
          transitionsBuilder: _i9.TransitionsBuilders.slideTop,
          opaque: true,
          barrierDismissible: true);
    },
    DoctorsRoute.name: (routeData) {
      return _i9.CustomPage<void>(
          routeData: routeData,
          child: const _i22.DoctorsPage(),
          transitionsBuilder: _i9.TransitionsBuilders.slideTop,
          opaque: true,
          barrierDismissible: true);
    },
    DoctorProfile.name: (routeData) {
      return _i9.CustomPage<void>(
          routeData: routeData,
          child: const _i23.DoctorProfile(),
          transitionsBuilder: _i9.TransitionsBuilders.slideTop,
          opaque: true,
          barrierDismissible: true);
    },
    SettingRoute.name: (routeData) {
      return _i9.CupertinoPageX<void>(
          routeData: routeData, child: const _i24.SettingPage());
    },
    MedicalHistoryPageeRouter.name: (routeData) {
      return _i9.CupertinoPageX<void>(
          routeData: routeData, child: const _i25.MedicalHistoryPage());
    },
    CurrentMedicationsPageRouter.name: (routeData) {
      return _i9.CupertinoPageX<void>(
          routeData: routeData, child: const _i26.CurrentMedicationsPage());
    },
    FamilyDeseasesPageRouter.name: (routeData) {
      return _i9.CupertinoPageX<void>(
          routeData: routeData, child: const _i27.FamilyDeseasesPage());
    },
    SharedListRouter.name: (routeData) {
      final args = routeData.argsAs<SharedListRouterArgs>();
      return _i9.CupertinoPageX<void>(
          routeData: routeData,
          child: _i28.SharedList(
              key: args.key, title: args.title, subTitle: args.subTitle));
    },
    AttachmentsPageRouter.name: (routeData) {
      return _i9.CupertinoPageX<void>(
          routeData: routeData, child: const _i9.EmptyRouterPage());
    },
    AttachmentsRoute.name: (routeData) {
      return _i9.CupertinoPageX<void>(
          routeData: routeData, child: const _i29.AttachmentsPage());
    },
    PhotoViewPageeRouter.name: (routeData) {
      final args = routeData.argsAs<PhotoViewPageeRouterArgs>();
      return _i9.CupertinoPageX<void>(
          routeData: routeData,
          child: _i30.PhotoViewPage(key: args.key, path: args.path));
    },
    PdfViewerPageRouter.name: (routeData) {
      final args = routeData.argsAs<PdfViewerPageRouterArgs>();
      return _i9.CupertinoPageX<void>(
          routeData: routeData,
          child: _i31.PdfViewerPage(key: args.key, paht: args.paht));
    }
  };

  @override
  List<_i9.RouteConfig> get routes => [
        _i9.RouteConfig(SplashScreen.name, path: '/'),
        _i9.RouteConfig(MainScaffold.name, path: 'main', children: [
          _i9.RouteConfig(HomeRouter.name,
              path: 'home',
              parent: MainScaffold.name,
              children: [
                _i9.RouteConfig(HomeScreen.name,
                    path: '', parent: HomeRouter.name),
                _i9.RouteConfig(ServicesRoute.name,
                    path: 'services', parent: HomeRouter.name),
                _i9.RouteConfig(CreateAppointementRoute.name,
                    path: 'create_appointement', parent: HomeRouter.name),
                _i9.RouteConfig(CreateAppointementSecondRoute.name,
                    path: 'create_appointement_second',
                    parent: HomeRouter.name),
                _i9.RouteConfig(CreateAppointementThirdRoute.name,
                    path: 'create_appointement_third', parent: HomeRouter.name),
                _i9.RouteConfig(CreateAppointementFourthRoute.name,
                    path: 'create_appointement_fourth',
                    parent: HomeRouter.name),
                _i9.RouteConfig(CreateAppointmentPayment.name,
                    path: 'create_appointement_payment',
                    parent: HomeRouter.name),
                _i9.RouteConfig(DoneRoute.name,
                    path: 'done_page', parent: HomeRouter.name),
                _i9.RouteConfig(DoctorsRoute.name,
                    path: 'doctors_page', parent: HomeRouter.name),
                _i9.RouteConfig(DoctorProfile.name,
                    path: 'doctor_profile', parent: HomeRouter.name)
              ]),
          _i9.RouteConfig(NotificationsRouter.name,
              path: 'notification', parent: MainScaffold.name),
          _i9.RouteConfig(CallingRouter.name,
              path: 'calling', parent: MainScaffold.name),
          _i9.RouteConfig(UserDetailsPageRouter.name,
              path: 'user_details', parent: MainScaffold.name),
          _i9.RouteConfig(AboutUsPageRouter.name,
              path: 'about_us', parent: MainScaffold.name),
          _i9.RouteConfig(SettingPagePageRouter.name,
              path: 'setting',
              parent: MainScaffold.name,
              children: [
                _i9.RouteConfig(SettingRoute.name,
                    path: '', parent: SettingPagePageRouter.name),
                _i9.RouteConfig(UserDetailsPageRouter.name,
                    path: 'user_details', parent: SettingPagePageRouter.name),
                _i9.RouteConfig(MedicalHistoryPageeRouter.name,
                    path: 'medical_history',
                    parent: SettingPagePageRouter.name),
                _i9.RouteConfig(CurrentMedicationsPageRouter.name,
                    path: 'current_medications',
                    parent: SettingPagePageRouter.name),
                _i9.RouteConfig(FamilyDeseasesPageRouter.name,
                    path: 'family_deseasesPage',
                    parent: SettingPagePageRouter.name),
                _i9.RouteConfig(SharedListRouter.name,
                    path: 'shared_list', parent: SettingPagePageRouter.name),
                _i9.RouteConfig(AttachmentsPageRouter.name,
                    path: 'attachments_page',
                    parent: SettingPagePageRouter.name,
                    children: [
                      _i9.RouteConfig(AttachmentsRoute.name,
                          path: '', parent: AttachmentsPageRouter.name),
                      _i9.RouteConfig(PhotoViewPageeRouter.name,
                          path: 'photo_view_page',
                          parent: AttachmentsPageRouter.name),
                      _i9.RouteConfig(PdfViewerPageRouter.name,
                          path: 'pdf_view_page',
                          parent: AttachmentsPageRouter.name)
                    ])
              ])
        ]),
        _i9.RouteConfig(LoginPagePageRouter.name, path: 'login'),
        _i9.RouteConfig(RegisterPagePageRouter.name, path: 'register'),
        _i9.RouteConfig(ForgotPasswordPageRouter.name,
            path: 'forgot_password_page'),
        _i9.RouteConfig(VaricationCodePageRouter.name,
            path: 'varication_code_page'),
        _i9.RouteConfig(ReserPasswordPageRouter.name,
            path: 'reser_password_page'),
        _i9.RouteConfig(ChooseLanguagePageRouter.name,
            path: 'choose_language_page')
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i9.PageRouteInfo<void> {
  const SplashScreen() : super(SplashScreen.name, path: '/');

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.MainScaffold]
class MainScaffold extends _i9.PageRouteInfo<void> {
  const MainScaffold({List<_i9.PageRouteInfo>? children})
      : super(MainScaffold.name, path: 'main', initialChildren: children);

  static const String name = 'MainScaffold';
}

/// generated route for
/// [_i3.LoginPage]
class LoginPagePageRouter extends _i9.PageRouteInfo<void> {
  const LoginPagePageRouter() : super(LoginPagePageRouter.name, path: 'login');

  static const String name = 'LoginPagePageRouter';
}

/// generated route for
/// [_i4.RegisterPage]
class RegisterPagePageRouter extends _i9.PageRouteInfo<void> {
  const RegisterPagePageRouter()
      : super(RegisterPagePageRouter.name, path: 'register');

  static const String name = 'RegisterPagePageRouter';
}

/// generated route for
/// [_i5.ForgotPasswordPage]
class ForgotPasswordPageRouter extends _i9.PageRouteInfo<void> {
  const ForgotPasswordPageRouter()
      : super(ForgotPasswordPageRouter.name, path: 'forgot_password_page');

  static const String name = 'ForgotPasswordPageRouter';
}

/// generated route for
/// [_i6.VaricationCodePage]
class VaricationCodePageRouter extends _i9.PageRouteInfo<void> {
  const VaricationCodePageRouter()
      : super(VaricationCodePageRouter.name, path: 'varication_code_page');

  static const String name = 'VaricationCodePageRouter';
}

/// generated route for
/// [_i7.ReserPasswordPage]
class ReserPasswordPageRouter extends _i9.PageRouteInfo<void> {
  const ReserPasswordPageRouter()
      : super(ReserPasswordPageRouter.name, path: 'reser_password_page');

  static const String name = 'ReserPasswordPageRouter';
}

/// generated route for
/// [_i8.ChooseLanguagePage]
class ChooseLanguagePageRouter extends _i9.PageRouteInfo<void> {
  const ChooseLanguagePageRouter()
      : super(ChooseLanguagePageRouter.name, path: 'choose_language_page');

  static const String name = 'ChooseLanguagePageRouter';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class HomeRouter extends _i9.PageRouteInfo<void> {
  const HomeRouter({List<_i9.PageRouteInfo>? children})
      : super(HomeRouter.name, path: 'home', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i10.NotificationsPage]
class NotificationsRouter extends _i9.PageRouteInfo<void> {
  const NotificationsRouter()
      : super(NotificationsRouter.name, path: 'notification');

  static const String name = 'NotificationsRouter';
}

/// generated route for
/// [_i11.CallingPage]
class CallingRouter extends _i9.PageRouteInfo<void> {
  const CallingRouter() : super(CallingRouter.name, path: 'calling');

  static const String name = 'CallingRouter';
}

/// generated route for
/// [_i12.UserDetailsPage]
class UserDetailsPageRouter extends _i9.PageRouteInfo<void> {
  const UserDetailsPageRouter()
      : super(UserDetailsPageRouter.name, path: 'user_details');

  static const String name = 'UserDetailsPageRouter';
}

/// generated route for
/// [_i13.AboutUs]
class AboutUsPageRouter extends _i9.PageRouteInfo<void> {
  const AboutUsPageRouter() : super(AboutUsPageRouter.name, path: 'about_us');

  static const String name = 'AboutUsPageRouter';
}

/// generated route for
/// [_i9.EmptyRouterPage]
class SettingPagePageRouter extends _i9.PageRouteInfo<void> {
  const SettingPagePageRouter({List<_i9.PageRouteInfo>? children})
      : super(SettingPagePageRouter.name,
            path: 'setting', initialChildren: children);

  static const String name = 'SettingPagePageRouter';
}

/// generated route for
/// [_i14.HomeScreen]
class HomeScreen extends _i9.PageRouteInfo<void> {
  const HomeScreen() : super(HomeScreen.name, path: '');

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i15.ServicesPage]
class ServicesRoute extends _i9.PageRouteInfo<ServicesRouteArgs> {
  ServicesRoute({_i32.Key? key, required _i33.Service service})
      : super(ServicesRoute.name,
            path: 'services',
            args: ServicesRouteArgs(key: key, service: service));

  static const String name = 'ServicesRoute';
}

class ServicesRouteArgs {
  const ServicesRouteArgs({this.key, required this.service});

  final _i32.Key? key;

  final _i33.Service service;

  @override
  String toString() {
    return 'ServicesRouteArgs{key: $key, service: $service}';
  }
}

/// generated route for
/// [_i16.CreateAppointementPage]
class CreateAppointementRoute
    extends _i9.PageRouteInfo<CreateAppointementRouteArgs> {
  CreateAppointementRoute(
      {_i32.Key? key, required _i33.Service service, double? customPrice})
      : super(CreateAppointementRoute.name,
            path: 'create_appointement',
            args: CreateAppointementRouteArgs(
                key: key, service: service, customPrice: customPrice));

  static const String name = 'CreateAppointementRoute';
}

class CreateAppointementRouteArgs {
  const CreateAppointementRouteArgs(
      {this.key, required this.service, this.customPrice});

  final _i32.Key? key;

  final _i33.Service service;

  final double? customPrice;

  @override
  String toString() {
    return 'CreateAppointementRouteArgs{key: $key, service: $service, customPrice: $customPrice}';
  }
}

/// generated route for
/// [_i17.CreateAppointementSecondPage]
class CreateAppointementSecondRoute
    extends _i9.PageRouteInfo<CreateAppointementSecondRouteArgs> {
  CreateAppointementSecondRoute({_i32.Key? key, required _i33.Service service})
      : super(CreateAppointementSecondRoute.name,
            path: 'create_appointement_second',
            args:
                CreateAppointementSecondRouteArgs(key: key, service: service));

  static const String name = 'CreateAppointementSecondRoute';
}

class CreateAppointementSecondRouteArgs {
  const CreateAppointementSecondRouteArgs({this.key, required this.service});

  final _i32.Key? key;

  final _i33.Service service;

  @override
  String toString() {
    return 'CreateAppointementSecondRouteArgs{key: $key, service: $service}';
  }
}

/// generated route for
/// [_i18.CreateAppointementThirdPage]
class CreateAppointementThirdRoute
    extends _i9.PageRouteInfo<CreateAppointementThirdRouteArgs> {
  CreateAppointementThirdRoute({_i32.Key? key, required _i33.Service service})
      : super(CreateAppointementThirdRoute.name,
            path: 'create_appointement_third',
            args: CreateAppointementThirdRouteArgs(key: key, service: service));

  static const String name = 'CreateAppointementThirdRoute';
}

class CreateAppointementThirdRouteArgs {
  const CreateAppointementThirdRouteArgs({this.key, required this.service});

  final _i32.Key? key;

  final _i33.Service service;

  @override
  String toString() {
    return 'CreateAppointementThirdRouteArgs{key: $key, service: $service}';
  }
}

/// generated route for
/// [_i19.CreateAppointementFourthPage]
class CreateAppointementFourthRoute
    extends _i9.PageRouteInfo<CreateAppointementFourthRouteArgs> {
  CreateAppointementFourthRoute({_i32.Key? key, required _i33.Service service})
      : super(CreateAppointementFourthRoute.name,
            path: 'create_appointement_fourth',
            args:
                CreateAppointementFourthRouteArgs(key: key, service: service));

  static const String name = 'CreateAppointementFourthRoute';
}

class CreateAppointementFourthRouteArgs {
  const CreateAppointementFourthRouteArgs({this.key, required this.service});

  final _i32.Key? key;

  final _i33.Service service;

  @override
  String toString() {
    return 'CreateAppointementFourthRouteArgs{key: $key, service: $service}';
  }
}

/// generated route for
/// [_i20.CreateAppointmentPayment]
class CreateAppointmentPayment
    extends _i9.PageRouteInfo<CreateAppointmentPaymentArgs> {
  CreateAppointmentPayment({_i32.Key? key, required _i33.Service service})
      : super(CreateAppointmentPayment.name,
            path: 'create_appointement_payment',
            args: CreateAppointmentPaymentArgs(key: key, service: service));

  static const String name = 'CreateAppointmentPayment';
}

class CreateAppointmentPaymentArgs {
  const CreateAppointmentPaymentArgs({this.key, required this.service});

  final _i32.Key? key;

  final _i33.Service service;

  @override
  String toString() {
    return 'CreateAppointmentPaymentArgs{key: $key, service: $service}';
  }
}

/// generated route for
/// [_i21.DonePage]
class DoneRoute extends _i9.PageRouteInfo<void> {
  const DoneRoute() : super(DoneRoute.name, path: 'done_page');

  static const String name = 'DoneRoute';
}

/// generated route for
/// [_i22.DoctorsPage]
class DoctorsRoute extends _i9.PageRouteInfo<void> {
  const DoctorsRoute() : super(DoctorsRoute.name, path: 'doctors_page');

  static const String name = 'DoctorsRoute';
}

/// generated route for
/// [_i23.DoctorProfile]
class DoctorProfile extends _i9.PageRouteInfo<void> {
  const DoctorProfile() : super(DoctorProfile.name, path: 'doctor_profile');

  static const String name = 'DoctorProfile';
}

/// generated route for
/// [_i24.SettingPage]
class SettingRoute extends _i9.PageRouteInfo<void> {
  const SettingRoute() : super(SettingRoute.name, path: '');

  static const String name = 'SettingRoute';
}

/// generated route for
/// [_i25.MedicalHistoryPage]
class MedicalHistoryPageeRouter extends _i9.PageRouteInfo<void> {
  const MedicalHistoryPageeRouter()
      : super(MedicalHistoryPageeRouter.name, path: 'medical_history');

  static const String name = 'MedicalHistoryPageeRouter';
}

/// generated route for
/// [_i26.CurrentMedicationsPage]
class CurrentMedicationsPageRouter extends _i9.PageRouteInfo<void> {
  const CurrentMedicationsPageRouter()
      : super(CurrentMedicationsPageRouter.name, path: 'current_medications');

  static const String name = 'CurrentMedicationsPageRouter';
}

/// generated route for
/// [_i27.FamilyDeseasesPage]
class FamilyDeseasesPageRouter extends _i9.PageRouteInfo<void> {
  const FamilyDeseasesPageRouter()
      : super(FamilyDeseasesPageRouter.name, path: 'family_deseasesPage');

  static const String name = 'FamilyDeseasesPageRouter';
}

/// generated route for
/// [_i28.SharedList]
class SharedListRouter extends _i9.PageRouteInfo<SharedListRouterArgs> {
  SharedListRouter(
      {_i32.Key? key, required String title, required String subTitle})
      : super(SharedListRouter.name,
            path: 'shared_list',
            args: SharedListRouterArgs(
                key: key, title: title, subTitle: subTitle));

  static const String name = 'SharedListRouter';
}

class SharedListRouterArgs {
  const SharedListRouterArgs(
      {this.key, required this.title, required this.subTitle});

  final _i32.Key? key;

  final String title;

  final String subTitle;

  @override
  String toString() {
    return 'SharedListRouterArgs{key: $key, title: $title, subTitle: $subTitle}';
  }
}

/// generated route for
/// [_i9.EmptyRouterPage]
class AttachmentsPageRouter extends _i9.PageRouteInfo<void> {
  const AttachmentsPageRouter({List<_i9.PageRouteInfo>? children})
      : super(AttachmentsPageRouter.name,
            path: 'attachments_page', initialChildren: children);

  static const String name = 'AttachmentsPageRouter';
}

/// generated route for
/// [_i29.AttachmentsPage]
class AttachmentsRoute extends _i9.PageRouteInfo<void> {
  const AttachmentsRoute() : super(AttachmentsRoute.name, path: '');

  static const String name = 'AttachmentsRoute';
}

/// generated route for
/// [_i30.PhotoViewPage]
class PhotoViewPageeRouter extends _i9.PageRouteInfo<PhotoViewPageeRouterArgs> {
  PhotoViewPageeRouter({_i32.Key? key, required String path})
      : super(PhotoViewPageeRouter.name,
            path: 'photo_view_page',
            args: PhotoViewPageeRouterArgs(key: key, path: path));

  static const String name = 'PhotoViewPageeRouter';
}

class PhotoViewPageeRouterArgs {
  const PhotoViewPageeRouterArgs({this.key, required this.path});

  final _i32.Key? key;

  final String path;

  @override
  String toString() {
    return 'PhotoViewPageeRouterArgs{key: $key, path: $path}';
  }
}

/// generated route for
/// [_i31.PdfViewerPage]
class PdfViewerPageRouter extends _i9.PageRouteInfo<PdfViewerPageRouterArgs> {
  PdfViewerPageRouter({_i32.Key? key, required String paht})
      : super(PdfViewerPageRouter.name,
            path: 'pdf_view_page',
            args: PdfViewerPageRouterArgs(key: key, paht: paht));

  static const String name = 'PdfViewerPageRouter';
}

class PdfViewerPageRouterArgs {
  const PdfViewerPageRouterArgs({this.key, required this.paht});

  final _i32.Key? key;

  final String paht;

  @override
  String toString() {
    return 'PdfViewerPageRouterArgs{key: $key, paht: $paht}';
  }
}
