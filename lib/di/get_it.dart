import 'package:get_it/get_it.dart';
import 'package:home_cure/core/api_config/api_client.dart';
import 'package:home_cure/core/local_storage/token_storage.dart';
import 'package:home_cure/core/utils/phone_auth.dart';
import 'package:home_cure/features/appointement/data/datasources/appountment_remote.dart';
import 'package:home_cure/features/appointement/data/repositories/appointment_responsitory.dart';
import 'package:home_cure/features/appointement/domain/repositories/i_appointemnts.dart';
import 'package:home_cure/features/appointement/domain/usecases/accept_appointment.dart';
import 'package:home_cure/features/appointement/domain/usecases/create_appointment.dart';
import 'package:home_cure/features/appointement/domain/usecases/create_payment_link.dart';
import 'package:home_cure/features/appointement/domain/usecases/get_appointments.dart';
import 'package:home_cure/features/appointement/domain/usecases/start_video.dart';
import 'package:home_cure/features/appointement/domain/usecases/user_pay.dart';
import 'package:home_cure/features/appointement/presentation/blocs/agora_token_cubit/agora_token_cubit.dart';
import 'package:home_cure/features/appointement/presentation/blocs/appointment_params_cubit.dart/appointment_params_cubit.dart';
import 'package:home_cure/features/appointement/presentation/blocs/appointments_creating_bloc/appointments_cubit.dart';
import 'package:home_cure/features/appointement/presentation/blocs/get_appointments_cubit/my_appointments_cubit..dart';
import 'package:home_cure/features/authentication/data/datasources/auth_remote.dart';
import 'package:home_cure/features/authentication/data/datasources/user_remote.dart';
import 'package:home_cure/features/authentication/data/repositories/auth_respository.dart';
import 'package:home_cure/features/authentication/data/repositories/user_repository.dart';
import 'package:home_cure/features/authentication/domain/repositories/i_repository.dart';
import 'package:home_cure/features/authentication/domain/repositories/i_user.dart';
import 'package:home_cure/features/authentication/domain/usecases/get_me.dart';
import 'package:home_cure/features/authentication/domain/usecases/get_our_doctors.dart';
import 'package:home_cure/features/authentication/domain/usecases/get_user.dart';
import 'package:home_cure/features/authentication/domain/usecases/update_provider.dart';
import 'package:home_cure/features/authentication/domain/usecases/update_user.dart';
import 'package:home_cure/features/authentication/domain/usecases/update_user_details.dart';
import 'package:home_cure/features/authentication/domain/usecases/upload_attachment.dart';
import 'package:home_cure/features/authentication/domain/usecases/upload_provider_attachment.dart';
import 'package:home_cure/features/authentication/domain/usecases/upload_provider_photo.dart';
import 'package:home_cure/features/authentication/domain/usecases/upload_user_photo.dart';
import 'package:home_cure/features/authentication/presentation/bloc/authentication_bloc.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/get_provider_cubit.dart';
import 'package:home_cure/features/authentication/presentation/usr_bloc/user_cubit.dart';
import 'package:home_cure/features/calling/data/datasources/comapny_settings_datasource.dart';
import 'package:home_cure/features/calling/data/repositories/company_settings_repo.dart';
import 'package:home_cure/features/calling/domain/repositories/i_comapny_settings_repo.dart';
import 'package:home_cure/features/calling/presentation/bloc/calling_bloc.dart';
import 'package:home_cure/features/calling/presentation/bloc/comlainment_cubit.dart';
import 'package:home_cure/features/home/data/datasources/services_remote.dart';
import 'package:home_cure/features/home/data/repositories/services_repo.dart';
import 'package:home_cure/features/home/domain/repositories/i_services.dart';
import 'package:home_cure/features/home/domain/usecases/get_ads.dart';
import 'package:home_cure/features/home/domain/usecases/get_service.dart';
import 'package:home_cure/features/home/domain/usecases/get_timeslot.dart';
import 'package:home_cure/features/home/presentation/blocs/ads_cubit/ads_cubit.dart';
import 'package:home_cure/features/home/presentation/blocs/home_bloc/home_bloc.dart';
import 'package:home_cure/features/home/presentation/blocs/our_doctors_cubit/our_doctors_cubit.dart';
import 'package:home_cure/features/home/presentation/blocs/timeslot_cubit/timeslot_cubit.dart';
import 'package:home_cure/features/login/presentation/bloc/login_bloc.dart';
import 'package:home_cure/features/login/presentation/change_phone_number_cubit/change_phone_number_cubit.dart';
import 'package:home_cure/features/login/presentation/change_phone_number_fiebase_cubit/change_phone_number_firebase_cubit.dart';
import 'package:home_cure/features/login/presentation/forget_password_bloc/forget_password_cubit.dart';
import 'package:home_cure/features/login/presentation/forget_password_firebase_bloc/forget_password_firebase_cubit.dart';
import 'package:home_cure/features/login/presentation/verify_otp%20_firebase/verify_otp_fiebase_cubit.dart';
import 'package:home_cure/features/login/presentation/verify_otp/verify_otp_cubit.dart';

