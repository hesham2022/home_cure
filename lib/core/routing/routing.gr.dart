// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

import 'package:agora_rtc_engine/rtc_engine.dart' as _i45;
import 'package:auto_route/auto_route.dart' as _i11;
import 'package:flutter/material.dart' as _i44;

import '../../features/aboutus_contactus/presentation/pages/about_us.dart'
    as _i14;
import '../../features/agore/video_page.dart' as _i4;
import '../../features/appointement/domain/entities/appointment.dart' as _i47;
import '../../features/appointement/presentation/pages/create_appointement.dart'
    as _i17;
import '../../features/appointement/presentation/pages/create_appointment_for.dart'
    as _i21;
import '../../features/appointement/presentation/pages/create_appointment_payment.dart'
    as _i22;
import '../../features/appointement/presentation/pages/create_appointment_second.dart'
    as _i18;
import '../../features/appointement/presentation/pages/create_appointment_third.dart'
    as _i20;
import '../../features/appointement/presentation/pages/done_page.dart' as _i23;
import '../../features/appointement/presentation/pages/web_view_page.dart'
    as _i19;
import '../../features/authentication/data/models/user_model.dart' as _i49;
import '../../features/authentication/domain/entities/entities.dart' as _i50;
import '../../features/calling/presentation/pages/calling_page.dart' as _i12;
import '../../features/home/domain/entities/service.dart' as _i46;
import '../../features/home/presentation/pages/home.dart' as _i15;
import '../../features/login/presentation/pages/choose_language_page.dart'
    as _i9;
import '../../features/login/presentation/pages/forget_password.dart' as _i6;
import '../../features/login/presentation/pages/login_page.dart' as _i3;
import '../../features/login/presentation/pages/reqgister_page.dart' as _i5;
import '../../features/login/presentation/pages/resret_password_page.dart'
    as _i8;
import '../../features/login/presentation/pages/splash_screen.dart' as _i1;
import '../../features/login/presentation/pages/varication_code_page.dart'
    as _i7;
import '../../features/notifications/presentation/pages/appointment_details_page.dart'
    as _i27;
import '../../features/notifications/presentation/pages/notifications_page.dart'
    as _i26;
import '../../features/notifications/presentation/pages/user_information_page.dart'
    as _i40;
import '../../features/our_doctors/pages/doctor_profile.dart' as _i25;
import '../../features/our_doctors/pages/doctors_page.dart' as _i24;
import '../../features/provider/presentation/pages/appointment_details_page_adpter.dart'
    as _i39;
import '../../features/provider/presentation/pages/main_provider_page.dart'
    as _i10;
import '../../features/provider/presentation/pages/provider_home.dart' as _i38;
import '../../features/provider/presentation/pages/provider_notifications_page.dart'
    as _i43;
import '../../features/provider/presentation/pages/provider_qualifications_page.dart'
    as _i42;
import '../../features/provider/presentation/pages/provider_setting_page.dart'
    as _i41;
import '../../features/Services/presentation/pages/services_page.dart' as _i16;
import '../../features/setting/presentation/pages/setting_page.dart' as _i30;
import '../../features/user_details/data/models/medical_model.dart' as _i48;
import '../../features/user_details/presentation/pages/allergy_page.dart'
    as _i34;
import '../../features/user_details/presentation/pages/attachments_page.dart'
    as _i37;
import '../../features/user_details/presentation/pages/chronic_deseases_page.dart'
    as _i32;
import '../../features/user_details/presentation/pages/current_medications.dart'
    as _i31;
import '../../features/user_details/presentation/pages/main_complaintment_page.dart'
    as _i33;
import '../../features/user_details/presentation/pages/pdf_viewer_page.dart'
    as _i29;
import '../../features/user_details/presentation/pages/photo_view_page.dart'
    as _i28;
import '../../features/user_details/presentation/pages/previous_sergerious_page.dart'
    as _i35;
import '../../features/user_details/presentation/pages/user_details_page.dart'
    as _i13;
import '../../features/user_details/presentation/widgets/shared_list.dart'
    as _i36;
import '../widgets/main_scaffold.dart' as _i2;

