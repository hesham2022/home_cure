// **************************************************************************
// AutoRouteGenerator
// **************************************************************************

// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// AutoRouteGenerator
// **************************************************************************
//
// ignore_for_file: type=lint

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:auto_route/auto_route.dart' as _i55;
import 'package:flutter/material.dart' as _i56;

import '../../features/aboutus_contactus/presentation/pages/about_us.dart'
    as _i25;
import '../../features/aboutus_contactus/presentation/pages/pricavy.dart'
    as _i41;
import '../../features/agore/video_page.dart' as _i10;
import '../../features/appointement/domain/entities/appointment.dart' as _i57;
import '../../features/appointement/presentation/pages/create_appointement.dart'
    as _i28;
import '../../features/appointement/presentation/pages/create_appointment_for.dart'
    as _i32;
import '../../features/appointement/presentation/pages/create_appointment_payment.dart'
    as _i33;
import '../../features/appointement/presentation/pages/create_appointment_second.dart'
    as _i30;
import '../../features/appointement/presentation/pages/create_appointment_third.dart'
    as _i31;
import '../../features/appointement/presentation/pages/done_page.dart' as _i35;
import '../../features/appointement/presentation/pages/web_view_page.dart'
    as _i2;
import '../../features/authentication/data/models/user_model.dart' as _i61;
import '../../features/authentication/domain/entities/entities.dart' as _i59;
import '../../features/calling/presentation/pages/calling_page.dart' as _i23;
import '../../features/home/domain/entities/service.dart' as _i58;
import '../../features/home/presentation/pages/home.dart' as _i26;
import '../../features/login/presentation/pages/change_phone_number.dart'
    as _i14;
import '../../features/login/presentation/pages/change_phone_number_firebase.dart'
    as _i5;
import '../../features/login/presentation/pages/choose_language_page.dart'
    as _i20;
import '../../features/login/presentation/pages/forget_password.dart' as _i12;
import '../../features/login/presentation/pages/forget_password_firebase.dart'
    as _i13;
import '../../features/login/presentation/pages/login_page.dart' as _i9;
import '../../features/login/presentation/pages/otp_firebase.dart' as _i4;
import '../../features/login/presentation/pages/reqgister_page.dart' as _i11;
import '../../features/login/presentation/pages/reset_password_firebase.dart'
    as _i19;
import '../../features/login/presentation/pages/resret_password_page.dart'
    as _i18;
import '../../features/login/presentation/pages/send_otp_page.dart' as _i7;
import '../../features/login/presentation/pages/splash_screen.dart' as _i1;
import '../../features/login/presentation/pages/varication_code_page.dart'
    as _i15;
import '../../features/login/presentation/pages/verify_change_phone_page%20copy.dart'
    as _i17;
import '../../features/login/presentation/pages/verify_code_firebase.dart'
    as _i16;
import '../../features/login/presentation/pages/verify_otp_page.dart' as _i3;
import '../../features/login/presentation/pages/verify_phone_number_firebase.dart'
    as _i6;
import '../../features/notifications/presentation/pages/appointment_details_page.dart'
    as _i34;
import '../../features/notifications/presentation/pages/notifications_page.dart'
    as _i38;
import '../../features/notifications/presentation/pages/user_information_page.dart'
    as _i51;
import '../../features/our_doctors/pages/doctor_profile.dart' as _i37;
import '../../features/our_doctors/pages/doctors_page.dart' as _i36;
import '../../features/provider/presentation/pages/appointment_details_page_adpter.dart'
    as _i50;
import '../../features/provider/presentation/pages/main_provider_page.dart'
    as _i21;
import '../../features/provider/presentation/pages/provider_home.dart' as _i49;
import '../../features/provider/presentation/pages/provider_notifications_page.dart'
    as _i54;
import '../../features/provider/presentation/pages/provider_qualifications_page.dart'
    as _i53;
import '../../features/provider/presentation/pages/provider_setting_page.dart'
    as _i52;
import '../../features/Services/presentation/pages/services_page.dart' as _i27;
import '../../features/setting/presentation/pages/setting_page.dart' as _i40;
import '../../features/user_details/data/models/medical_model.dart' as _i60;
import '../../features/user_details/presentation/pages/allergy_page.dart'
    as _i45;
import '../../features/user_details/presentation/pages/attachments_page.dart'
    as _i48;
import '../../features/user_details/presentation/pages/chronic_deseases_page.dart'
    as _i43;
import '../../features/user_details/presentation/pages/current_medications.dart'
    as _i42;
import '../../features/user_details/presentation/pages/main_complaintment_page.dart'
    as _i44;
import '../../features/user_details/presentation/pages/pdf_viewer_page.dart'
    as _i39;
import '../../features/user_details/presentation/pages/photo_view_page.dart'
    as _i29;
import '../../features/user_details/presentation/pages/previous_sergerious_page.dart'
    as _i46;
import '../../features/user_details/presentation/pages/user_details_page.dart'
    as _i24;
import '../../features/user_details/presentation/widgets/shared_list.dart'
    as _i47;
import '../widgets/main_scaffold.dart' as _i8;
import 'routing.dart' as _i22;

class AppRouter extends _i55.RootStackRouter {
  AppRouter([_i56.GlobalKey<_i56.NavigatorState>? navigatorKey])
      : super(navigatorKey);

