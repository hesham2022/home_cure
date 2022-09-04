import 'package:auto_route/auto_route.dart';
import 'package:home_cure/core/widgets/main_scaffold.dart';
import 'package:home_cure/features/Services/presentation/pages/services_page.dart';
import 'package:home_cure/features/aboutus_contactus/presentation/pages/about_us.dart';
import 'package:home_cure/features/appointement/presentation/pages/create_appointement.dart';
import 'package:home_cure/features/appointement/presentation/pages/create_appointment_for.dart';
import 'package:home_cure/features/appointement/presentation/pages/create_appointment_payment.dart';
import 'package:home_cure/features/appointement/presentation/pages/create_appointment_second.dart';
import 'package:home_cure/features/appointement/presentation/pages/create_appointment_third.dart';
import 'package:home_cure/features/appointement/presentation/pages/done_page.dart';
import 'package:home_cure/features/calling/presentation/pages/calling_page.dart';
import 'package:home_cure/features/home/presentation/pages/home.dart';
import 'package:home_cure/features/login/presentation/pages/choose_language_page.dart';
import 'package:home_cure/features/login/presentation/pages/forget_password.dart';
import 'package:home_cure/features/login/presentation/pages/login_page.dart';
import 'package:home_cure/features/login/presentation/pages/reqgister_page.dart';
import 'package:home_cure/features/login/presentation/pages/resret_password_page.dart';
import 'package:home_cure/features/login/presentation/pages/splash_screen.dart';
import 'package:home_cure/features/login/presentation/pages/varication_code_page.dart';
import 'package:home_cure/features/notifications/presentation/pages/notifications_page.dart';
import 'package:home_cure/features/our_doctors/pages/doctor_profile.dart';
import 'package:home_cure/features/our_doctors/pages/doctors_page.dart';
import 'package:home_cure/features/setting/presentation/pages/setting_page.dart';
import 'package:home_cure/features/user_details/presentation/pages/attachments_page.dart';
import 'package:home_cure/features/user_details/presentation/pages/current_medications.dart';
import 'package:home_cure/features/user_details/presentation/pages/family_diseases.dart';
import 'package:home_cure/features/user_details/presentation/pages/medical_history_page.dart';
import 'package:home_cure/features/user_details/presentation/pages/pdf_viewer_page.dart';
import 'package:home_cure/features/user_details/presentation/pages/photo_view_page.dart';
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
              transitionsBuilder: TransitionsBuilders.slideTop,
              path: 'create_appointement',
              page: CreateAppointementPage,
            ),
            CustomRoute<void>(
              barrierDismissible: true,
              transitionsBuilder: TransitionsBuilders.slideTop,
              path: 'create_appointement_second',
              page: CreateAppointementSecondPage,
            ),
            CustomRoute<void>(
              barrierDismissible: true,
              transitionsBuilder: TransitionsBuilders.slideTop,
              path: 'create_appointement_third',
              page: CreateAppointementThirdPage,
            ),
            CustomRoute<void>(
              barrierDismissible: true,
              transitionsBuilder: TransitionsBuilders.slideTop,
              path: 'create_appointement_fourth',
              page: CreateAppointementFourthPage,
            ),
            CustomRoute<void>(
              barrierDismissible: true,
              transitionsBuilder: TransitionsBuilders.slideTop,
              path: 'create_appointement_payment',
              page: CreateAppointmentPayment,
            ),
            CustomRoute<void>(
              barrierDismissible: true,
              transitionsBuilder: TransitionsBuilders.slideTop,
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
        AutoRoute<void>(
          path: 'notification',
          name: 'NotificationsRouter',
          page: NotificationsPage,
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
              path: 'medical_history',
              name: 'MedicalHistoryPageeRouter',
              page: MedicalHistoryPage,
            ),
            AutoRoute<void>(
              path: 'current_medications',
              name: 'CurrentMedicationsPageRouter',
              page: CurrentMedicationsPage,
            ),
            AutoRoute<void>(
              path: 'family_deseasesPage',
              name: 'FamilyDeseasesPageRouter',
              page: FamilyDeseasesPage,
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
      path: 'varication_code_page',
      name: 'VaricationCodePageRouter',
      page: VaricationCodePage,
    ),
    AutoRoute<void>(
      path: 'reser_password_page',
      name: 'ReserPasswordPageRouter',
      page: ReserPasswordPage,
    ),
    AutoRoute<void>(
      path: 'choose_language_page',
      name: 'ChooseLanguagePageRouter',
      page: ChooseLanguagePage,
    ),
  ],
)
class $AppRouter {}

/// if name == 'Hesjam' ; print 'hello'