class AppRouter extends _i11.RootStackRouter {
  AppRouter([_i44.GlobalKey<_i44.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i11.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i11.CustomPage<void>(
          routeData: routeData,
          child: const _i1.SplashScreen(),
          transitionsBuilder: _i11.TransitionsBuilders.noTransition,
          opaque: true,
          barrierDismissible: false);
    },
    MainScaffold.name: (routeData) {
      return _i11.CupertinoPageX<void>(
          routeData: routeData, child: const _i2.MainScaffold());
    },
    LoginPagePageRouter.name: (routeData) {
      return _i11.CupertinoPageX<void>(
          routeData: routeData, child: const _i3.LoginPage());
    },
    VideoPageeRouter.name: (routeData) {
      final args = routeData.argsAs<VideoPageeRouterArgs>();
      return _i11.CupertinoPageX<void>(
          routeData: routeData,
          child: _i4.VideoPage(
              key: args.key,
              channelName: args.channelName,
              role: args.role,
              token: args.token));
    },
    RegisterPagePageRouter.name: (routeData) {
      return _i11.CupertinoPageX<void>(
          routeData: routeData, child: const _i5.RegisterPage());
    },
    ForgotPasswordPageRouter.name: (routeData) {
      return _i11.CupertinoPageX<void>(
          routeData: routeData, child: const _i6.ForgotPasswordPage());
    },
    VaricationCodePageRouter.name: (routeData) {
      return _i11.CupertinoPageX<void>(
          routeData: routeData, child: const _i7.VaricationCodePage());
    },
    ReserPasswordPageRouter.name: (routeData) {
      return _i11.CupertinoPageX<void>(
          routeData: routeData, child: const _i8.ReserPasswordPage());
    },
    ChooseLanguagePageRouter.name: (routeData) {
      return _i11.CupertinoPageX<void>(
          routeData: routeData, child: const _i9.ChooseLanguagePage());
    },
    MainProviderRouter.name: (routeData) {
      return _i11.CupertinoPageX<void>(
          routeData: routeData, child: const _i10.MainProviderPage());
    },
    HomeRouter.name: (routeData) {
      return _i11.CustomPage<void>(
          routeData: routeData,
          child: const _i11.EmptyRouterPage(),
          transitionsBuilder: _i11.TransitionsBuilders.slideTop,
          opaque: true,
          barrierDismissible: true);
    },
    NotificationsRouter.name: (routeData) {
      return _i11.CustomPage<void>(
          routeData: routeData,
          child: const _i11.EmptyRouterPage(),
          transitionsBuilder: _i11.TransitionsBuilders.slideTop,
          opaque: true,
          barrierDismissible: true);
    },
    CallingRouter.name: (routeData) {
      return _i11.CupertinoPageX<void>(
          routeData: routeData, child: const _i12.CallingPage());
    },
    UserDetailsPageRouter.name: (routeData) {
      return _i11.CupertinoPageX<void>(
          routeData: routeData, child: const _i13.UserDetailsPage());
    },
    AboutUsPageRouter.name: (routeData) {
      return _i11.CupertinoPageX<void>(
          routeData: routeData, child: const _i14.AboutUs());
    },
    SettingPagePageRouter.name: (routeData) {
      return _i11.CustomPage<void>(
          routeData: routeData,
          child: const _i11.EmptyRouterPage(),
          transitionsBuilder: _i11.TransitionsBuilders.slideTop,
          opaque: true,
          barrierDismissible: false);
    },
    HomeScreen.name: (routeData) {
      return _i11.CustomPage<void>(
          routeData: routeData,
          child: const _i15.HomeScreen(),
          transitionsBuilder: _i11.TransitionsBuilders.slideTop,
          opaque: true,
          barrierDismissible: true);
    },
    ServicesRoute.name: (routeData) {
      final args = routeData.argsAs<ServicesRouteArgs>();
      return _i11.CustomPage<void>(
          routeData: routeData,
          child: _i16.ServicesPage(key: args.key, service: args.service),
          transitionsBuilder: _i11.TransitionsBuilders.slideTop,
          opaque: true,
          barrierDismissible: true);
    },
    CreateAppointementRoute.name: (routeData) {
      final args = routeData.argsAs<CreateAppointementRouteArgs>();
      return _i11.CustomPage<void>(
          routeData: routeData,
          child: _i17.CreateAppointementPage(
              key: args.key,
              service: args.service,
              customPrice: args.customPrice),
          transitionsBuilder: _i11.TransitionsBuilders.slideTop,
          opaque: true,
          barrierDismissible: true);
    },
    CreateAppointementSecondRoute.name: (routeData) {
      final args = routeData.argsAs<CreateAppointementSecondRouteArgs>();
      return _i11.CustomPage<void>(
          routeData: routeData,
          child: _i18.CreateAppointementSecondPage(
              key: args.key, service: args.service),
          transitionsBuilder: _i11.TransitionsBuilders.slideTop,
          opaque: true,
          barrierDismissible: true);
    },
    WebViewPaymentRoute.name: (routeData) {
      final args = routeData.argsAs<WebViewPaymentRouteArgs>();
      return _i11.CustomPage<void>(
          routeData: routeData,
          child: _i19.WebViewPaymentPage(
              key: args.key,
              title: args.title,
              url: args.url,
              isPayment: args.isPayment,
              callbackPayment: args.callbackPayment),
          transitionsBuilder: _i11.TransitionsBuilders.slideTop,
          opaque: true,
          barrierDismissible: true);
    },
    CreateAppointementThirdRoute.name: (routeData) {
      final args = routeData.argsAs<CreateAppointementThirdRouteArgs>();
      return _i11.CustomPage<void>(
          routeData: routeData,
          child: _i20.CreateAppointementThirdPage(
              key: args.key, service: args.service, period: args.period),
          transitionsBuilder: _i11.TransitionsBuilders.slideTop,
          opaque: true,
          barrierDismissible: true);
    },
    CreateAppointementFourthRoute.name: (routeData) {
      final args = routeData.argsAs<CreateAppointementFourthRouteArgs>();
      return _i11.CustomPage<void>(
          routeData: routeData,
          child: _i21.CreateAppointementFourthPage(
              key: args.key, service: args.service),
          transitionsBuilder: _i11.TransitionsBuilders.slideTop,
          opaque: true,
          barrierDismissible: true);
    },
    CreateAppointmentPayment.name: (routeData) {
      final args = routeData.argsAs<CreateAppointmentPaymentArgs>();
      return _i11.CustomPage<void>(
          routeData: routeData,
          child: _i22.CreateAppointmentPayment(
              key: args.key, service: args.service),
          transitionsBuilder: _i11.TransitionsBuilders.slideTop,
          opaque: true,
          barrierDismissible: true);
    },
    DoneRoute.name: (routeData) {
      return _i11.CustomPage<void>(
          routeData: routeData,
          child: const _i23.DonePage(),
          transitionsBuilder: _i11.TransitionsBuilders.slideTop,
          opaque: true,
          barrierDismissible: true);
    },
    DoctorsRoute.name: (routeData) {
      return _i11.CustomPage<void>(
          routeData: routeData,
          child: const _i24.DoctorsPage(),
          transitionsBuilder: _i11.TransitionsBuilders.slideTop,
          opaque: true,
          barrierDismissible: true);
    },
    DoctorProfile.name: (routeData) {
      return _i11.CustomPage<void>(
          routeData: routeData,
          child: const _i25.DoctorProfile(),
          transitionsBuilder: _i11.TransitionsBuilders.slideTop,
          opaque: true,
          barrierDismissible: true);
    },
    NotificationsRoute.name: (routeData) {
      return _i11.CupertinoPageX<void>(
          routeData: routeData, child: const _i26.NotificationsPage());
    },
    AppointmentDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<AppointmentDetailsPageRouteArgs>();
      return _i11.CupertinoPageX<void>(
          routeData: routeData,
          child: _i27.AppointmentDetailsPage(
              key: args.key, appointment: args.appointment));
    },
    PhotoViewPageeRouter.name: (routeData) {
      final args = routeData.argsAs<PhotoViewPageeRouterArgs>();
      return _i11.CupertinoPageX<void>(
          routeData: routeData,
          child: _i28.PhotoViewPage(key: args.key, path: args.path));
    },
    PdfViewerPageRouter.name: (routeData) {
      final args = routeData.argsAs<PdfViewerPageRouterArgs>();
      return _i11.CupertinoPageX<void>(
          routeData: routeData,
          child: _i29.PdfViewerPage(key: args.key, paht: args.paht));
    },
    SettingRoute.name: (routeData) {
      return _i11.CupertinoPageX<void>(
          routeData: routeData, child: const _i30.SettingPage());
    },
    CurrentMedicationsPageRouter.name: (routeData) {
      return _i11.CupertinoPageX<void>(
          routeData: routeData, child: const _i31.CurrentMedicationsPage());
    },
    ChronicDiseasesPageouter.name: (routeData) {
      return _i11.CupertinoPageX<void>(
          routeData: routeData, child: const _i32.ChronicDiseasesPagePage());
    },
    MainComplainmentPageRouter.name: (routeData) {
      return _i11.CupertinoPageX<void>(
          routeData: routeData, child: const _i33.MainComplainmentPage());
    },
    AllergyPageRouter.name: (routeData) {
      return _i11.CupertinoPageX<void>(
          routeData: routeData, child: const _i34.AllergyPagePage());
    },
    PreviousSurgeriesPageRouter.name: (routeData) {
      return _i11.CupertinoPageX<void>(
          routeData: routeData, child: const _i35.PreviousSurgeriesPage());
    },
    SharedListRouter.name: (routeData) {
      final args = routeData.argsAs<SharedListRouterArgs>();
      return _i11.CupertinoPageX<void>(
          routeData: routeData,
          child: _i36.SharedList(
              key: args.key,
              title: args.title,
              subTitle: args.subTitle,
              list: args.list,
              onSubmit: args.onSubmit,
              onEdit: args.onEdit));
    },
    AttachmentsPageRouter.name: (routeData) {
      return _i11.CupertinoPageX<void>(
          routeData: routeData, child: const _i11.EmptyRouterPage());
    },
    AttachmentsRoute.name: (routeData) {
      final args = routeData.argsAs<AttachmentsRouteArgs>(
          orElse: () => const AttachmentsRouteArgs());
      return _i11.CupertinoPageX<void>(
          routeData: routeData,
          child: _i37.AttachmentsPage(
              key: args.key, attachments: args.attachments));
    },
    ProviderHomeRouter.name: (routeData) {
      return _i11.CupertinoPageX<void>(
          routeData: routeData, child: const _i11.EmptyRouterScreen());
    },
    ProviderSettingRouter.name: (routeData) {
      return _i11.CupertinoPageX<void>(
          routeData: routeData, child: const _i11.EmptyRouterScreen());
    },
    ProviderNotificationsRouter.name: (routeData) {
      return _i11.CupertinoPageX<void>(
          routeData: routeData, child: const _i11.EmptyRouterPage());
    },
    ProviderHome.name: (routeData) {
      return _i11.CupertinoPageX<void>(
          routeData: routeData, child: const _i38.ProviderHome());
    },
    AppointmentDetailsPageAdpterRoute.name: (routeData) {
      final args = routeData.argsAs<AppointmentDetailsPageAdpterRouteArgs>();
      return _i11.CupertinoPageX<void>(
          routeData: routeData,
          child: _i39.AppointmentDetailsPageAdpter(
              key: args.key, appointment: args.appointment));
    },
    UserInformationPageRoute.name: (routeData) {
      final args = routeData.argsAs<UserInformationPageRouteArgs>();
      return _i11.CupertinoPageX<void>(
          routeData: routeData,
          child: _i40.UserInformationPage(key: args.key, user: args.user));
    },
    AttachmentsPageRouter2.name: (routeData) {
      final args = routeData.argsAs<AttachmentsPageRouter2Args>(
          orElse: () => const AttachmentsPageRouter2Args());
      return _i11.CupertinoPageX<void>(
          routeData: routeData,
          child: _i37.AttachmentsPage(
              key: args.key, attachments: args.attachments));
    },
    UserInformationRoute.name: (routeData) {
      final args = routeData.argsAs<UserInformationRouteArgs>();
      return _i11.CupertinoPageX<void>(
          routeData: routeData,
          child: _i40.UserInformationPage(key: args.key, user: args.user));
    },
    ProviderSettingRoute.name: (routeData) {
      return _i11.CupertinoPageX<void>(
          routeData: routeData, child: const _i41.ProviderSettingPage());
    },
    ProviderQualificationsRouter.name: (routeData) {
      return _i11.CupertinoPageX<void>(
          routeData: routeData, child: const _i42.ProviderQualificationsPage());
    },
    ProviderNotificationsRoute.name: (routeData) {
      return _i11.CupertinoPageX<void>(
          routeData: routeData, child: const _i43.ProviderNotificationsPage());
    }
  };

  @override
  List<_i11.RouteConfig> get routes => [
        _i11.RouteConfig(SplashScreen.name, path: '/'),
        _i11.RouteConfig(MainScaffold.name, path: 'main', children: [
          _i11.RouteConfig(HomeRouter.name,
              path: 'home',
              parent: MainScaffold.name,
              children: [
                _i11.RouteConfig(HomeScreen.name,
                    path: '', parent: HomeRouter.name),
                _i11.RouteConfig(ServicesRoute.name,
                    path: 'services', parent: HomeRouter.name),
                _i11.RouteConfig(CreateAppointementRoute.name,
                    path: 'create_appointement', parent: HomeRouter.name),
                _i11.RouteConfig(CreateAppointementSecondRoute.name,
                    path: 'create_appointement_second',
                    parent: HomeRouter.name),
                _i11.RouteConfig(WebViewPaymentRoute.name,
                    path: 'webview_payment', parent: HomeRouter.name),
                _i11.RouteConfig(CreateAppointementThirdRoute.name,
                    path: 'create_appointement_third', parent: HomeRouter.name),
                _i11.RouteConfig(CreateAppointementFourthRoute.name,
                    path: 'create_appointement_fourth',
                    parent: HomeRouter.name),
                _i11.RouteConfig(CreateAppointmentPayment.name,
                    path: 'create_appointement_payment',
                    parent: HomeRouter.name),
                _i11.RouteConfig(DoneRoute.name,
                    path: 'done_page', parent: HomeRouter.name),
                _i11.RouteConfig(DoctorsRoute.name,
                    path: 'doctors_page', parent: HomeRouter.name),
                _i11.RouteConfig(DoctorProfile.name,
                    path: 'doctor_profile', parent: HomeRouter.name)
              ]),
          _i11.RouteConfig(NotificationsRouter.name,
              path: 'notification',
              parent: MainScaffold.name,
              children: [
                _i11.RouteConfig(NotificationsRoute.name,
                    path: '', parent: NotificationsRouter.name),
                _i11.RouteConfig(AppointmentDetailsPageRoute.name,
                    path: 'appointment_details',
                    parent: NotificationsRouter.name),
                _i11.RouteConfig(WebViewPaymentRoute.name,
                    path: 'webview_payment', parent: NotificationsRouter.name),
                _i11.RouteConfig(PhotoViewPageeRouter.name,
                    path: 'photo_view_page', parent: NotificationsRouter.name),
                _i11.RouteConfig(PdfViewerPageRouter.name,
                    path: 'pdf_view_page', parent: NotificationsRouter.name)
              ]),
          _i11.RouteConfig(CallingRouter.name,
              path: 'calling', parent: MainScaffold.name),
          _i11.RouteConfig(UserDetailsPageRouter.name,
              path: 'user_details', parent: MainScaffold.name),
          _i11.RouteConfig(AboutUsPageRouter.name,
              path: 'about_us', parent: MainScaffold.name),
          _i11.RouteConfig(SettingPagePageRouter.name,
              path: 'setting',
              parent: MainScaffold.name,
              children: [
                _i11.RouteConfig(SettingRoute.name,
                    path: '', parent: SettingPagePageRouter.name),
                _i11.RouteConfig(UserDetailsPageRouter.name,
                    path: 'user_details', parent: SettingPagePageRouter.name),
                _i11.RouteConfig(CurrentMedicationsPageRouter.name,
                    path: 'current_medications',
                    parent: SettingPagePageRouter.name),
                _i11.RouteConfig(ChronicDiseasesPageouter.name,
                    path: 'chornic_deseases',
                    parent: SettingPagePageRouter.name),
                _i11.RouteConfig(MainComplainmentPageRouter.name,
                    path: 'complaiments', parent: SettingPagePageRouter.name),
                _i11.RouteConfig(AllergyPageRouter.name,
                    path: 'chornic_deseases',
                    parent: SettingPagePageRouter.name),
                _i11.RouteConfig(PreviousSurgeriesPageRouter.name,
                    path: 'previous_surgeriesPage',
                    parent: SettingPagePageRouter.name),
                _i11.RouteConfig(SharedListRouter.name,
                    path: 'shared_list', parent: SettingPagePageRouter.name),
                _i11.RouteConfig(AttachmentsPageRouter.name,
                    path: 'attachments_page',
                    parent: SettingPagePageRouter.name,
                    children: [
                      _i11.RouteConfig(AttachmentsRoute.name,
                          path: '', parent: AttachmentsPageRouter.name),
                      _i11.RouteConfig(PhotoViewPageeRouter.name,
                          path: 'photo_view_page',
                          parent: AttachmentsPageRouter.name),
                      _i11.RouteConfig(PdfViewerPageRouter.name,
                          path: 'pdf_view_page',
                          parent: AttachmentsPageRouter.name)
                    ])
              ])
        ]),
        _i11.RouteConfig(LoginPagePageRouter.name, path: 'login'),
        _i11.RouteConfig(VideoPageeRouter.name, path: 'video_page'),
        _i11.RouteConfig(RegisterPagePageRouter.name, path: 'register'),
        _i11.RouteConfig(ForgotPasswordPageRouter.name,
            path: 'forgot_password_page'),
        _i11.RouteConfig(VaricationCodePageRouter.name,
            path: 'varication_code_page'),
        _i11.RouteConfig(ReserPasswordPageRouter.name,
            path: 'reser_password_page'),
        _i11.RouteConfig(ChooseLanguagePageRouter.name,
            path: 'choose_language_page'),
        _i11.RouteConfig(MainProviderRouter.name,
            path: 'main_provider',
            children: [
              _i11.RouteConfig(ProviderHomeRouter.name,
                  path: 'provider_home',
                  parent: MainProviderRouter.name,
                  children: [
                    _i11.RouteConfig(ProviderHome.name,
                        path: '', parent: ProviderHomeRouter.name),
                    _i11.RouteConfig(AppointmentDetailsPageAdpterRoute.name,
                        path: 'appointment_etails_pageAdpter',
                        parent: ProviderHomeRouter.name),
                    _i11.RouteConfig(UserInformationPageRoute.name,
                        path: 'user_inforation_page',
                        parent: ProviderHomeRouter.name,
                        children: [
                          _i11.RouteConfig(UserInformationRoute.name,
                              path: '', parent: UserInformationPageRoute.name)
                        ]),
                    _i11.RouteConfig(AttachmentsPageRouter2.name,
                        path: 'attachments_page2',
                        parent: ProviderHomeRouter.name),
                    _i11.RouteConfig(PhotoViewPageeRouter.name,
                        path: 'photo_view_page',
                        parent: ProviderHomeRouter.name),
                    _i11.RouteConfig(PdfViewerPageRouter.name,
                        path: 'pdf_view_page', parent: ProviderHomeRouter.name)
                  ]),
              _i11.RouteConfig(ProviderSettingRouter.name,
                  path: 'provider_settings',
                  parent: MainProviderRouter.name,
                  children: [
                    _i11.RouteConfig(ProviderSettingRoute.name,
                        path: '', parent: ProviderSettingRouter.name),
                    _i11.RouteConfig(ProviderQualificationsRouter.name,
                        path: 'provider_qualifications',
                        parent: ProviderSettingRouter.name),
                    _i11.RouteConfig(PhotoViewPageeRouter.name,
                        path: 'photo_view_page',
                        parent: ProviderSettingRouter.name),
                    _i11.RouteConfig(PdfViewerPageRouter.name,
                        path: 'pdf_view_page',
                        parent: ProviderSettingRouter.name)
                  ]),
              _i11.RouteConfig(ProviderNotificationsRouter.name,
                  path: 'provider_notifications',
                  parent: MainProviderRouter.name,
                  children: [
                    _i11.RouteConfig(ProviderNotificationsRoute.name,
                        path: '', parent: ProviderNotificationsRouter.name),
                    _i11.RouteConfig(AppointmentDetailsPageAdpterRoute.name,
                        path: 'appointment_etails_pageAdpter',
                        parent: ProviderNotificationsRouter.name),
                    _i11.RouteConfig(UserInformationPageRoute.name,
                        path: 'user_inforation_page',
                        parent: ProviderNotificationsRouter.name),
                    _i11.RouteConfig(AttachmentsPageRouter2.name,
                        path: 'attachments_page2',
                        parent: ProviderNotificationsRouter.name),
                    _i11.RouteConfig(PhotoViewPageeRouter.name,
                        path: 'photo_view_page',
                        parent: ProviderNotificationsRouter.name),
                    _i11.RouteConfig(PdfViewerPageRouter.name,
                        path: 'pdf_view_page',
                        parent: ProviderNotificationsRouter.name)
                  ])
            ])
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i11.PageRouteInfo<void> {
  const SplashScreen() : super(SplashScreen.name, path: '/');

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.MainScaffold]
class MainScaffold extends _i11.PageRouteInfo<void> {
  const MainScaffold({List<_i11.PageRouteInfo>? children})
      : super(MainScaffold.name, path: 'main', initialChildren: children);

  static const String name = 'MainScaffold';
}

/// generated route for
/// [_i3.LoginPage]
class LoginPagePageRouter extends _i11.PageRouteInfo<void> {
  const LoginPagePageRouter() : super(LoginPagePageRouter.name, path: 'login');

  static const String name = 'LoginPagePageRouter';
}

/// generated route for
/// [_i4.VideoPage]
class VideoPageeRouter extends _i11.PageRouteInfo<VideoPageeRouterArgs> {
  VideoPageeRouter(
      {_i44.Key? key,
      String? channelName,
      _i45.ClientRole? role = _i45.ClientRole.Broadcaster,
      required String token})
      : super(VideoPageeRouter.name,
            path: 'video_page',
            args: VideoPageeRouterArgs(
                key: key, channelName: channelName, role: role, token: token));

  static const String name = 'VideoPageeRouter';
}

class VideoPageeRouterArgs {
  const VideoPageeRouterArgs(
      {this.key,
      this.channelName,
      this.role = _i45.ClientRole.Broadcaster,
      required this.token});

  final _i44.Key? key;

  final String? channelName;

  final _i45.ClientRole? role;

  final String token;

  @override
  String toString() {
    return 'VideoPageeRouterArgs{key: $key, channelName: $channelName, role: $role, token: $token}';
  }
}

/// generated route for
/// [_i5.RegisterPage]
class RegisterPagePageRouter extends _i11.PageRouteInfo<void> {
  const RegisterPagePageRouter()
      : super(RegisterPagePageRouter.name, path: 'register');

  static const String name = 'RegisterPagePageRouter';
}

/// generated route for
/// [_i6.ForgotPasswordPage]
class ForgotPasswordPageRouter extends _i11.PageRouteInfo<void> {
  const ForgotPasswordPageRouter()
      : super(ForgotPasswordPageRouter.name, path: 'forgot_password_page');

  static const String name = 'ForgotPasswordPageRouter';
}

/// generated route for
/// [_i7.VaricationCodePage]
class VaricationCodePageRouter extends _i11.PageRouteInfo<void> {
  const VaricationCodePageRouter()
      : super(VaricationCodePageRouter.name, path: 'varication_code_page');

  static const String name = 'VaricationCodePageRouter';
}

/// generated route for
/// [_i8.ReserPasswordPage]
class ReserPasswordPageRouter extends _i11.PageRouteInfo<void> {
  const ReserPasswordPageRouter()
      : super(ReserPasswordPageRouter.name, path: 'reser_password_page');

  static const String name = 'ReserPasswordPageRouter';
}

/// generated route for
/// [_i9.ChooseLanguagePage]
class ChooseLanguagePageRouter extends _i11.PageRouteInfo<void> {
  const ChooseLanguagePageRouter()
      : super(ChooseLanguagePageRouter.name, path: 'choose_language_page');

  static const String name = 'ChooseLanguagePageRouter';
}

/// generated route for
/// [_i10.MainProviderPage]
class MainProviderRouter extends _i11.PageRouteInfo<void> {
  const MainProviderRouter({List<_i11.PageRouteInfo>? children})
      : super(MainProviderRouter.name,
            path: 'main_provider', initialChildren: children);

  static const String name = 'MainProviderRouter';
}

/// generated route for
/// [_i11.EmptyRouterPage]
class HomeRouter extends _i11.PageRouteInfo<void> {
  const HomeRouter({List<_i11.PageRouteInfo>? children})
      : super(HomeRouter.name, path: 'home', initialChildren: children);

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i11.EmptyRouterPage]
class NotificationsRouter extends _i11.PageRouteInfo<void> {
  const NotificationsRouter({List<_i11.PageRouteInfo>? children})
      : super(NotificationsRouter.name,
            path: 'notification', initialChildren: children);

  static const String name = 'NotificationsRouter';
}

/// generated route for
/// [_i12.CallingPage]
class CallingRouter extends _i11.PageRouteInfo<void> {
  const CallingRouter() : super(CallingRouter.name, path: 'calling');

  static const String name = 'CallingRouter';
}

/// generated route for
/// [_i13.UserDetailsPage]
class UserDetailsPageRouter extends _i11.PageRouteInfo<void> {
  const UserDetailsPageRouter()
      : super(UserDetailsPageRouter.name, path: 'user_details');

  static const String name = 'UserDetailsPageRouter';
}

/// generated route for
/// [_i14.AboutUs]
class AboutUsPageRouter extends _i11.PageRouteInfo<void> {
  const AboutUsPageRouter() : super(AboutUsPageRouter.name, path: 'about_us');

  static const String name = 'AboutUsPageRouter';
}

/// generated route for
/// [_i11.EmptyRouterPage]
class SettingPagePageRouter extends _i11.PageRouteInfo<void> {
  const SettingPagePageRouter({List<_i11.PageRouteInfo>? children})
      : super(SettingPagePageRouter.name,
            path: 'setting', initialChildren: children);

  static const String name = 'SettingPagePageRouter';
}

/// generated route for
/// [_i15.HomeScreen]
class HomeScreen extends _i11.PageRouteInfo<void> {
  const HomeScreen() : super(HomeScreen.name, path: '');

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i16.ServicesPage]
class ServicesRoute extends _i11.PageRouteInfo<ServicesRouteArgs> {
  ServicesRoute({_i44.Key? key, required _i46.ServiceEntity service})
      : super(ServicesRoute.name,
            path: 'services',
            args: ServicesRouteArgs(key: key, service: service));

  static const String name = 'ServicesRoute';
}

class ServicesRouteArgs {
  const ServicesRouteArgs({this.key, required this.service});

  final _i44.Key? key;

  final _i46.ServiceEntity service;

  @override
  String toString() {
    return 'ServicesRouteArgs{key: $key, service: $service}';
  }
}

/// generated route for
/// [_i17.CreateAppointementPage]
class CreateAppointementRoute
    extends _i11.PageRouteInfo<CreateAppointementRouteArgs> {
  CreateAppointementRoute(
      {_i44.Key? key, required _i46.ServiceEntity service, double? customPrice})
      : super(CreateAppointementRoute.name,
            path: 'create_appointement',
            args: CreateAppointementRouteArgs(
                key: key, service: service, customPrice: customPrice));

  static const String name = 'CreateAppointementRoute';
}

class CreateAppointementRouteArgs {
  const CreateAppointementRouteArgs(
      {this.key, required this.service, this.customPrice});

  final _i44.Key? key;

  final _i46.ServiceEntity service;

  final double? customPrice;

  @override
  String toString() {
    return 'CreateAppointementRouteArgs{key: $key, service: $service, customPrice: $customPrice}';
  }
}

/// generated route for
/// [_i18.CreateAppointementSecondPage]
class CreateAppointementSecondRoute
    extends _i11.PageRouteInfo<CreateAppointementSecondRouteArgs> {
  CreateAppointementSecondRoute(
      {_i44.Key? key, required _i46.ServiceEntity service})
      : super(CreateAppointementSecondRoute.name,
            path: 'create_appointement_second',
            args:
                CreateAppointementSecondRouteArgs(key: key, service: service));

  static const String name = 'CreateAppointementSecondRoute';
}

class CreateAppointementSecondRouteArgs {
  const CreateAppointementSecondRouteArgs({this.key, required this.service});

  final _i44.Key? key;

  final _i46.ServiceEntity service;

  @override
  String toString() {
    return 'CreateAppointementSecondRouteArgs{key: $key, service: $service}';
  }
}

/// generated route for
/// [_i19.WebViewPaymentPage]
class WebViewPaymentRoute extends _i11.PageRouteInfo<WebViewPaymentRouteArgs> {
  WebViewPaymentRoute(
      {_i44.Key? key,
      required String title,
      required String url,
      bool isPayment = false,
      required void Function(String) callbackPayment})
      : super(WebViewPaymentRoute.name,
            path: 'webview_payment',
            args: WebViewPaymentRouteArgs(
                key: key,
                title: title,
                url: url,
                isPayment: isPayment,
                callbackPayment: callbackPayment));

  static const String name = 'WebViewPaymentRoute';
}

class WebViewPaymentRouteArgs {
  const WebViewPaymentRouteArgs(
      {this.key,
      required this.title,
      required this.url,
      this.isPayment = false,
      required this.callbackPayment});

  final _i44.Key? key;

  final String title;

  final String url;

  final bool isPayment;

  final void Function(String) callbackPayment;

  @override
  String toString() {
    return 'WebViewPaymentRouteArgs{key: $key, title: $title, url: $url, isPayment: $isPayment, callbackPayment: $callbackPayment}';
  }
}

/// generated route for
/// [_i20.CreateAppointementThirdPage]
class CreateAppointementThirdRoute
    extends _i11.PageRouteInfo<CreateAppointementThirdRouteArgs> {
  CreateAppointementThirdRoute(
      {_i44.Key? key,
      required _i46.ServiceEntity service,
      _i18.EveningMorning? period})
      : super(CreateAppointementThirdRoute.name,
            path: 'create_appointement_third',
            args: CreateAppointementThirdRouteArgs(
                key: key, service: service, period: period));

  static const String name = 'CreateAppointementThirdRoute';
}

class CreateAppointementThirdRouteArgs {
  const CreateAppointementThirdRouteArgs(
      {this.key, required this.service, this.period});

  final _i44.Key? key;

  final _i46.ServiceEntity service;

  final _i18.EveningMorning? period;

  @override
  String toString() {
    return 'CreateAppointementThirdRouteArgs{key: $key, service: $service, period: $period}';
  }
}

/// generated route for
/// [_i21.CreateAppointementFourthPage]
class CreateAppointementFourthRoute
    extends _i11.PageRouteInfo<CreateAppointementFourthRouteArgs> {
  CreateAppointementFourthRoute(
      {_i44.Key? key, required _i46.ServiceEntity service})
      : super(CreateAppointementFourthRoute.name,
            path: 'create_appointement_fourth',
            args:
                CreateAppointementFourthRouteArgs(key: key, service: service));

  static const String name = 'CreateAppointementFourthRoute';
}

class CreateAppointementFourthRouteArgs {
  const CreateAppointementFourthRouteArgs({this.key, required this.service});

  final _i44.Key? key;

  final _i46.ServiceEntity service;

  @override
  String toString() {
    return 'CreateAppointementFourthRouteArgs{key: $key, service: $service}';
  }
}

/// generated route for
/// [_i22.CreateAppointmentPayment]
class CreateAppointmentPayment
    extends _i11.PageRouteInfo<CreateAppointmentPaymentArgs> {
  CreateAppointmentPayment({_i44.Key? key, required _i46.ServiceEntity service})
      : super(CreateAppointmentPayment.name,
            path: 'create_appointement_payment',
            args: CreateAppointmentPaymentArgs(key: key, service: service));

  static const String name = 'CreateAppointmentPayment';
}

class CreateAppointmentPaymentArgs {
  const CreateAppointmentPaymentArgs({this.key, required this.service});

  final _i44.Key? key;

  final _i46.ServiceEntity service;

  @override
  String toString() {
    return 'CreateAppointmentPaymentArgs{key: $key, service: $service}';
  }
}

/// generated route for
/// [_i23.DonePage]
class DoneRoute extends _i11.PageRouteInfo<void> {
  const DoneRoute() : super(DoneRoute.name, path: 'done_page');

  static const String name = 'DoneRoute';
}

/// generated route for
/// [_i24.DoctorsPage]
class DoctorsRoute extends _i11.PageRouteInfo<void> {
  const DoctorsRoute() : super(DoctorsRoute.name, path: 'doctors_page');

  static const String name = 'DoctorsRoute';
}

/// generated route for
/// [_i25.DoctorProfile]
class DoctorProfile extends _i11.PageRouteInfo<void> {
  const DoctorProfile() : super(DoctorProfile.name, path: 'doctor_profile');

  static const String name = 'DoctorProfile';
}

/// generated route for
/// [_i26.NotificationsPage]
class NotificationsRoute extends _i11.PageRouteInfo<void> {
  const NotificationsRoute() : super(NotificationsRoute.name, path: '');

  static const String name = 'NotificationsRoute';
}

/// generated route for
/// [_i27.AppointmentDetailsPage]
class AppointmentDetailsPageRoute
    extends _i11.PageRouteInfo<AppointmentDetailsPageRouteArgs> {
  AppointmentDetailsPageRoute(
      {_i44.Key? key, required _i47.Appointment appointment})
      : super(AppointmentDetailsPageRoute.name,
            path: 'appointment_details',
            args: AppointmentDetailsPageRouteArgs(
                key: key, appointment: appointment));

  static const String name = 'AppointmentDetailsPageRoute';
}

class AppointmentDetailsPageRouteArgs {
  const AppointmentDetailsPageRouteArgs({this.key, required this.appointment});

  final _i44.Key? key;

  final _i47.Appointment appointment;

  @override
  String toString() {
    return 'AppointmentDetailsPageRouteArgs{key: $key, appointment: $appointment}';
  }
}

/// generated route for
/// [_i28.PhotoViewPage]
class PhotoViewPageeRouter
    extends _i11.PageRouteInfo<PhotoViewPageeRouterArgs> {
  PhotoViewPageeRouter({_i44.Key? key, required String path})
      : super(PhotoViewPageeRouter.name,
            path: 'photo_view_page',
            args: PhotoViewPageeRouterArgs(key: key, path: path));

  static const String name = 'PhotoViewPageeRouter';
}

class PhotoViewPageeRouterArgs {
  const PhotoViewPageeRouterArgs({this.key, required this.path});

  final _i44.Key? key;

  final String path;

  @override
  String toString() {
    return 'PhotoViewPageeRouterArgs{key: $key, path: $path}';
  }
}

/// generated route for
/// [_i29.PdfViewerPage]
class PdfViewerPageRouter extends _i11.PageRouteInfo<PdfViewerPageRouterArgs> {
  PdfViewerPageRouter({_i44.Key? key, required String paht})
      : super(PdfViewerPageRouter.name,
            path: 'pdf_view_page',
            args: PdfViewerPageRouterArgs(key: key, paht: paht));

  static const String name = 'PdfViewerPageRouter';
}

class PdfViewerPageRouterArgs {
  const PdfViewerPageRouterArgs({this.key, required this.paht});

  final _i44.Key? key;

  final String paht;

  @override
  String toString() {
    return 'PdfViewerPageRouterArgs{key: $key, paht: $paht}';
  }
}

/// generated route for
/// [_i30.SettingPage]
class SettingRoute extends _i11.PageRouteInfo<void> {
  const SettingRoute() : super(SettingRoute.name, path: '');

  static const String name = 'SettingRoute';
}

/// generated route for
/// [_i31.CurrentMedicationsPage]
class CurrentMedicationsPageRouter extends _i11.PageRouteInfo<void> {
  const CurrentMedicationsPageRouter()
      : super(CurrentMedicationsPageRouter.name, path: 'current_medications');

  static const String name = 'CurrentMedicationsPageRouter';
}

/// generated route for
/// [_i32.ChronicDiseasesPagePage]
class ChronicDiseasesPageouter extends _i11.PageRouteInfo<void> {
  const ChronicDiseasesPageouter()
      : super(ChronicDiseasesPageouter.name, path: 'chornic_deseases');

  static const String name = 'ChronicDiseasesPageouter';
}

/// generated route for
/// [_i33.MainComplainmentPage]
class MainComplainmentPageRouter extends _i11.PageRouteInfo<void> {
  const MainComplainmentPageRouter()
      : super(MainComplainmentPageRouter.name, path: 'complaiments');

  static const String name = 'MainComplainmentPageRouter';
}

/// generated route for
/// [_i34.AllergyPagePage]
class AllergyPageRouter extends _i11.PageRouteInfo<void> {
  const AllergyPageRouter()
      : super(AllergyPageRouter.name, path: 'chornic_deseases');

  static const String name = 'AllergyPageRouter';
}

/// generated route for
/// [_i35.PreviousSurgeriesPage]
class PreviousSurgeriesPageRouter extends _i11.PageRouteInfo<void> {
  const PreviousSurgeriesPageRouter()
      : super(PreviousSurgeriesPageRouter.name, path: 'previous_surgeriesPage');

  static const String name = 'PreviousSurgeriesPageRouter';
}

/// generated route for
/// [_i36.SharedList]
class SharedListRouter extends _i11.PageRouteInfo<SharedListRouterArgs> {
  SharedListRouter(
      {_i44.Key? key,
      required String title,
      required String subTitle,
      required List<_i48.MediaclModel> list,
      required dynamic Function(List<_i48.MediaclModel>) onSubmit,
      required dynamic Function(List<_i48.MediaclModel>) onEdit})
      : super(SharedListRouter.name,
            path: 'shared_list',
            args: SharedListRouterArgs(
                key: key,
                title: title,
                subTitle: subTitle,
                list: list,
                onSubmit: onSubmit,
                onEdit: onEdit));

  static const String name = 'SharedListRouter';
}

class SharedListRouterArgs {
  const SharedListRouterArgs(
      {this.key,
      required this.title,
      required this.subTitle,
      required this.list,
      required this.onSubmit,
      required this.onEdit});

  final _i44.Key? key;

  final String title;

  final String subTitle;

  final List<_i48.MediaclModel> list;

  final dynamic Function(List<_i48.MediaclModel>) onSubmit;

  final dynamic Function(List<_i48.MediaclModel>) onEdit;

  @override
  String toString() {
    return 'SharedListRouterArgs{key: $key, title: $title, subTitle: $subTitle, list: $list, onSubmit: $onSubmit, onEdit: $onEdit}';
  }
}

/// generated route for
/// [_i11.EmptyRouterPage]
class AttachmentsPageRouter extends _i11.PageRouteInfo<void> {
  const AttachmentsPageRouter({List<_i11.PageRouteInfo>? children})
      : super(AttachmentsPageRouter.name,
            path: 'attachments_page', initialChildren: children);

  static const String name = 'AttachmentsPageRouter';
}

/// generated route for
/// [_i37.AttachmentsPage]
class AttachmentsRoute extends _i11.PageRouteInfo<AttachmentsRouteArgs> {
  AttachmentsRoute({_i44.Key? key, List<_i49.Attachment>? attachments})
      : super(AttachmentsRoute.name,
            path: '',
            args: AttachmentsRouteArgs(key: key, attachments: attachments));

  static const String name = 'AttachmentsRoute';
}

class AttachmentsRouteArgs {
  const AttachmentsRouteArgs({this.key, this.attachments});

  final _i44.Key? key;

  final List<_i49.Attachment>? attachments;

  @override
  String toString() {
    return 'AttachmentsRouteArgs{key: $key, attachments: $attachments}';
  }
}

/// generated route for
/// [_i11.EmptyRouterScreen]
class ProviderHomeRouter extends _i11.PageRouteInfo<void> {
  const ProviderHomeRouter({List<_i11.PageRouteInfo>? children})
      : super(ProviderHomeRouter.name,
            path: 'provider_home', initialChildren: children);

  static const String name = 'ProviderHomeRouter';
}

/// generated route for
/// [_i11.EmptyRouterScreen]
class ProviderSettingRouter extends _i11.PageRouteInfo<void> {
  const ProviderSettingRouter({List<_i11.PageRouteInfo>? children})
      : super(ProviderSettingRouter.name,
            path: 'provider_settings', initialChildren: children);

  static const String name = 'ProviderSettingRouter';
}

/// generated route for
/// [_i11.EmptyRouterPage]
class ProviderNotificationsRouter extends _i11.PageRouteInfo<void> {
  const ProviderNotificationsRouter({List<_i11.PageRouteInfo>? children})
      : super(ProviderNotificationsRouter.name,
            path: 'provider_notifications', initialChildren: children);

  static const String name = 'ProviderNotificationsRouter';
}

/// generated route for
/// [_i38.ProviderHome]
class ProviderHome extends _i11.PageRouteInfo<void> {
  const ProviderHome() : super(ProviderHome.name, path: '');

  static const String name = 'ProviderHome';
}

/// generated route for
/// [_i39.AppointmentDetailsPageAdpter]
class AppointmentDetailsPageAdpterRoute
    extends _i11.PageRouteInfo<AppointmentDetailsPageAdpterRouteArgs> {
  AppointmentDetailsPageAdpterRoute(
      {_i44.Key? key, required _i47.Appointment appointment})
      : super(AppointmentDetailsPageAdpterRoute.name,
            path: 'appointment_etails_pageAdpter',
            args: AppointmentDetailsPageAdpterRouteArgs(
                key: key, appointment: appointment));

  static const String name = 'AppointmentDetailsPageAdpterRoute';
}

class AppointmentDetailsPageAdpterRouteArgs {
  const AppointmentDetailsPageAdpterRouteArgs(
      {this.key, required this.appointment});

  final _i44.Key? key;

  final _i47.Appointment appointment;

  @override
  String toString() {
    return 'AppointmentDetailsPageAdpterRouteArgs{key: $key, appointment: $appointment}';
  }
}

/// generated route for
/// [_i40.UserInformationPage]
class UserInformationPageRoute
    extends _i11.PageRouteInfo<UserInformationPageRouteArgs> {
  UserInformationPageRoute({_i44.Key? key, required _i50.User user})
      : super(UserInformationPageRoute.name,
            path: 'user_inforation_page',
            args: UserInformationPageRouteArgs(key: key, user: user));

  static const String name = 'UserInformationPageRoute';
}

class UserInformationPageRouteArgs {
  const UserInformationPageRouteArgs({this.key, required this.user});

  final _i44.Key? key;

  final _i50.User user;

  @override
  String toString() {
    return 'UserInformationPageRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i37.AttachmentsPage]
class AttachmentsPageRouter2
    extends _i11.PageRouteInfo<AttachmentsPageRouter2Args> {
  AttachmentsPageRouter2({_i44.Key? key, List<_i49.Attachment>? attachments})
      : super(AttachmentsPageRouter2.name,
            path: 'attachments_page2',
            args:
                AttachmentsPageRouter2Args(key: key, attachments: attachments));

  static const String name = 'AttachmentsPageRouter2';
}

class AttachmentsPageRouter2Args {
  const AttachmentsPageRouter2Args({this.key, this.attachments});

  final _i44.Key? key;

  final List<_i49.Attachment>? attachments;

  @override
  String toString() {
    return 'AttachmentsPageRouter2Args{key: $key, attachments: $attachments}';
  }
}

/// generated route for
/// [_i40.UserInformationPage]
class UserInformationRoute
    extends _i11.PageRouteInfo<UserInformationRouteArgs> {
  UserInformationRoute({_i44.Key? key, required _i50.User user})
      : super(UserInformationRoute.name,
            path: '', args: UserInformationRouteArgs(key: key, user: user));

  static const String name = 'UserInformationRoute';
}

class UserInformationRouteArgs {
  const UserInformationRouteArgs({this.key, required this.user});

  final _i44.Key? key;

  final _i50.User user;

  @override
  String toString() {
    return 'UserInformationRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i41.ProviderSettingPage]
class ProviderSettingRoute extends _i11.PageRouteInfo<void> {
  const ProviderSettingRoute() : super(ProviderSettingRoute.name, path: '');

  static const String name = 'ProviderSettingRoute';
}

/// generated route for
/// [_i42.ProviderQualificationsPage]
class ProviderQualificationsRouter extends _i11.PageRouteInfo<void> {
  const ProviderQualificationsRouter()
      : super(ProviderQualificationsRouter.name,
            path: 'provider_qualifications');

  static const String name = 'ProviderQualificationsRouter';
}

/// generated route for
/// [_i43.ProviderNotificationsPage]
class ProviderNotificationsRoute extends _i11.PageRouteInfo<void> {
  const ProviderNotificationsRoute()
      : super(ProviderNotificationsRoute.name, path: '');

  static const String name = 'ProviderNotificationsRoute';
}