  @override
  final Map<String, _i55.PageFactory> pagesMap = {
    SplashScreen.name: (routeData) {
      return _i55.CustomPage<void>(
        routeData: routeData,
        child: const _i1.SplashScreen(),
        transitionsBuilder: _i55.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    WebViewPaymentRoute.name: (routeData) {
      final args = routeData.argsAs<WebViewPaymentRouteArgs>();
      return _i55.CustomPage<void>(
        routeData: routeData,
        child: _i2.WebViewPaymentPage(
          key: args.key,
          title: args.title,
          url: args.url,
          isPayment: args.isPayment,
          callbackPayment: args.callbackPayment,
        ),
        transitionsBuilder: _i55.TransitionsBuilders.slideTop,
        opaque: true,
        barrierDismissible: true,
      );
    },
    VaricationOtpPageRoute.name: (routeData) {
      return _i55.CustomPage<void>(
        routeData: routeData,
        child: const _i3.VaricationOtpPage(),
        transitionsBuilder: _i55.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    OtpFirebasePagePageRoute.name: (routeData) {
      return _i55.CustomPage<void>(
        routeData: routeData,
        child: const _i4.OtpFirebasePage(),
        transitionsBuilder: _i55.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    ChangePhoneNumberFirebasePageRoute.name: (routeData) {
      return _i55.CustomPage<void>(
        routeData: routeData,
        child: const _i5.ChangePhoneNumberFirebasePage(),
        transitionsBuilder: _i55.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    VerifyChangePhoneNumberFirebasePageRoute.name: (routeData) {
      return _i55.CustomPage<void>(
        routeData: routeData,
        child: const _i6.VerifyChangePhoneNumberFirebasePage(),
        transitionsBuilder: _i55.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    SendOtpPageRoute.name: (routeData) {
      return _i55.CustomPage<void>(
        routeData: routeData,
        child: const _i7.SendOtpPage(),
        transitionsBuilder: _i55.TransitionsBuilders.noTransition,
        opaque: true,
        barrierDismissible: false,
      );
    },
    MainScaffold.name: (routeData) {
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: const _i8.MainScaffold(),
      );
    },
    LoginPagePageRouter.name: (routeData) {
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: const _i9.LoginPage(),
      );
    },
    VideoPageeRouter.name: (routeData) {
      final args = routeData.argsAs<VideoPageeRouterArgs>();
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: _i10.Call(
          key: args.key,
          uid: args.uid,
          token: args.token,
          channelName: args.channelName,
        ),
      );
    },
    RegisterPagePageRouter.name: (routeData) {
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: const _i11.RegisterPage(),
      );
    },
    ForgotPasswordPageRouter.name: (routeData) {
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: const _i12.ForgotPasswordPage(),
      );
    },
    ForgotPasswordFirebasePageRouter.name: (routeData) {
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: const _i13.ForgetPasswordFirebasePage(),
      );
    },
    ChangePhoneNumberPageRouter.name: (routeData) {
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: const _i14.ChangePhoneNumberPage(),
      );
    },
    VaricationCodePageRouter.name: (routeData) {
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: const _i15.VaricationCodePage(),
      );
    },
    VaricationCodeFirebasePageRouter.name: (routeData) {
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: const _i16.VaricationCodeFirebasePage(),
      );
    },
    VerifyChangePhoneNumberPageRouter.name: (routeData) {
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: const _i17.VerifyChangePhoneNumberPage(),
      );
    },
    ReserPasswordPageRouter.name: (routeData) {
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: const _i18.ReserPasswordPage(),
      );
    },
    ReserPasswordFirebasePageRouter.name: (routeData) {
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: const _i19.ReserPasswordFirebasePage(),
      );
    },
    ChooseLanguagePageRouter.name: (routeData) {
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: const _i20.ChooseLanguagePage(),
      );
    },
    MainProviderRouter.name: (routeData) {
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: const _i21.MainProviderPage(),
      );
    },
    HomeRouter.name: (routeData) {
      return _i55.CustomPage<void>(
        routeData: routeData,
        child: const _i22.EmptyRouterPage(),
        transitionsBuilder: _i55.TransitionsBuilders.slideTop,
        opaque: true,
        barrierDismissible: true,
      );
    },
    NotificationsRouter.name: (routeData) {
      return _i55.CustomPage<void>(
        routeData: routeData,
        child: const _i22.EmptyRouterPage(),
        transitionsBuilder: _i55.TransitionsBuilders.slideTop,
        opaque: true,
        barrierDismissible: true,
      );
    },
    CallingRouter.name: (routeData) {
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: const _i23.CallingPage(),
      );
    },
    UserDetailsPageRouter.name: (routeData) {
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: const _i24.UserDetailsPage(),
      );
    },
    AboutUsPageRouter.name: (routeData) {
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: const _i25.AboutUs(),
      );
    },
    SettingPagePageRouter.name: (routeData) {
      return _i55.CustomPage<void>(
        routeData: routeData,
        child: const _i22.EmptyRouterPage(),
        transitionsBuilder: _i55.TransitionsBuilders.slideTop,
        opaque: true,
        barrierDismissible: false,
      );
    },
    HomeScreen.name: (routeData) {
      return _i55.CustomPage<void>(
        routeData: routeData,
        child: const _i26.HomeScreen(),
        transitionsBuilder: _i55.TransitionsBuilders.slideTop,
        opaque: true,
        barrierDismissible: true,
      );
    },
    ServicesRoute.name: (routeData) {
      final args = routeData.argsAs<ServicesRouteArgs>();
      return _i55.CustomPage<void>(
        routeData: routeData,
        child: _i27.ServicesPage(
          key: args.key,
          service: args.service,
        ),
        transitionsBuilder: _i55.TransitionsBuilders.slideTop,
        opaque: true,
        barrierDismissible: true,
      );
    },
    CreateAppointementRoute.name: (routeData) {
      final args = routeData.argsAs<CreateAppointementRouteArgs>();
      return _i55.CustomPage<void>(
        routeData: routeData,
        child: _i28.CreateAppointementPage(
          key: args.key,
          service: args.service,
          customPrice: args.customPrice,
        ),
        transitionsBuilder: _i55.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: true,
      );
    },
    PhotoViewPageeRouter.name: (routeData) {
      final args = routeData.argsAs<PhotoViewPageeRouterArgs>();
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: _i29.PhotoViewPage(
          key: args.key,
          path: args.path,
          provider: args.provider,
        ),
      );
    },
    CreateAppointementSecondRoute.name: (routeData) {
      final args = routeData.argsAs<CreateAppointementSecondRouteArgs>();
      return _i55.CustomPage<void>(
        routeData: routeData,
        child: _i30.CreateAppointementSecondPage(
          key: args.key,
          service: args.service,
        ),
        transitionsBuilder: _i55.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: true,
      );
    },
    CreateAppointementThirdRoute.name: (routeData) {
      final args = routeData.argsAs<CreateAppointementThirdRouteArgs>();
      return _i55.CustomPage<void>(
        routeData: routeData,
        child: _i31.CreateAppointementThirdPage(
          key: args.key,
          service: args.service,
          period: args.period,
        ),
        transitionsBuilder: _i55.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: true,
      );
    },
    CreateAppointementFourthRoute.name: (routeData) {
      final args = routeData.argsAs<CreateAppointementFourthRouteArgs>();
      return _i55.CustomPage<void>(
        routeData: routeData,
        child: _i32.CreateAppointementFourthPage(
          key: args.key,
          service: args.service,
        ),
        transitionsBuilder: _i55.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: true,
      );
    },
    CreateAppointmentPayment.name: (routeData) {
      final args = routeData.argsAs<CreateAppointmentPaymentArgs>();
      return _i55.CustomPage<void>(
        routeData: routeData,
        child: _i33.CreateAppointmentPayment(
          key: args.key,
          service: args.service,
        ),
        transitionsBuilder: _i55.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: true,
      );
    },
    AppointmenCompletePayPageRoute.name: (routeData) {
      final args = routeData.argsAs<AppointmenCompletePayPageRouteArgs>();
      return _i55.CupertinoPageX<_i57.Appointment>(
        routeData: routeData,
        child: _i34.AppointmentDetailsPage(
          key: args.key,
          appointment: args.appointment,
        ),
      );
    },
    DoneRoute.name: (routeData) {
      return _i55.CustomPage<void>(
        routeData: routeData,
        child: const _i35.DonePage(),
        transitionsBuilder: _i55.TransitionsBuilders.slideLeft,
        opaque: true,
        barrierDismissible: true,
      );
    },
    DoctorsRoute.name: (routeData) {
      final args = routeData.argsAs<DoctorsRouteArgs>();
      return _i55.CustomPage<void>(
        routeData: routeData,
        child: _i36.DoctorsPage(
          key: args.key,
          service: args.service,
        ),
        transitionsBuilder: _i55.TransitionsBuilders.slideTop,
        opaque: true,
        barrierDismissible: true,
      );
    },
    DoctorProfile.name: (routeData) {
      final args = routeData.argsAs<DoctorProfileArgs>();
      return _i55.CustomPage<void>(
        routeData: routeData,
        child: _i37.DoctorProfile(
          key: args.key,
          user: args.user,
        ),
        transitionsBuilder: _i55.TransitionsBuilders.slideTop,
        opaque: true,
        barrierDismissible: true,
      );
    },
    NotificationsRoute.name: (routeData) {
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: const _i38.NotificationsPage(),
      );
    },
    AppointmentDetailsPageRoute.name: (routeData) {
      final args = routeData.argsAs<AppointmentDetailsPageRouteArgs>();
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: _i34.AppointmentDetailsPage(
          key: args.key,
          appointment: args.appointment,
        ),
      );
    },
    PdfViewerPageRouter.name: (routeData) {
      final args = routeData.argsAs<PdfViewerPageRouterArgs>();
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: _i39.PdfViewerPage(
          key: args.key,
          paht: args.paht,
        ),
      );
    },
    SettingRoute.name: (routeData) {
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: const _i40.SettingPage(),
      );
    },
    PrivacyPageRouter.name: (routeData) {
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: const _i41.Privacy(),
      );
    },
    CurrentMedicationsPageRouter.name: (routeData) {
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: const _i42.CurrentMedicationsPage(),
      );
    },
    ChronicDiseasesPageouter.name: (routeData) {
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: const _i43.ChronicDiseasesPagePage(),
      );
    },
    MainComplainmentPageRouter.name: (routeData) {
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: const _i44.MainComplainmentPage(),
      );
    },
    AllergyPageRouter.name: (routeData) {
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: const _i45.AllergyPagePage(),
      );
    },
    PreviousSurgeriesPageRouter.name: (routeData) {
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: const _i46.PreviousSurgeriesPage(),
      );
    },
    SharedListRouter.name: (routeData) {
      final args = routeData.argsAs<SharedListRouterArgs>();
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: _i47.SharedList(
          key: args.key,
          title: args.title,
          subTitle: args.subTitle,
          list: args.list,
          onSubmit: args.onSubmit,
          onEdit: args.onEdit,
          hint: args.hint,
        ),
      );
    },
    AttachmentsPageRouter.name: (routeData) {
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: const _i22.EmptyRouterPage(),
      );
    },
    AttachmentsRoute.name: (routeData) {
      final args = routeData.argsAs<AttachmentsRouteArgs>(
          orElse: () => const AttachmentsRouteArgs());
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: _i48.AttachmentsPage(
          key: args.key,
          attachments: args.attachments,
        ),
      );
    },
    ProviderHomeRouter.name: (routeData) {
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: const _i22.EmptyRouterScreen(),
      );
    },
    ProviderSettingRouter.name: (routeData) {
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: const _i22.EmptyRouterScreen(),
      );
    },
    ProviderNotificationsRouter.name: (routeData) {
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: const _i22.EmptyRouterPage(),
      );
    },
    ProviderHome.name: (routeData) {
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: const _i49.ProviderHome(),
      );
    },
    AppointmentDetailsPageAdpterRoute.name: (routeData) {
      final args = routeData.argsAs<AppointmentDetailsPageAdpterRouteArgs>();
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: _i50.AppointmentDetailsPageAdpter(
          key: args.key,
          appointment: args.appointment,
        ),
      );
    },
    UserInformationPageRoute.name: (routeData) {
      final args = routeData.argsAs<UserInformationPageRouteArgs>();
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: _i51.UserInformationPage(
          key: args.key,
          user: args.user,
        ),
      );
    },
    AttachmentsPageRouter2.name: (routeData) {
      final args = routeData.argsAs<AttachmentsPageRouter2Args>(
          orElse: () => const AttachmentsPageRouter2Args());
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: _i48.AttachmentsPage(
          key: args.key,
          attachments: args.attachments,
        ),
      );
    },
    UserInformationRoute.name: (routeData) {
      final args = routeData.argsAs<UserInformationRouteArgs>();
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: _i51.UserInformationPage(
          key: args.key,
          user: args.user,
        ),
      );
    },
    ProviderSettingRoute.name: (routeData) {
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: const _i52.ProviderSettingPage(),
      );
    },
    ProviderQualificationsRouter.name: (routeData) {
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: const _i53.ProviderQualificationsPage(),
      );
    },
    ProviderNotificationsRoute.name: (routeData) {
      return _i55.CupertinoPageX<void>(
        routeData: routeData,
        child: const _i54.ProviderNotificationsPage(),
      );
    },
  };

  @override
  List<_i55.RouteConfig> get routes => [
        _i55.RouteConfig(
          SplashScreen.name,
          path: '/',
        ),
        _i55.RouteConfig(
          WebViewPaymentRoute.name,
          path: 'webview_payment',
        ),
        _i55.RouteConfig(
          VaricationOtpPageRoute.name,
          path: 'verify_otp_page',
        ),
        _i55.RouteConfig(
          OtpFirebasePagePageRoute.name,
          path: 'otp_firebase_page',
        ),
        _i55.RouteConfig(
          ChangePhoneNumberFirebasePageRoute.name,
          path: 'change_phoneNumber_firebase_page',
        ),
        _i55.RouteConfig(
          VerifyChangePhoneNumberFirebasePageRoute.name,
          path: 'verify_change_phoneNumber_firebasePage',
        ),
        _i55.RouteConfig(
          SendOtpPageRoute.name,
          path: 'send_otp_page',
        ),
        _i55.RouteConfig(
          MainScaffold.name,
          path: 'main',
          children: [
            _i55.RouteConfig(
              HomeRouter.name,
              path: 'home',
              parent: MainScaffold.name,
              children: [
                _i55.RouteConfig(
                  HomeScreen.name,
                  path: '',
                  parent: HomeRouter.name,
                ),
                _i55.RouteConfig(
                  ServicesRoute.name,
                  path: 'services',
                  parent: HomeRouter.name,
                ),
                _i55.RouteConfig(
                  CreateAppointementRoute.name,
                  path: 'create_appointement',
                  parent: HomeRouter.name,
                ),
                _i55.RouteConfig(
                  PhotoViewPageeRouter.name,
                  path: 'photo_view_page',
                  parent: HomeRouter.name,
                ),
                _i55.RouteConfig(
                  CreateAppointementSecondRoute.name,
                  path: 'create_appointement_second',
                  parent: HomeRouter.name,
                ),
                _i55.RouteConfig(
                  CreateAppointementThirdRoute.name,
                  path: 'create_appointement_third',
                  parent: HomeRouter.name,
                ),
                _i55.RouteConfig(
                  CreateAppointementFourthRoute.name,
                  path: 'create_appointement_fourth',
                  parent: HomeRouter.name,
                ),
                _i55.RouteConfig(
                  CreateAppointmentPayment.name,
                  path: 'create_appointement_payment',
                  parent: HomeRouter.name,
                ),
                _i55.RouteConfig(
                  AppointmenCompletePayPageRoute.name,
                  path: 'appointment_details',
                  parent: HomeRouter.name,
                ),
                _i55.RouteConfig(
                  DoneRoute.name,
                  path: 'done_page',
                  parent: HomeRouter.name,
                ),
                _i55.RouteConfig(
                  DoctorsRoute.name,
                  path: 'doctors_page',
                  parent: HomeRouter.name,
                ),
                _i55.RouteConfig(
                  DoctorProfile.name,
                  path: 'doctor_profile',
                  parent: HomeRouter.name,
                ),
              ],
            ),
            _i55.RouteConfig(
              NotificationsRouter.name,
              path: 'notification',
              parent: MainScaffold.name,
              children: [
                _i55.RouteConfig(
                  NotificationsRoute.name,
                  path: '',
                  parent: NotificationsRouter.name,
                ),
                _i55.RouteConfig(
                  AppointmentDetailsPageRoute.name,
                  path: 'appointment_details',
                  parent: NotificationsRouter.name,
                ),
                _i55.RouteConfig(
                  PhotoViewPageeRouter.name,
                  path: 'photo_view_page',
                  parent: NotificationsRouter.name,
                ),
                _i55.RouteConfig(
                  PdfViewerPageRouter.name,
                  path: 'pdf_view_page',
                  parent: NotificationsRouter.name,
                ),
              ],
            ),
            _i55.RouteConfig(
              CallingRouter.name,
              path: 'calling',
              parent: MainScaffold.name,
            ),
            _i55.RouteConfig(
              UserDetailsPageRouter.name,
              path: 'user_details',
              parent: MainScaffold.name,
            ),
            _i55.RouteConfig(
              AboutUsPageRouter.name,
              path: 'about_us',
              parent: MainScaffold.name,
            ),
            _i55.RouteConfig(
              SettingPagePageRouter.name,
              path: 'setting',
              parent: MainScaffold.name,
              children: [
                _i55.RouteConfig(
                  SettingRoute.name,
                  path: '',
                  parent: SettingPagePageRouter.name,
                ),
                _i55.RouteConfig(
                  UserDetailsPageRouter.name,
                  path: 'user_details',
                  parent: SettingPagePageRouter.name,
                ),
                _i55.RouteConfig(
                  PrivacyPageRouter.name,
                  path: 'prrivacy',
                  parent: SettingPagePageRouter.name,
                ),
                _i55.RouteConfig(
                  CurrentMedicationsPageRouter.name,
                  path: 'current_medications',
                  parent: SettingPagePageRouter.name,
                ),
                _i55.RouteConfig(
                  ChronicDiseasesPageouter.name,
                  path: 'chornic_deseases',
                  parent: SettingPagePageRouter.name,
                ),
                _i55.RouteConfig(
                  MainComplainmentPageRouter.name,
                  path: 'complaiments',
                  parent: SettingPagePageRouter.name,
                ),
                _i55.RouteConfig(
                  AllergyPageRouter.name,
                  path: 'chornic_deseases',
                  parent: SettingPagePageRouter.name,
                ),
                _i55.RouteConfig(
                  PreviousSurgeriesPageRouter.name,
                  path: 'previous_surgeriesPage',
                  parent: SettingPagePageRouter.name,
                ),
                _i55.RouteConfig(
                  SharedListRouter.name,
                  path: 'shared_list',
                  parent: SettingPagePageRouter.name,
                ),
                _i55.RouteConfig(
                  AttachmentsPageRouter.name,
                  path: 'attachments_page',
                  parent: SettingPagePageRouter.name,
                  children: [
                    _i55.RouteConfig(
                      AttachmentsRoute.name,
                      path: '',
                      parent: AttachmentsPageRouter.name,
                    ),
                    _i55.RouteConfig(
                      PhotoViewPageeRouter.name,
                      path: 'photo_view_page',
                      parent: AttachmentsPageRouter.name,
                    ),
                    _i55.RouteConfig(
                      PdfViewerPageRouter.name,
                      path: 'pdf_view_page',
                      parent: AttachmentsPageRouter.name,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
        _i55.RouteConfig(
          LoginPagePageRouter.name,
          path: 'login',
        ),
        _i55.RouteConfig(
          VideoPageeRouter.name,
          path: 'video_page',
        ),
        _i55.RouteConfig(
          RegisterPagePageRouter.name,
          path: 'register',
        ),
        _i55.RouteConfig(
          ForgotPasswordPageRouter.name,
          path: 'forgot_password_page',
        ),
        _i55.RouteConfig(
          ForgotPasswordFirebasePageRouter.name,
          path: 'forgot_password_firebase_page',
        ),
        _i55.RouteConfig(
          ChangePhoneNumberPageRouter.name,
          path: 'change_phone_number_page',
        ),
        _i55.RouteConfig(
          VaricationCodePageRouter.name,
          path: 'varication_code_page',
        ),
        _i55.RouteConfig(
          VaricationCodeFirebasePageRouter.name,
          path: 'varication_code_firebase_page',
        ),
        _i55.RouteConfig(
          VerifyChangePhoneNumberPageRouter.name,
          path: 'varify_phone_number_page',
        ),
        _i55.RouteConfig(
          ReserPasswordPageRouter.name,
          path: 'reser_password_page',
        ),
        _i55.RouteConfig(
          ReserPasswordFirebasePageRouter.name,
          path: 'reser_password_firebase_page',
        ),
        _i55.RouteConfig(
          ChooseLanguagePageRouter.name,
          path: 'choose_language_page',
        ),
        _i55.RouteConfig(
          MainProviderRouter.name,
          path: 'main_provider',
          children: [
            _i55.RouteConfig(
              ProviderHomeRouter.name,
              path: 'provider_home',
              parent: MainProviderRouter.name,
              children: [
                _i55.RouteConfig(
                  ProviderHome.name,
                  path: '',
                  parent: ProviderHomeRouter.name,
                ),
                _i55.RouteConfig(
                  AppointmentDetailsPageAdpterRoute.name,
                  path: 'appointment_etails_pageAdpter',
                  parent: ProviderHomeRouter.name,
                ),
                _i55.RouteConfig(
                  UserInformationPageRoute.name,
                  path: 'user_inforation_page',
                  parent: ProviderHomeRouter.name,
                  children: [
                    _i55.RouteConfig(
                      UserInformationRoute.name,
                      path: '',
                      parent: UserInformationPageRoute.name,
                    )
                  ],
                ),
                _i55.RouteConfig(
                  AttachmentsPageRouter2.name,
                  path: 'attachments_page2',
                  parent: ProviderHomeRouter.name,
                ),
                _i55.RouteConfig(
                  PhotoViewPageeRouter.name,
                  path: 'photo_view_page',
                  parent: ProviderHomeRouter.name,
                ),
                _i55.RouteConfig(
                  PdfViewerPageRouter.name,
                  path: 'pdf_view_page',
                  parent: ProviderHomeRouter.name,
                ),
              ],
            ),
            _i55.RouteConfig(
              ProviderSettingRouter.name,
              path: 'provider_settings',
              parent: MainProviderRouter.name,
              children: [
                _i55.RouteConfig(
                  ProviderSettingRoute.name,
                  path: '',
                  parent: ProviderSettingRouter.name,
                ),
                _i55.RouteConfig(
                  ProviderQualificationsRouter.name,
                  path: 'provider_qualifications',
                  parent: ProviderSettingRouter.name,
                ),
                _i55.RouteConfig(
                  PhotoViewPageeRouter.name,
                  path: 'photo_view_page',
                  parent: ProviderSettingRouter.name,
                ),
                _i55.RouteConfig(
                  PdfViewerPageRouter.name,
                  path: 'pdf_view_page',
                  parent: ProviderSettingRouter.name,
                ),
              ],
            ),
            _i55.RouteConfig(
              ProviderNotificationsRouter.name,
              path: 'provider_notifications',
              parent: MainProviderRouter.name,
              children: [
                _i55.RouteConfig(
                  ProviderNotificationsRoute.name,
                  path: '',
                  parent: ProviderNotificationsRouter.name,
                ),
                _i55.RouteConfig(
                  AppointmentDetailsPageAdpterRoute.name,
                  path: 'appointment_etails_pageAdpter',
                  parent: ProviderNotificationsRouter.name,
                ),
                _i55.RouteConfig(
                  UserInformationPageRoute.name,
                  path: 'user_inforation_page',
                  parent: ProviderNotificationsRouter.name,
                ),
                _i55.RouteConfig(
                  AttachmentsPageRouter2.name,
                  path: 'attachments_page2',
                  parent: ProviderNotificationsRouter.name,
                ),
                _i55.RouteConfig(
                  PhotoViewPageeRouter.name,
                  path: 'photo_view_page',
                  parent: ProviderNotificationsRouter.name,
                ),
                _i55.RouteConfig(
                  PdfViewerPageRouter.name,
                  path: 'pdf_view_page',
                  parent: ProviderNotificationsRouter.name,
                ),
              ],
            ),
          ],
        ),
      ];
}

/// generated route for
/// [_i1.SplashScreen]
class SplashScreen extends _i55.PageRouteInfo<void> {
  const SplashScreen()
      : super(
          SplashScreen.name,
          path: '/',
        );

  static const String name = 'SplashScreen';
}

/// generated route for
/// [_i2.WebViewPaymentPage]
class WebViewPaymentRoute extends _i55.PageRouteInfo<WebViewPaymentRouteArgs> {
  WebViewPaymentRoute({
    _i56.Key? key,
    required String title,
    required String url,
    bool isPayment = false,
    required void Function(String) callbackPayment,
  }) : super(
          WebViewPaymentRoute.name,
          path: 'webview_payment',
          args: WebViewPaymentRouteArgs(
            key: key,
            title: title,
            url: url,
            isPayment: isPayment,
            callbackPayment: callbackPayment,
          ),
        );

  static const String name = 'WebViewPaymentRoute';
}

class WebViewPaymentRouteArgs {
  const WebViewPaymentRouteArgs({
    this.key,
    required this.title,
    required this.url,
    this.isPayment = false,
    required this.callbackPayment,
  });

  final _i56.Key? key;

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
/// [_i3.VaricationOtpPage]
class VaricationOtpPageRoute extends _i55.PageRouteInfo<void> {
  const VaricationOtpPageRoute()
      : super(
          VaricationOtpPageRoute.name,
          path: 'verify_otp_page',
        );

  static const String name = 'VaricationOtpPageRoute';
}

/// generated route for
/// [_i4.OtpFirebasePage]
class OtpFirebasePagePageRoute extends _i55.PageRouteInfo<void> {
  const OtpFirebasePagePageRoute()
      : super(
          OtpFirebasePagePageRoute.name,
          path: 'otp_firebase_page',
        );

  static const String name = 'OtpFirebasePagePageRoute';
}

/// generated route for
/// [_i5.ChangePhoneNumberFirebasePage]
class ChangePhoneNumberFirebasePageRoute extends _i55.PageRouteInfo<void> {
  const ChangePhoneNumberFirebasePageRoute()
      : super(
          ChangePhoneNumberFirebasePageRoute.name,
          path: 'change_phoneNumber_firebase_page',
        );

  static const String name = 'ChangePhoneNumberFirebasePageRoute';
}

/// generated route for
/// [_i6.VerifyChangePhoneNumberFirebasePage]
class VerifyChangePhoneNumberFirebasePageRoute
    extends _i55.PageRouteInfo<void> {
  const VerifyChangePhoneNumberFirebasePageRoute()
      : super(
          VerifyChangePhoneNumberFirebasePageRoute.name,
          path: 'verify_change_phoneNumber_firebasePage',
        );

  static const String name = 'VerifyChangePhoneNumberFirebasePageRoute';
}

/// generated route for
/// [_i7.SendOtpPage]
class SendOtpPageRoute extends _i55.PageRouteInfo<void> {
  const SendOtpPageRoute()
      : super(
          SendOtpPageRoute.name,
          path: 'send_otp_page',
        );

  static const String name = 'SendOtpPageRoute';
}

/// generated route for
/// [_i8.MainScaffold]
class MainScaffold extends _i55.PageRouteInfo<void> {
  const MainScaffold({List<_i55.PageRouteInfo>? children})
      : super(
          MainScaffold.name,
          path: 'main',
          initialChildren: children,
        );

  static const String name = 'MainScaffold';
}

/// generated route for
/// [_i9.LoginPage]
class LoginPagePageRouter extends _i55.PageRouteInfo<void> {
  const LoginPagePageRouter()
      : super(
          LoginPagePageRouter.name,
          path: 'login',
        );

  static const String name = 'LoginPagePageRouter';
}

/// generated route for
/// [_i10.Call]
class VideoPageeRouter extends _i55.PageRouteInfo<VideoPageeRouterArgs> {
  VideoPageeRouter({
    _i56.Key? key,
    required int uid,
    required String token,
    required String channelName,
  }) : super(
          VideoPageeRouter.name,
          path: 'video_page',
          args: VideoPageeRouterArgs(
            key: key,
            uid: uid,
            token: token,
            channelName: channelName,
          ),
        );

  static const String name = 'VideoPageeRouter';
}

class VideoPageeRouterArgs {
  const VideoPageeRouterArgs({
    this.key,
    required this.uid,
    required this.token,
    required this.channelName,
  });

  final _i56.Key? key;

  final int uid;

  final String token;

  final String channelName;

  @override
  String toString() {
    return 'VideoPageeRouterArgs{key: $key, uid: $uid, token: $token, channelName: $channelName}';
  }
}

/// generated route for
/// [_i11.RegisterPage]
class RegisterPagePageRouter extends _i55.PageRouteInfo<void> {
  const RegisterPagePageRouter()
      : super(
          RegisterPagePageRouter.name,
          path: 'register',
        );

  static const String name = 'RegisterPagePageRouter';
}

/// generated route for
/// [_i12.ForgotPasswordPage]
class ForgotPasswordPageRouter extends _i55.PageRouteInfo<void> {
  const ForgotPasswordPageRouter()
      : super(
          ForgotPasswordPageRouter.name,
          path: 'forgot_password_page',
        );

  static const String name = 'ForgotPasswordPageRouter';
}

/// generated route for
/// [_i13.ForgetPasswordFirebasePage]
class ForgotPasswordFirebasePageRouter extends _i55.PageRouteInfo<void> {
  const ForgotPasswordFirebasePageRouter()
      : super(
          ForgotPasswordFirebasePageRouter.name,
          path: 'forgot_password_firebase_page',
        );

  static const String name = 'ForgotPasswordFirebasePageRouter';
}

/// generated route for
/// [_i14.ChangePhoneNumberPage]
class ChangePhoneNumberPageRouter extends _i55.PageRouteInfo<void> {
  const ChangePhoneNumberPageRouter()
      : super(
          ChangePhoneNumberPageRouter.name,
          path: 'change_phone_number_page',
        );

  static const String name = 'ChangePhoneNumberPageRouter';
}

/// generated route for
/// [_i15.VaricationCodePage]
class VaricationCodePageRouter extends _i55.PageRouteInfo<void> {
  const VaricationCodePageRouter()
      : super(
          VaricationCodePageRouter.name,
          path: 'varication_code_page',
        );

  static const String name = 'VaricationCodePageRouter';
}

/// generated route for
/// [_i16.VaricationCodeFirebasePage]
class VaricationCodeFirebasePageRouter extends _i55.PageRouteInfo<void> {
  const VaricationCodeFirebasePageRouter()
      : super(
          VaricationCodeFirebasePageRouter.name,
          path: 'varication_code_firebase_page',
        );

  static const String name = 'VaricationCodeFirebasePageRouter';
}

/// generated route for
/// [_i17.VerifyChangePhoneNumberPage]
class VerifyChangePhoneNumberPageRouter extends _i55.PageRouteInfo<void> {
  const VerifyChangePhoneNumberPageRouter()
      : super(
          VerifyChangePhoneNumberPageRouter.name,
          path: 'varify_phone_number_page',
        );

  static const String name = 'VerifyChangePhoneNumberPageRouter';
}

/// generated route for
/// [_i18.ReserPasswordPage]
class ReserPasswordPageRouter extends _i55.PageRouteInfo<void> {
  const ReserPasswordPageRouter()
      : super(
          ReserPasswordPageRouter.name,
          path: 'reser_password_page',
        );

  static const String name = 'ReserPasswordPageRouter';
}

/// generated route for
/// [_i19.ReserPasswordFirebasePage]
class ReserPasswordFirebasePageRouter extends _i55.PageRouteInfo<void> {
  const ReserPasswordFirebasePageRouter()
      : super(
          ReserPasswordFirebasePageRouter.name,
          path: 'reser_password_firebase_page',
        );

  static const String name = 'ReserPasswordFirebasePageRouter';
}

/// generated route for
/// [_i20.ChooseLanguagePage]
class ChooseLanguagePageRouter extends _i55.PageRouteInfo<void> {
  const ChooseLanguagePageRouter()
      : super(
          ChooseLanguagePageRouter.name,
          path: 'choose_language_page',
        );

  static const String name = 'ChooseLanguagePageRouter';
}

/// generated route for
/// [_i21.MainProviderPage]
class MainProviderRouter extends _i55.PageRouteInfo<void> {
  const MainProviderRouter({List<_i55.PageRouteInfo>? children})
      : super(
          MainProviderRouter.name,
          path: 'main_provider',
          initialChildren: children,
        );

  static const String name = 'MainProviderRouter';
}

/// generated route for
/// [_i22.EmptyRouterPage]
class HomeRouter extends _i55.PageRouteInfo<void> {
  const HomeRouter({List<_i55.PageRouteInfo>? children})
      : super(
          HomeRouter.name,
          path: 'home',
          initialChildren: children,
        );

  static const String name = 'HomeRouter';
}

/// generated route for
/// [_i22.EmptyRouterPage]
class NotificationsRouter extends _i55.PageRouteInfo<void> {
  const NotificationsRouter({List<_i55.PageRouteInfo>? children})
      : super(
          NotificationsRouter.name,
          path: 'notification',
          initialChildren: children,
        );

  static const String name = 'NotificationsRouter';
}

/// generated route for
/// [_i23.CallingPage]
class CallingRouter extends _i55.PageRouteInfo<void> {
  const CallingRouter()
      : super(
          CallingRouter.name,
          path: 'calling',
        );

  static const String name = 'CallingRouter';
}

/// generated route for
/// [_i24.UserDetailsPage]
class UserDetailsPageRouter extends _i55.PageRouteInfo<void> {
  const UserDetailsPageRouter()
      : super(
          UserDetailsPageRouter.name,
          path: 'user_details',
        );

  static const String name = 'UserDetailsPageRouter';
}

/// generated route for
/// [_i25.AboutUs]
class AboutUsPageRouter extends _i55.PageRouteInfo<void> {
  const AboutUsPageRouter()
      : super(
          AboutUsPageRouter.name,
          path: 'about_us',
        );

  static const String name = 'AboutUsPageRouter';
}

/// generated route for
/// [_i22.EmptyRouterPage]
class SettingPagePageRouter extends _i55.PageRouteInfo<void> {
  const SettingPagePageRouter({List<_i55.PageRouteInfo>? children})
      : super(
          SettingPagePageRouter.name,
          path: 'setting',
          initialChildren: children,
        );

  static const String name = 'SettingPagePageRouter';
}

/// generated route for
/// [_i26.HomeScreen]
class HomeScreen extends _i55.PageRouteInfo<void> {
  const HomeScreen()
      : super(
          HomeScreen.name,
          path: '',
        );

  static const String name = 'HomeScreen';
}

/// generated route for
/// [_i27.ServicesPage]
class ServicesRoute extends _i55.PageRouteInfo<ServicesRouteArgs> {
  ServicesRoute({
    _i56.Key? key,
    required _i58.ServiceEntity service,
  }) : super(
          ServicesRoute.name,
          path: 'services',
          args: ServicesRouteArgs(
            key: key,
            service: service,
          ),
        );

  static const String name = 'ServicesRoute';
}

class ServicesRouteArgs {
  const ServicesRouteArgs({
    this.key,
    required this.service,
  });

  final _i56.Key? key;

  final _i58.ServiceEntity service;

  @override
  String toString() {
    return 'ServicesRouteArgs{key: $key, service: $service}';
  }
}

/// generated route for
/// [_i28.CreateAppointementPage]
class CreateAppointementRoute
    extends _i55.PageRouteInfo<CreateAppointementRouteArgs> {
  CreateAppointementRoute({
    _i56.Key? key,
    required _i58.ServiceEntity service,
    double? customPrice,
  }) : super(
          CreateAppointementRoute.name,
          path: 'create_appointement',
          args: CreateAppointementRouteArgs(
            key: key,
            service: service,
            customPrice: customPrice,
          ),
        );

  static const String name = 'CreateAppointementRoute';
}

class CreateAppointementRouteArgs {
  const CreateAppointementRouteArgs({
    this.key,
    required this.service,
    this.customPrice,
  });

  final _i56.Key? key;

  final _i58.ServiceEntity service;

  final double? customPrice;

  @override
  String toString() {
    return 'CreateAppointementRouteArgs{key: $key, service: $service, customPrice: $customPrice}';
  }
}

/// generated route for
/// [_i29.PhotoViewPage]
class PhotoViewPageeRouter
    extends _i55.PageRouteInfo<PhotoViewPageeRouterArgs> {
  PhotoViewPageeRouter({
    _i56.Key? key,
    required String path,
    _i29.PhotoViewPageProvider provider = _i29.PhotoViewPageProvider.newtwork,
  }) : super(
          PhotoViewPageeRouter.name,
          path: 'photo_view_page',
          args: PhotoViewPageeRouterArgs(
            key: key,
            path: path,
            provider: provider,
          ),
        );

  static const String name = 'PhotoViewPageeRouter';
}

class PhotoViewPageeRouterArgs {
  const PhotoViewPageeRouterArgs({
    this.key,
    required this.path,
    this.provider = _i29.PhotoViewPageProvider.newtwork,
  });

  final _i56.Key? key;

  final String path;

  final _i29.PhotoViewPageProvider provider;

  @override
  String toString() {
    return 'PhotoViewPageeRouterArgs{key: $key, path: $path, provider: $provider}';
  }
}

/// generated route for
/// [_i30.CreateAppointementSecondPage]
class CreateAppointementSecondRoute
    extends _i55.PageRouteInfo<CreateAppointementSecondRouteArgs> {
  CreateAppointementSecondRoute({
    _i56.Key? key,
    required _i58.ServiceEntity service,
  }) : super(
          CreateAppointementSecondRoute.name,
          path: 'create_appointement_second',
          args: CreateAppointementSecondRouteArgs(
            key: key,
            service: service,
          ),
        );

  static const String name = 'CreateAppointementSecondRoute';
}

class CreateAppointementSecondRouteArgs {
  const CreateAppointementSecondRouteArgs({
    this.key,
    required this.service,
  });

  final _i56.Key? key;

  final _i58.ServiceEntity service;

  @override
  String toString() {
    return 'CreateAppointementSecondRouteArgs{key: $key, service: $service}';
  }
}

/// generated route for
/// [_i31.CreateAppointementThirdPage]
class CreateAppointementThirdRoute
    extends _i55.PageRouteInfo<CreateAppointementThirdRouteArgs> {
  CreateAppointementThirdRoute({
    _i56.Key? key,
    required _i58.ServiceEntity service,
    _i30.EveningMorning? period,
  }) : super(
          CreateAppointementThirdRoute.name,
          path: 'create_appointement_third',
          args: CreateAppointementThirdRouteArgs(
            key: key,
            service: service,
            period: period,
          ),
        );

  static const String name = 'CreateAppointementThirdRoute';
}

class CreateAppointementThirdRouteArgs {
  const CreateAppointementThirdRouteArgs({
    this.key,
    required this.service,
    this.period,
  });

  final _i56.Key? key;

  final _i58.ServiceEntity service;

  final _i30.EveningMorning? period;

  @override
  String toString() {
    return 'CreateAppointementThirdRouteArgs{key: $key, service: $service, period: $period}';
  }
}

/// generated route for
/// [_i32.CreateAppointementFourthPage]
class CreateAppointementFourthRoute
    extends _i55.PageRouteInfo<CreateAppointementFourthRouteArgs> {
  CreateAppointementFourthRoute({
    _i56.Key? key,
    required _i58.ServiceEntity service,
  }) : super(
          CreateAppointementFourthRoute.name,
          path: 'create_appointement_fourth',
          args: CreateAppointementFourthRouteArgs(
            key: key,
            service: service,
          ),
        );

  static const String name = 'CreateAppointementFourthRoute';
}

class CreateAppointementFourthRouteArgs {
  const CreateAppointementFourthRouteArgs({
    this.key,
    required this.service,
  });

  final _i56.Key? key;

  final _i58.ServiceEntity service;

  @override
  String toString() {
    return 'CreateAppointementFourthRouteArgs{key: $key, service: $service}';
  }
}

/// generated route for
/// [_i33.CreateAppointmentPayment]
class CreateAppointmentPayment
    extends _i55.PageRouteInfo<CreateAppointmentPaymentArgs> {
  CreateAppointmentPayment({
    _i56.Key? key,
    required _i58.ServiceEntity service,
  }) : super(
          CreateAppointmentPayment.name,
          path: 'create_appointement_payment',
          args: CreateAppointmentPaymentArgs(
            key: key,
            service: service,
          ),
        );

  static const String name = 'CreateAppointmentPayment';
}

class CreateAppointmentPaymentArgs {
  const CreateAppointmentPaymentArgs({
    this.key,
    required this.service,
  });

  final _i56.Key? key;

  final _i58.ServiceEntity service;

  @override
  String toString() {
    return 'CreateAppointmentPaymentArgs{key: $key, service: $service}';
  }
}

/// generated route for
/// [_i34.AppointmentDetailsPage]
class AppointmenCompletePayPageRoute
    extends _i55.PageRouteInfo<AppointmenCompletePayPageRouteArgs> {
  AppointmenCompletePayPageRoute({
    _i56.Key? key,
    required _i57.Appointment appointment,
  }) : super(
          AppointmenCompletePayPageRoute.name,
          path: 'appointment_details',
          args: AppointmenCompletePayPageRouteArgs(
            key: key,
            appointment: appointment,
          ),
        );

  static const String name = 'AppointmenCompletePayPageRoute';
}

class AppointmenCompletePayPageRouteArgs {
  const AppointmenCompletePayPageRouteArgs({
    this.key,
    required this.appointment,
  });

  final _i56.Key? key;

  final _i57.Appointment appointment;

  @override
  String toString() {
    return 'AppointmenCompletePayPageRouteArgs{key: $key, appointment: $appointment}';
  }
}

/// generated route for
/// [_i35.DonePage]
class DoneRoute extends _i55.PageRouteInfo<void> {
  const DoneRoute()
      : super(
          DoneRoute.name,
          path: 'done_page',
        );

  static const String name = 'DoneRoute';
}

/// generated route for
/// [_i36.DoctorsPage]
class DoctorsRoute extends _i55.PageRouteInfo<DoctorsRouteArgs> {
  DoctorsRoute({
    _i56.Key? key,
    required _i58.ServiceEntity service,
  }) : super(
          DoctorsRoute.name,
          path: 'doctors_page',
          args: DoctorsRouteArgs(
            key: key,
            service: service,
          ),
        );

  static const String name = 'DoctorsRoute';
}

class DoctorsRouteArgs {
  const DoctorsRouteArgs({
    this.key,
    required this.service,
  });

  final _i56.Key? key;

  final _i58.ServiceEntity service;

  @override
  String toString() {
    return 'DoctorsRouteArgs{key: $key, service: $service}';
  }
}

/// generated route for
/// [_i37.DoctorProfile]
class DoctorProfile extends _i55.PageRouteInfo<DoctorProfileArgs> {
  DoctorProfile({
    _i56.Key? key,
    required _i59.User user,
  }) : super(
          DoctorProfile.name,
          path: 'doctor_profile',
          args: DoctorProfileArgs(
            key: key,
            user: user,
          ),
        );

  static const String name = 'DoctorProfile';
}

class DoctorProfileArgs {
  const DoctorProfileArgs({
    this.key,
    required this.user,
  });

  final _i56.Key? key;

  final _i59.User user;

  @override
  String toString() {
    return 'DoctorProfileArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i38.NotificationsPage]
class NotificationsRoute extends _i55.PageRouteInfo<void> {
  const NotificationsRoute()
      : super(
          NotificationsRoute.name,
          path: '',
        );

  static const String name = 'NotificationsRoute';
}

/// generated route for
/// [_i34.AppointmentDetailsPage]
class AppointmentDetailsPageRoute
    extends _i55.PageRouteInfo<AppointmentDetailsPageRouteArgs> {
  AppointmentDetailsPageRoute({
    _i56.Key? key,
    required _i57.Appointment appointment,
  }) : super(
          AppointmentDetailsPageRoute.name,
          path: 'appointment_details',
          args: AppointmentDetailsPageRouteArgs(
            key: key,
            appointment: appointment,
          ),
        );

  static const String name = 'AppointmentDetailsPageRoute';
}

class AppointmentDetailsPageRouteArgs {
  const AppointmentDetailsPageRouteArgs({
    this.key,
    required this.appointment,
  });

  final _i56.Key? key;

  final _i57.Appointment appointment;

  @override
  String toString() {
    return 'AppointmentDetailsPageRouteArgs{key: $key, appointment: $appointment}';
  }
}

/// generated route for
/// [_i39.PdfViewerPage]
class PdfViewerPageRouter extends _i55.PageRouteInfo<PdfViewerPageRouterArgs> {
  PdfViewerPageRouter({
    _i56.Key? key,
    required String paht,
  }) : super(
          PdfViewerPageRouter.name,
          path: 'pdf_view_page',
          args: PdfViewerPageRouterArgs(
            key: key,
            paht: paht,
          ),
        );

  static const String name = 'PdfViewerPageRouter';
}

class PdfViewerPageRouterArgs {
  const PdfViewerPageRouterArgs({
    this.key,
    required this.paht,
  });

  final _i56.Key? key;

  final String paht;

  @override
  String toString() {
    return 'PdfViewerPageRouterArgs{key: $key, paht: $paht}';
  }
}

/// generated route for
/// [_i40.SettingPage]
class SettingRoute extends _i55.PageRouteInfo<void> {
  const SettingRoute()
      : super(
          SettingRoute.name,
          path: '',
        );

  static const String name = 'SettingRoute';
}

/// generated route for
/// [_i41.Privacy]
class PrivacyPageRouter extends _i55.PageRouteInfo<void> {
  const PrivacyPageRouter()
      : super(
          PrivacyPageRouter.name,
          path: 'prrivacy',
        );

  static const String name = 'PrivacyPageRouter';
}

/// generated route for
/// [_i42.CurrentMedicationsPage]
class CurrentMedicationsPageRouter extends _i55.PageRouteInfo<void> {
  const CurrentMedicationsPageRouter()
      : super(
          CurrentMedicationsPageRouter.name,
          path: 'current_medications',
        );

  static const String name = 'CurrentMedicationsPageRouter';
}

/// generated route for
/// [_i43.ChronicDiseasesPagePage]
class ChronicDiseasesPageouter extends _i55.PageRouteInfo<void> {
  const ChronicDiseasesPageouter()
      : super(
          ChronicDiseasesPageouter.name,
          path: 'chornic_deseases',
        );

  static const String name = 'ChronicDiseasesPageouter';
}

/// generated route for
/// [_i44.MainComplainmentPage]
class MainComplainmentPageRouter extends _i55.PageRouteInfo<void> {
  const MainComplainmentPageRouter()
      : super(
          MainComplainmentPageRouter.name,
          path: 'complaiments',
        );

  static const String name = 'MainComplainmentPageRouter';
}

/// generated route for
/// [_i45.AllergyPagePage]
class AllergyPageRouter extends _i55.PageRouteInfo<void> {
  const AllergyPageRouter()
      : super(
          AllergyPageRouter.name,
          path: 'chornic_deseases',
        );

  static const String name = 'AllergyPageRouter';
}

/// generated route for
/// [_i46.PreviousSurgeriesPage]
class PreviousSurgeriesPageRouter extends _i55.PageRouteInfo<void> {
  const PreviousSurgeriesPageRouter()
      : super(
          PreviousSurgeriesPageRouter.name,
          path: 'previous_surgeriesPage',
        );

  static const String name = 'PreviousSurgeriesPageRouter';
}

/// generated route for
/// [_i47.SharedList]
class SharedListRouter extends _i55.PageRouteInfo<SharedListRouterArgs> {
  SharedListRouter({
    _i56.Key? key,
    required String title,
    required String subTitle,
    required List<_i60.MediaclModel> list,
    required dynamic Function(List<_i60.MediaclModel>) onSubmit,
    required dynamic Function(List<_i60.MediaclModel>) onEdit,
    required String hint,
  }) : super(
          SharedListRouter.name,
          path: 'shared_list',
          args: SharedListRouterArgs(
            key: key,
            title: title,
            subTitle: subTitle,
            list: list,
            onSubmit: onSubmit,
            onEdit: onEdit,
            hint: hint,
          ),
        );

  static const String name = 'SharedListRouter';
}

class SharedListRouterArgs {
  const SharedListRouterArgs({
    this.key,
    required this.title,
    required this.subTitle,
    required this.list,
    required this.onSubmit,
    required this.onEdit,
    required this.hint,
  });

  final _i56.Key? key;

  final String title;

  final String subTitle;

  final List<_i60.MediaclModel> list;

  final dynamic Function(List<_i60.MediaclModel>) onSubmit;

  final dynamic Function(List<_i60.MediaclModel>) onEdit;

  final String hint;

  @override
  String toString() {
    return 'SharedListRouterArgs{key: $key, title: $title, subTitle: $subTitle, list: $list, onSubmit: $onSubmit, onEdit: $onEdit, hint: $hint}';
  }
}

/// generated route for
/// [_i22.EmptyRouterPage]
class AttachmentsPageRouter extends _i55.PageRouteInfo<void> {
  const AttachmentsPageRouter({List<_i55.PageRouteInfo>? children})
      : super(
          AttachmentsPageRouter.name,
          path: 'attachments_page',
          initialChildren: children,
        );

  static const String name = 'AttachmentsPageRouter';
}

/// generated route for
/// [_i48.AttachmentsPage]
class AttachmentsRoute extends _i55.PageRouteInfo<AttachmentsRouteArgs> {
  AttachmentsRoute({
    _i56.Key? key,
    List<_i61.Attachment>? attachments,
  }) : super(
          AttachmentsRoute.name,
          path: '',
          args: AttachmentsRouteArgs(
            key: key,
            attachments: attachments,
          ),
        );

  static const String name = 'AttachmentsRoute';
}

class AttachmentsRouteArgs {
  const AttachmentsRouteArgs({
    this.key,
    this.attachments,
  });

  final _i56.Key? key;

  final List<_i61.Attachment>? attachments;

  @override
  String toString() {
    return 'AttachmentsRouteArgs{key: $key, attachments: $attachments}';
  }
}

/// generated route for
/// [_i22.EmptyRouterScreen]
class ProviderHomeRouter extends _i55.PageRouteInfo<void> {
  const ProviderHomeRouter({List<_i55.PageRouteInfo>? children})
      : super(
          ProviderHomeRouter.name,
          path: 'provider_home',
          initialChildren: children,
        );

  static const String name = 'ProviderHomeRouter';
}

/// generated route for
/// [_i22.EmptyRouterScreen]
class ProviderSettingRouter extends _i55.PageRouteInfo<void> {
  const ProviderSettingRouter({List<_i55.PageRouteInfo>? children})
      : super(
          ProviderSettingRouter.name,
          path: 'provider_settings',
          initialChildren: children,
        );

  static const String name = 'ProviderSettingRouter';
}

/// generated route for
/// [_i22.EmptyRouterPage]
class ProviderNotificationsRouter extends _i55.PageRouteInfo<void> {
  const ProviderNotificationsRouter({List<_i55.PageRouteInfo>? children})
      : super(
          ProviderNotificationsRouter.name,
          path: 'provider_notifications',
          initialChildren: children,
        );

  static const String name = 'ProviderNotificationsRouter';
}

/// generated route for
/// [_i49.ProviderHome]
class ProviderHome extends _i55.PageRouteInfo<void> {
  const ProviderHome()
      : super(
          ProviderHome.name,
          path: '',
        );

  static const String name = 'ProviderHome';
}

/// generated route for
/// [_i50.AppointmentDetailsPageAdpter]
class AppointmentDetailsPageAdpterRoute
    extends _i55.PageRouteInfo<AppointmentDetailsPageAdpterRouteArgs> {
  AppointmentDetailsPageAdpterRoute({
    _i56.Key? key,
    required _i57.Appointment appointment,
  }) : super(
          AppointmentDetailsPageAdpterRoute.name,
          path: 'appointment_etails_pageAdpter',
          args: AppointmentDetailsPageAdpterRouteArgs(
            key: key,
            appointment: appointment,
          ),
        );

  static const String name = 'AppointmentDetailsPageAdpterRoute';
}

class AppointmentDetailsPageAdpterRouteArgs {
  const AppointmentDetailsPageAdpterRouteArgs({
    this.key,
    required this.appointment,
  });

  final _i56.Key? key;

  final _i57.Appointment appointment;

  @override
  String toString() {
    return 'AppointmentDetailsPageAdpterRouteArgs{key: $key, appointment: $appointment}';
  }
}

/// generated route for
/// [_i51.UserInformationPage]
class UserInformationPageRoute
    extends _i55.PageRouteInfo<UserInformationPageRouteArgs> {
  UserInformationPageRoute({
    _i56.Key? key,
    required _i59.User user,
  }) : super(
          UserInformationPageRoute.name,
          path: 'user_inforation_page',
          args: UserInformationPageRouteArgs(
            key: key,
            user: user,
          ),
        );

  static const String name = 'UserInformationPageRoute';
}

class UserInformationPageRouteArgs {
  const UserInformationPageRouteArgs({
    this.key,
    required this.user,
  });

  final _i56.Key? key;

  final _i59.User user;

  @override
  String toString() {
    return 'UserInformationPageRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i48.AttachmentsPage]
class AttachmentsPageRouter2
    extends _i55.PageRouteInfo<AttachmentsPageRouter2Args> {
  AttachmentsPageRouter2({
    _i56.Key? key,
    List<_i61.Attachment>? attachments,
  }) : super(
          AttachmentsPageRouter2.name,
          path: 'attachments_page2',
          args: AttachmentsPageRouter2Args(
            key: key,
            attachments: attachments,
          ),
        );

  static const String name = 'AttachmentsPageRouter2';
}

class AttachmentsPageRouter2Args {
  const AttachmentsPageRouter2Args({
    this.key,
    this.attachments,
  });

  final _i56.Key? key;

  final List<_i61.Attachment>? attachments;

  @override
  String toString() {
    return 'AttachmentsPageRouter2Args{key: $key, attachments: $attachments}';
  }
}

/// generated route for
/// [_i51.UserInformationPage]
class UserInformationRoute
    extends _i55.PageRouteInfo<UserInformationRouteArgs> {
  UserInformationRoute({
    _i56.Key? key,
    required _i59.User user,
  }) : super(
          UserInformationRoute.name,
          path: '',
          args: UserInformationRouteArgs(
            key: key,
            user: user,
          ),
        );

  static const String name = 'UserInformationRoute';
}

class UserInformationRouteArgs {
  const UserInformationRouteArgs({
    this.key,
    required this.user,
  });

  final _i56.Key? key;

  final _i59.User user;

  @override
  String toString() {
    return 'UserInformationRouteArgs{key: $key, user: $user}';
  }
}

/// generated route for
/// [_i52.ProviderSettingPage]
class ProviderSettingRoute extends _i55.PageRouteInfo<void> {
  const ProviderSettingRoute()
      : super(
          ProviderSettingRoute.name,
          path: '',
        );

  static const String name = 'ProviderSettingRoute';
}

/// generated route for
/// [_i53.ProviderQualificationsPage]
class ProviderQualificationsRouter extends _i55.PageRouteInfo<void> {
  const ProviderQualificationsRouter()
      : super(
          ProviderQualificationsRouter.name,
          path: 'provider_qualifications',
        );

  static const String name = 'ProviderQualificationsRouter';
}

/// generated route for
/// [_i54.ProviderNotificationsPage]
class ProviderNotificationsRoute extends _i55.PageRouteInfo<void> {
  const ProviderNotificationsRoute()
      : super(
          ProviderNotificationsRoute.name,
          path: '',
        );

  static const String name = 'ProviderNotificationsRoute';
}