final getIt = GetIt.instance;

Future<void> init() async {
  getIt
    // Utils
    ..registerLazySingleton<ApiClient>(ApiClient.new)

    // Data Sources
    ..registerLazySingleton<ITokenStorage>(TokenStorage.new)
    ..registerLazySingleton<IAuthRemotDataSource>(
      () => AuthRemotDataSource(getIt<ApiClient>()),
    )
    ..registerLazySingleton<IAppointmentRemote>(
      () => AppointmentRemote(getIt<ApiClient>()),
    )
    ..registerLazySingleton<IComapnySettingsRemote>(
      () => ComapnySettingsRemote(getIt<ApiClient>()),
    )
    ..registerLazySingleton<IUserRemote>(() => UserRemote(getIt()))
    ..registerLazySingleton<IServicesRemote>(() => ServicesRemote(getIt()))

    /// Repositories
    ..registerLazySingleton<IAuthenticationRepository>(
      () => AuthenticationRepository(
        authenticationLocalDataSource: getIt<ITokenStorage>(),
        authRemotDataSource: getIt<IAuthRemotDataSource>(),
        apiConfig: getIt(),
      ),
    )
    ..registerLazySingleton<IUserRepository>(() => UserRepository(getIt()))
    ..registerLazySingleton<IComapnySettingsRepository>(
      () => ComapnySettingsRepository(getIt()),
    )
    ..registerLazySingleton<IServicesRepository>(
      () => ServicesRepository(getIt()),
    )
    ..registerLazySingleton<IAppointmentRepository>(
      () => AppointmentsRepository(getIt()),
    )
    //Use Cases
    ..registerLazySingleton<GetAds>(() => GetAds(getIt()))
    ..registerLazySingleton<GetMe>(() => GetMe(getIt()))
    ..registerLazySingleton<GetUser>(() => GetUser(getIt()))
    ..registerLazySingleton<UpdateUser>(() => UpdateUser(getIt()))
    ..registerLazySingleton<UpdateProvider>(() => UpdateProvider(getIt()))
    ..registerLazySingleton<UpdateUserDetails>(() => UpdateUserDetails(getIt()))
    ..registerLazySingleton<GetTimeSlots>(() => GetTimeSlots(getIt()))
    ..registerLazySingleton<StartVideo>(() => StartVideo(getIt()))
    ..registerLazySingleton<CheckTimeSlot>(() => CheckTimeSlot(getIt()))
    ..registerLazySingleton<UploadUserAttachments>(
      () => UploadUserAttachments(getIt()),
    )
    ..registerLazySingleton<UploadUserPhoto>(
      () => UploadUserPhoto(getIt()),
    )
    ..registerLazySingleton<UploadProviderPhoto>(
      () => UploadProviderPhoto(getIt()),
    )
    ..registerLazySingleton<UploadProviderAttachments>(
      () => UploadProviderAttachments(getIt()),
    )
    ..registerLazySingleton<GetServices>(() => GetServices(getIt()))
    ..registerLazySingleton<CreateAppointment>(() => CreateAppointment(getIt()))
    ..registerLazySingleton<PhoneAuthService>(PhoneAuthService.new)
    ..registerLazySingleton<UserPay>(() => UserPay(getIt()))
    ..registerLazySingleton<ProviderPay>(() => ProviderPay(getIt()))
    ..registerLazySingleton<GetAppointments>(() => GetAppointments(getIt()))
    ..registerLazySingleton<CreatePaymentLink>(() => CreatePaymentLink(getIt()))
    ..registerLazySingleton<AcceptAppointment>(() => AcceptAppointment(getIt()))
    ..registerLazySingleton<GetProvider>(() => GetProvider(getIt()))
    ..registerLazySingleton<RateAppointment>(() => RateAppointment(getIt()))
    ..registerLazySingleton<Cancel>(() => Cancel(getIt()))
    ..registerLazySingleton<GetOurDoctors>(() => GetOurDoctors(getIt()))
    ..registerLazySingleton<DeleteProviderAttachments>(
      () => DeleteProviderAttachments(getIt()),
    )
    ..registerLazySingleton<DeleteUserAttachments>(
      () => DeleteUserAttachments(getIt()),
    )
    ..registerLazySingleton<OnPorogressAppointment>(
      () => OnPorogressAppointment(getIt()),
    )
    ..registerLazySingleton<DoneAppointment>(() => DoneAppointment(getIt()))
    ..registerLazySingleton<AdsCubit>(() => AdsCubit(getIt()))

    // ..registerLazySingleton<GetBootamps>(() => GetBootamps(getIt()))
    // ..registerLazySingleton<GetCourses>(() => GetCourses(getIt()))
    // ..registerLazySingleton<Search>(() => Search(repository: getIt()))
    // Blocs
    ..registerFactory<AuthenticationBloc>(
      () => AuthenticationBloc(
        authenticationRepository: getIt(),
        getMe: getIt(),
      ),
    )
    ..registerFactory<GetProviderCubit>(
      () => GetProviderCubit(
        getProvider: getIt(),
      ),
    )
    ..registerFactory<UserCubit>(
      () => UserCubit(
        deleteUserAttachments: getIt(),
        deleteProviderAttachments: getIt(),
        getMe: getIt(),
        updateUser: getIt(),
        updateUserDetails: getIt(),
        uploadUserAttatchment: getIt(),
        uploadUserPhoto: getIt(),
        updateProvider: getIt(),
        uploadProviderPhoto: getIt(),
        uploadProviderAttachments: getIt(),
        getUser: getIt(),
      ),
    )
    ..registerFactory<ForgetPasswordCubit>(
      () => ForgetPasswordCubit(authenticationRepository: getIt()),
    )
    ..registerFactory<ForgetPasswordFirebaseCubit>(
      () => ForgetPasswordFirebaseCubit(authenticationRepository: getIt()),
    )
    ..registerFactory<ChangePhoneNumberCubit>(
      () => ChangePhoneNumberCubit(authenticationRepository: getIt()),
    )
    ..registerFactory<ChangePhoneNumberFirebaseCubit>(
      () => ChangePhoneNumberFirebaseCubit(authenticationRepository: getIt()),
    )
    ..registerFactory<VerifyOtpCubit>(
      () => VerifyOtpCubit(authenticationRepository: getIt()),
    )
    ..registerFactory<VerifyOtpFirebaseCubit>(
      () => VerifyOtpFirebaseCubit(authenticationRepository: getIt()),
    )
    ..registerFactory<LoginBloc>(
      () => LoginBloc(authenticationRepository: getIt()),
    )
    ..registerFactory<SingUpBloc>(
      () => SingUpBloc(authenticationRepository: getIt()),
    )
    ..registerFactory<CallingBloc>(
      () => CallingBloc(repository: getIt()),
    )
    ..registerFactory<HomeBloc>(
      () => HomeBloc(servicesRepository: getIt()),
    )
    ..registerFactory<ComplaintCubit>(
      () => ComplaintCubit(repository: getIt()),
    )
    ..registerFactory<AppointmentsParamsCubit>(
      AppointmentsParamsCubit.new,
    )
    ..registerFactory<TimeSlotCubit>(
      () => TimeSlotCubit(getIt()),
    )
    ..registerFactory<OurDoctorsCubit>(
      () => OurDoctorsCubit(getIt()),
    )
    ..registerFactory<AppointmentsCubit>(
      () => AppointmentsCubit(
        rateAppointment: getIt(),
        doneAppointment: getIt(),
        onPorogressAppointment: getIt(),
        acceptAppointment: getIt(),
        createAppointement: getIt(),
        userPay: getIt(),
        providerPay: getIt(),
        createPaymentLink: getIt(),
        startVideo: getIt(),
        cancel: getIt(),
      ),
    )
    ..registerFactory<MyAppointmentsCubit>(
      () => MyAppointmentsCubit(getIt()),
    )
    ..registerFactory<AgoraTokenCubitCubit>(
      () => AgoraTokenCubitCubit(getIt()),
    );

  // ..registerFactory<SearchMovieCubit>(
  //         () => SearchMovieCubit(search: getIt(),
  //         loadingCubit: LoadingCubit()))
  // ..registerFactory<BootcampsBloc>(() =>
  //     BootcampsBloc(InitialBootcamps(), getBootamps: getIt<GetBootamps>()));
}
