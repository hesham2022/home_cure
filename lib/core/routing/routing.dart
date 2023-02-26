import 'package:auto_route/auto_route.dart';
import 'package:home_cure/core/widgets/main_scaffold.dart';
import 'package:home_cure/features/Services/presentation/pages/services_page.dart';
import 'package:home_cure/features/aboutus_contactus/presentation/pages/about_us.dart';
import 'package:home_cure/features/aboutus_contactus/presentation/pages/pricavy.dart';
import 'package:home_cure/features/agore/video_page.dart';
import 'package:home_cure/features/appointement/domain/entities/appointment.dart';
import 'package:home_cure/features/appointement/presentation/pages/create_appointement.dart';
import 'package:home_cure/features/appointement/presentation/pages/create_appointment_for.dart';
import 'package:home_cure/features/appointement/presentation/pages/create_appointment_payment.dart';
import 'package:home_cure/features/appointement/presentation/pages/create_appointment_second.dart';
import 'package:home_cure/features/appointement/presentation/pages/create_appointment_third.dart';
import 'package:home_cure/features/appointement/presentation/pages/done_page.dart';
import 'package:home_cure/features/appointement/presentation/pages/web_view_page.dart';
import 'package:home_cure/features/calling/presentation/pages/calling_page.dart';
import 'package:home_cure/features/home/presentation/pages/home.dart';
import 'package:home_cure/features/login/presentation/pages/change_phone_number.dart';
import 'package:home_cure/features/login/presentation/pages/change_phone_number_firebase.dart';
import 'package:home_cure/features/login/presentation/pages/choose_language_page.dart';
import 'package:home_cure/features/login/presentation/pages/forget_password.dart';
import 'package:home_cure/features/login/presentation/pages/forget_password_firebase.dart';
import 'package:home_cure/features/login/presentation/pages/login_page.dart';
import 'package:home_cure/features/login/presentation/pages/otp_firebase.dart';
import 'package:home_cure/features/login/presentation/pages/reqgister_page.dart';
import 'package:home_cure/features/login/presentation/pages/reset_password_firebase.dart';
import 'package:home_cure/features/login/presentation/pages/resret_password_page.dart';
import 'package:home_cure/features/login/presentation/pages/send_otp_page.dart';
import 'package:home_cure/features/login/presentation/pages/splash_screen.dart';
import 'package:home_cure/features/login/presentation/pages/varication_code_page.dart';
import 'package:home_cure/features/login/presentation/pages/verify_change_phone_page%20copy.dart';
import 'package:home_cure/features/login/presentation/pages/verify_code_firebase.dart';
import 'package:home_cure/features/login/presentation/pages/verify_otp_page.dart';
import 'package:home_cure/features/login/presentation/pages/verify_phone_number_firebase.dart';
import 'package:home_cure/features/notifications/presentation/pages/appointment_details_page.dart';
import 'package:home_cure/features/notifications/presentation/pages/notifications_page.dart';
import 'package:home_cure/features/notifications/presentation/pages/user_information_page.dart';
import 'package:home_cure/features/our_doctors/pages/doctor_profile.dart';
import 'package:home_cure/features/our_doctors/pages/doctors_page.dart';
import 'package:home_cure/features/provider/presentation/pages/appointment_details_page_adpter.dart';
import 'package:home_cure/features/provider/presentation/pages/main_provider_page.dart';
import 'package:home_cure/features/provider/presentation/pages/provider_home.dart';
import 'package:home_cure/features/provider/presentation/pages/provider_notifications_page.dart';
import 'package:home_cure/features/provider/presentation/pages/provider_qualifications_page.dart';
import 'package:home_cure/features/provider/presentation/pages/provider_setting_page.dart';
import 'package:home_cure/features/setting/presentation/pages/setting_page.dart';
import 'package:home_cure/features/user_details/presentation/pages/allergy_page.dart';
import 'package:home_cure/features/user_details/presentation/pages/attachments_page.dart';
import 'package:home_cure/features/user_details/presentation/pages/chronic_deseases_page.dart';
import 'package:home_cure/features/user_details/presentation/pages/current_medications.dart';
import 'package:home_cure/features/user_details/presentation/pages/main_complaintment_page.dart';
import 'package:home_cure/features/user_details/presentation/pages/pdf_viewer_page.dart';
import 'package:home_cure/features/user_details/presentation/pages/photo_view_page.dart';
import 'package:home_cure/features/user_details/presentation/pages/previous_sergerious_page.dart';
import 'package:home_cure/features/user_details/presentation/pages/user_details_page.dart';
import 'package:home_cure/features/user_details/presentation/widgets/shared_list.dart';

@CupertinoAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    CustomRoute<void>(
      page: SplashScreen,
      path: '/',
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    CustomRoute<void>(
      barrierDismissible: true,
      transitionsBuilder: TransitionsBuilders.slideTop,
      path: 'webview_payment',
      page: WebViewPaymentPage,
    ),
    CustomRoute<void>(
      page: VaricationOtpPage,
      name: 'VaricationOtpPageRoute',
      path: 'verify_otp_page',
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    CustomRoute<void>(
      page: OtpFirebasePage,
      name: 'OtpFirebasePagePageRoute',
      path: 'otp_firebase_page',
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    CustomRoute<void>(
      page: ChangePhoneNumberFirebasePage,
      name: 'ChangePhoneNumberFirebasePageRoute',
      path: 'change_phoneNumber_firebase_page',
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    CustomRoute<void>(
      page: VerifyChangePhoneNumberFirebasePage,
      name: 'VerifyChangePhoneNumberFirebasePageRoute',
      path: 'verify_change_phoneNumber_firebasePage',
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    CustomRoute<void>(
      page: SendOtpPage,
      name: 'SendOtpPageRoute',
      path: 'send_otp_page',
      transitionsBuilder: TransitionsBuilders.noTransition,
    ),
    AutoRoute<void>(
      page: MainScaffold,
      path: 'main',
      // transitionsBuilder: TransitionsBuilders.slideTop,
      children: [
        CustomRoute<void>(
          transitionsBuilder: TransitionsBuilders.slideTop,
          path: 'home',
          name: 'HomeRouter',
          barrierDismissible: true,
          page: EmptyRouterPage,
          children: [
            CustomRoute<void>(
              barrierDismissible: true,
              transitionsBuilder: TransitionsBuilders.slideTop,
              path: '',
              page: HomeScreen,
            ),
            CustomRoute<void>(
              barrierDismissible: true,
              transitionsBuilder: TransitionsBuilders.slideTop,
              path: 'services',
              page: ServicesPage,
            ),
            CustomRoute<void>(
              barrierDismissible: true,
              transitionsBuilder: TransitionsBuilders.slideLeft,
              path: 'create_appointement',
              page: CreateAppointementPage,
            ),
            AutoRoute<void>(
              path: 'photo_view_page',
              name: 'PhotoViewPageeRouter',
              page: PhotoViewPage,
            ),
            CustomRoute<void>(
              barrierDismissible: true,
              transitionsBuilder: TransitionsBuilders.slideLeft,
              path: 'create_appointement_second',
              page: CreateAppointementSecondPage,
            ),

            CustomRoute<void>(
              barrierDismissible: true,
              transitionsBuilder: TransitionsBuilders.slideLeft,
              path: 'create_appointement_third',
              page: CreateAppointementThirdPage,
            ),
            CustomRoute<void>(
              barrierDismissible: true,
              transitionsBuilder: TransitionsBuilders.slideLeft,
              path: 'create_appointement_fourth',
              page: CreateAppointementFourthPage,
            ),
            CustomRoute<void>(
              barrierDismissible: true,
              transitionsBuilder: TransitionsBuilders.slideLeft,
              path: 'create_appointement_payment',
              page: CreateAppointmentPayment,
            ),
            AutoRoute<Appointment>(
              path: 'appointment_details',
              name: 'AppointmenCompletePayPageRoute',
              page: AppointmentDetailsPage,
            ),
            CustomRoute<void>(
              barrierDismissible: true,
              transitionsBuilder: TransitionsBuilders.slideLeft,
              path: 'done_page',
              page: DonePage,
            ),
            CustomRoute<void>(
              barrierDismissible: true,
              transitionsBuilder: TransitionsBuilders.slideTop,
              path: 'doctors_page',
              page: DoctorsPage,
            ),
            CustomRoute<void>(
              barrierDismissible: true,
              transitionsBuilder: TransitionsBuilders.slideTop,
              path: 'doctor_profile',
              page: DoctorProfile,
            ),
            //
          ],
        ),
        CustomRoute<void>(
          transitionsBuilder: TransitionsBuilders.slideTop,
          path: 'notification',
          name: 'NotificationsRouter',
          barrierDismissible: true,
          page: EmptyRouterPage,
          children: [
            AutoRoute<void>(
              path: '',
              page: NotificationsPage,
            ),
            AutoRoute<void>(
              path: 'appointment_details',
              name: 'AppointmentDetailsPageRoute',
              page: AppointmentDetailsPage,
            ),
            // CustomRoute<void>(
            //   barrierDismissible: true,
            //   transitionsBuilder: TransitionsBuilders.slideTop,
            //   path: 'webview_payment',
            //   page: WebViewPaymentPage,
            // ),
            AutoRoute<void>(
              path: 'photo_view_page',
              name: 'PhotoViewPageeRouter',
              page: PhotoViewPage,
            ),
            AutoRoute<void>(
              path: 'pdf_view_page',
              name: 'PdfViewerPageRouter',
              page: PdfViewerPage,
            ),
          ],
        ),
        AutoRoute<void>(
          path: 'calling',
          name: 'CallingRouter',
          page: CallingPage,
        ),
        AutoRoute<void>(
          path: 'user_details',
          name: 'UserDetailsPageRouter',
          page: UserDetailsPage,
        ),
        AutoRoute<void>(
          path: 'about_us',
          name: 'AboutUsPageRouter',
          page: AboutUs,
        ),
        CustomRoute<void>(
          transitionsBuilder: TransitionsBuilders.slideTop,
          path: 'setting',
          name: 'SettingPagePageRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute<void>(
              // barrierDismissible: true,
              // transitionsBuilder: TransitionsBuilders.zoomIn,
              // durationInMilliseconds: 1000,
              path: '',
              page: SettingPage,
            ),
            AutoRoute<void>(
              path: 'user_details',
              name: 'UserDetailsPageRouter',
              page: UserDetailsPage,
            ),
            AutoRoute<void>(
              path: 'prrivacy',
              name: 'PrivacyPageRouter',
              page: Privacy,
            ),
            AutoRoute<void>(
              path: 'current_medications',
              name: 'CurrentMedicationsPageRouter',
              page: CurrentMedicationsPage,
            ),
            AutoRoute<void>(
              path: 'chornic_deseases',
              name: 'ChronicDiseasesPageouter',
              page: ChronicDiseasesPagePage,
            ),
            AutoRoute<void>(
              path: 'complaiments',
              name: 'MainComplainmentPageRouter',
              page: MainComplainmentPage,
            ),
            AutoRoute<void>(
              path: 'chornic_deseases',
              name: 'AllergyPageRouter',
              page: AllergyPagePage,
            ),
            AutoRoute<void>(
              path: 'previous_surgeriesPage',
              name: 'PreviousSurgeriesPageRouter',
              page: PreviousSurgeriesPage,
            ),

            AutoRoute<void>(
              path: 'shared_list',
              name: 'SharedListRouter',
              page: SharedList,
            ),
            AutoRoute<void>(
              path: 'attachments_page',
              name: 'AttachmentsPageRouter',
              page: EmptyRouterPage,
              children: [
                AutoRoute<void>(
                  path: '',
                  page: AttachmentsPage,
                ),
                AutoRoute<void>(
                  path: 'photo_view_page',
                  name: 'PhotoViewPageeRouter',
                  page: PhotoViewPage,
                ),
                AutoRoute<void>(
                  path: 'pdf_view_page',
                  name: 'PdfViewerPageRouter',
                  page: PdfViewerPage,
                ),
              ],
            ),

            //
          ],
        )
      ],
    ),
    AutoRoute<void>(
      path: 'login',
      name: 'LoginPagePageRouter',
      page: LoginPage,
    ),
    AutoRoute<void>(
      path: 'video_page',
      name: 'VideoPageeRouter',
      page: Call,
    ),
    AutoRoute<void>(
      path: 'register',
      name: 'RegisterPagePageRouter',
      page: RegisterPage,
    ),
    AutoRoute<void>(
      path: 'forgot_password_page',
      name: 'ForgotPasswordPageRouter',
      page: ForgotPasswordPage,
    ),
    AutoRoute<void>(
      path: 'forgot_password_firebase_page',
      name: 'ForgotPasswordFirebasePageRouter',
      page: ForgetPasswordFirebasePage,
    ),
    AutoRoute<void>(
      path: 'change_phone_number_page',
      name: 'ChangePhoneNumberPageRouter',
      page: ChangePhoneNumberPage,
    ),
    AutoRoute<void>(
      path: 'varication_code_page',
      name: 'VaricationCodePageRouter',
      page: VaricationCodePage,
    ),
    AutoRoute<void>(
      path: 'varication_code_firebase_page',
      name: 'VaricationCodeFirebasePageRouter',
      page: VaricationCodeFirebasePage,
    ),
    AutoRoute<void>(
      path: 'varify_phone_number_page',
      name: 'VerifyChangePhoneNumberPageRouter',
      page: VerifyChangePhoneNumberPage,
    ),
    AutoRoute<void>(
      path: 'reser_password_page',
      name: 'ReserPasswordPageRouter',
      page: ReserPasswordPage,
    ),
    AutoRoute<void>(
      path: 'reser_password_firebase_page',
      name: 'ReserPasswordFirebasePageRouter',
      page: ReserPasswordFirebasePage,
    ),
    AutoRoute<void>(
      path: 'choose_language_page',
      name: 'ChooseLanguagePageRouter',
      page: ChooseLanguagePage,
    ),
    AutoRoute<void>(
      page: MainProviderPage,
      path: 'main_provider',
      name: 'MainProviderRouter',
      // page: ProviderHome,
      children: [
        AutoRoute<void>(
          path: 'provider_home',
          name: 'ProviderHomeRouter',

          page: EmptyRouterScreen,
          children: [
            AutoRoute<void>(
              path: '',
              page: ProviderHome,
            ),
            AutoRoute<void>(
              path: 'appointment_etails_pageAdpter',
              name: 'AppointmentDetailsPageAdpterRoute',
              page: AppointmentDetailsPageAdpter,
            ),
            AutoRoute<void>(
              path: 'user_inforation_page',
              name: 'UserInformationPageRoute',
              page: EmptyRouterPage,
              children: [
                AutoRoute<void>(
                  path: '',
                  page: UserInformationPage,
                ),
              ],
            ),
            AutoRoute<void>(
              path: 'attachments_page2',
              name: 'AttachmentsPageRouter2',
              page: AttachmentsPage,
            ),
            AutoRoute<void>(
              path: 'photo_view_page',
              name: 'PhotoViewPageeRouter',
              page: PhotoViewPage,
            ),
            AutoRoute<void>(
              path: 'pdf_view_page',
              name: 'PdfViewerPageRouter',
              page: PdfViewerPage,
            ),
          ],
          // page: ProviderHome,
        ),
        AutoRoute<void>(
          path: 'provider_settings',
          name: 'ProviderSettingRouter',
          page: EmptyRouterScreen,
          children: [
            AutoRoute<void>(
              path: '',
              page: ProviderSettingPage,
            ),
            AutoRoute<void>(
              path: 'provider_qualifications',
              name: 'ProviderQualificationsRouter',
              page: ProviderQualificationsPage,
            ),
            AutoRoute<void>(
              path: 'photo_view_page',
              name: 'PhotoViewPageeRouter',
              page: PhotoViewPage,
            ),
            AutoRoute<void>(
              path: 'pdf_view_page',
              name: 'PdfViewerPageRouter',
              page: PdfViewerPage,
            ),
          ],
        ),
        AutoRoute<void>(
          path: 'provider_notifications',
          name: 'ProviderNotificationsRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute<void>(
              path: '',
              page: ProviderNotificationsPage,
              children: [],
            ),
            AutoRoute<void>(
              path: 'appointment_etails_pageAdpter',
              name: 'AppointmentDetailsPageAdpterRoute',
              page: AppointmentDetailsPageAdpter,
            ),
            AutoRoute<void>(
              path: 'user_inforation_page',
              name: 'UserInformationPageRoute',
              page: UserInformationPage,
            ),
            AutoRoute<void>(
              path: 'attachments_page2',
              name: 'AttachmentsPageRouter2',
              page: AttachmentsPage,
            ),
            AutoRoute<void>(
              path: 'photo_view_page',
              name: 'PhotoViewPageeRouter',
              page: PhotoViewPage,
            ),
            AutoRoute<void>(
              path: 'pdf_view_page',
              name: 'PdfViewerPageRouter',
              page: PdfViewerPage,
            ),
          ],
        ),
      ],
    ),
  ],
)
class $AppRouter {}

/// if name == 'Hesjam' ; print 'hello'
class EmptyRouterPage extends AutoRouter {
  const EmptyRouterPage({super.key});
}

class EmptyRouterScreen extends AutoRouter {
  const EmptyRouterScreen({super.key});
}
