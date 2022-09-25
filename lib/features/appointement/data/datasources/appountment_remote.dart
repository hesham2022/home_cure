import 'package:dio/dio.dart';
import 'package:home_cure/core/api_config/index.dart';
import 'package:home_cure/features/appointement/data/models/agora_token_model.dart';
import 'package:home_cure/features/appointement/data/models/appoinmrnt_model.dart';
import 'package:home_cure/features/appointement/data/models/get_appointments_response.dart';
import 'package:home_cure/features/appointement/domain/entities/agora_token.dart';
import 'package:home_cure/features/appointement/domain/entities/appointment.dart';
import 'package:home_cure/features/appointement/domain/entities/done_params.dart';

abstract class IAppointmentRemote {
  IAppointmentRemote(this.apiConfig);
  final ApiClient apiConfig;
  Future<Appointment> createAppointement(Map<String, dynamic> body);
  Future<Appointment> userPayAppointment(String appointmentId);
  Future<void> cancel(String appointmentId);

  Future<Appointment> providerPayAppointment(String appointmentId);

  Future<AgoraToken> startVideo(String appointmentId);

  Future<Appointment> createPaymentLink(String appointmentId);
  Future<Appointment> acceptAppointment(String appointmentId);
  Future<Appointment> onProgressAppointment(String appointmentId);
  Future<Appointment> doneAppointment(DoneParams params);

  Future<List<Appointment>> getAppointments();

  Future<Appointment> updateAppointment(Map<String, dynamic> body);
}

class AppointmentRemote extends IAppointmentRemote {
  AppointmentRemote(super.apiConfig);

  @override
  Future<List<Appointment>> getAppointments() async {
    final response = await apiConfig.get(kApppointment);
    final data = response.data as Map<String, dynamic>;

    final appointmentResult = AppointmentResponse.fromJson(data);
    return appointmentResult.results;
  }

  @override
  Future<Appointment> createAppointement(Map<String, dynamic> body) async {
    final response =
        await apiConfig.post(kApppointment, body: FormData.fromMap(body));
    final data = response.data as Map<String, dynamic>;

    final appointmentResult = AppointmentModel.fromMap(data);
    return appointmentResult;
  }

  @override
  Future<Appointment> updateAppointment(Map<String, dynamic> body) async {
    final response = await apiConfig.patch(kUpdateMe, body: body);
    final data = response.data as Map<String, dynamic>;
    final appointmentResult = AppointmentModel.fromMap(data);
    return appointmentResult;
  }

  @override
  Future<void> cancel(String appointmentId) async {
    await apiConfig.delete('$kApppointment/$appointmentId');
  }

  @override
  Future<Appointment> userPayAppointment(String appointmentId) async {
    final response = await apiConfig.post(kUserPay + appointmentId);
    final data = response.data as Map<String, dynamic>;

    final appointmentResult = AppointmentModel.fromMap(data);
    return appointmentResult;
  }

  @override
  Future<Appointment> providerPayAppointment(String appointmentId) async {
    final response = await apiConfig.post(kPorividerPay + appointmentId);
    final data = response.data as Map<String, dynamic>;

    final appointmentResult = AppointmentModel.fromMap(data);
    return appointmentResult;
  }

  @override
  Future<AgoraToken> startVideo(String appointmentId) async {
    final response = await apiConfig.post(kStartVideo + appointmentId);
    final data = response.data as Map<String, dynamic>;

    final appointmentResult = AgoraTokenModel.fromMap(data);
    return appointmentResult;
  }

  @override
  Future<Appointment> createPaymentLink(String appointmentId) async {
    final response = await apiConfig.post(kCreatePaymentLink + appointmentId);
    final data = response.data as Map<String, dynamic>;

    final appointmentResult = AppointmentModel.fromMap(data);
    return appointmentResult;
  }

  @override
  Future<Appointment> acceptAppointment(String appointmentId) async {
    final response = await apiConfig.post(kAcceptAppointments + appointmentId);
    final data = response.data as Map<String, dynamic>;

    final appointmentResult = AppointmentModel.fromMap(data);
    return appointmentResult;
  }

  @override
  Future<Appointment> onProgressAppointment(String appointmentId) async {
    final response =
        await apiConfig.post(kOnProccessingAppointments + appointmentId);
    final data = response.data as Map<String, dynamic>;

    final appointmentResult = AppointmentModel.fromMap(data);
    return appointmentResult;
  }

  @override
  Future<Appointment> doneAppointment(DoneParams params) async {
    final response = await apiConfig.post(
      kDoneAppointments + params.id,
      body: params.toMap(),
    );
    final data = response.data as Map<String, dynamic>;

    final appointmentResult = AppointmentModel.fromMap(data);
    return appointmentResult;
  }
}
